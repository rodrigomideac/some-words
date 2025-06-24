# Improving TimescaleDB write performance
We were migrating some data out of a TimescaleDB instance, and to cut the story short we couldn't use any default migration method, such as pg_dump, logical replication. etc.

The source instance was being fed by an Apache Flink job that were writing to 9 tables in batches. The Flink job had two topics as source, then it did a union of the streams to finally dump the data on the timescale. During steady-state, i.e., with zero Kafka topic lag from both topics, the insertion rate was around 9k rows/seg. We used a mix of temporary tables, COPY FROM and INSERT FROM to copy the deduplicated data to the final table.

Top elements that helped us to improve the ingestion rate:
- Dropping unecessary indexes before backfilling, and creating then later;
- Increasing AWS EBS IOPS and throughput;


Catalog bloat might be an issue, some places say that it should be less than 20MB [1]. To find out your catalog size, I am using `pg_gather` [2]:

```shell
cat gather.sql|kubectl exec -i timescale-db-things-events-cluster-1 -- psql -X -d iot_db -f - > out.tsv
# then I copy the results to a local postgres
psql -h localhost -p 5432 -d postgres -U postgres -f gather_schema.sql -f out.tsv
psql -h localhost -p 5432 -d postgres -U postgres  -X -f gather_report.sql > GatherReport.html
```

Then I look at the end of the tool and i can find that 
`The catalog metadata is :140.9MB For 3010 objects.`
I perform the instructions from [1] via `psql` on my table under investigation:

```sql
SET statement_timeout='5s';
SELECT 'VACUUM FULL pg_catalog.'|| tablename || ';' FROM pg_tables WHERE schemaname = 'pg_catalog';
\gexec
```

And after that my catalog metadata is reduced to 90MB. Not enough! This is due to a high usage of temporary tables for bulk writing.

[1] https://jobinau.github.io/pg_gather/catalogbloat.html
[2] https://github.com/jobinau/pg_gather
