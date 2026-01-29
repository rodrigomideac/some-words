serve:
	fuser --kill 4000/tcp || true
	bundle exec jekyll serve > serve_log.txt &

