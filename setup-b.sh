#/bin/bash

################################################
# ONLY RUN THIS SCRIPT ONCE TO SET UP THE RPI. #
################################################

# Clone Repo
gh repo clone Solidarity-Engineering/Solidarity-Pi-Bkups
gh repo clone Solidarity-Engineering/SolidarityPi

# Setup service
cp SolidarityPi/bkup-service.sh .
chmod u+x bkup-service.sh
sudo cp SolidarityPi/db-backup.service /etc/systemd/system/db-backup.service
sudo systemctl enable db-backup.service
# sudo systemctl start db-backup.service