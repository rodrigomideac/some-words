---
layout: post
title:  "Keeping it simple for my digital lige"
date:   2026-01-12 13:00:00 -0300
categories: homelab
---

I have the following setup that revolves my analog life:

- A self built NAS with OMV running on it. Runs on 15W on idle, it has a Pentium with 2 cores and 4 threads and 32GB of RAM (non-ECC).
- A Proxmox node with a single VM where it runs all self hosted applications as docker containers and scripts. It is a Dell Optiplex 3050 with 4 CPUs and 32GB of RAM. No ECC RAM either.
- A desktop PC with dual boot (Windows and Arch Linux), mainly used as gaming box.

I'm tired, a father of two beatiful kids and without much time to spare maintaining stuff. I learned through these years as a software engineer that simple is better and boring technology is nice. So I decided to fully overhaul my setup. And here are some issues that I am tackling:j

# Poor-man's UPS (i.e., no UPS at all)

A very important app is served to close ones in my VM. But, every so often the power goes down here at home and the proxmox node either doesnt automatic reboot (it has automatic power on setup in the BIOS), or it gets stuck. To make things worse my self built NAS don't turn on automatically either.

After several years I took both PCs out of my "server rack" (it is actually just a small cabinet kind of inaccessible by my kids), plugged the monitor and booted them.

I found out that my old Dell 3050 CMOS battery was completely drained, and whenever it was turned on, it wouldn't turn on without manual keyboard input the first time. I replaced the CMOS battery and problem solved (it already had automatic turn on when the outlet power is gone and back on).

On my NAS I enabled the same feature. 

Also, I enabled wake-on-lan (WOL) on both PCs, annotated their MACs, and created a script on all my computers on my network to trigger WOL packets from time to time.

I did some manual testing. and it worked reasonably well.

# Reliability

Of course this setup is prone to file corruption during power failures. I don't store critical data on my homelab because I know I don't have the necessary guarantees for that. I don't have redundancy, I don't have error correction on my RAM sticks, and no UPS at all (yet). My most precious data are pictures and videos of my family, around 50k of them. Every year I buy a second hand 1 TB HDD for cold backups, run some stress test to find out if they are good, and put 1 TB of my most recent data on it. I generate much less than 1 TB per year, so there will be multiple copies of the same file spread on several HDDs. Not to mention that I still rely on iCloud to keep most of my data.

I am going to implement a more "fresh" backup routine, but it is topic for another post.

