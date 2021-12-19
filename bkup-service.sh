#!/bin/bash

# Create Backup of Database
# See https://kolibri.readthedocs.io/en/latest/manage/command_line.html
kolibri manage dbbackup

# Copy Backups into git repo
cp -r ~/.kolibri/backups/* ~/Solidarity-Pi-Bkups/

# Push update to remote
cd ~/Solidarity-Pi-Bkups
git pull
git add *
git commit -a -m "Automated Commit"
git push
