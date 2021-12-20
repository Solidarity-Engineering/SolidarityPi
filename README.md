# SolidarityPi
Our implementation of the Kolibri ecosystem

## Mostly Automatic Quickstart
This section assumes you have a flashdrive with the `setup-a.sh` and `setup-b.sh` scripts plugged into your SolidarityPi. If you don't, skip to the "Manual Quickstart" section.

The first time you start your SolidarityPi, it will take approximately 20 minutes to boot. When it does, enter the username `pi` and password `kolibrifly`.

Make sure you have your flashdrive with the `setup.sh` script plugged into the SolidarityPi. When you see the terminal prompt `pi@kolibri:~ $`, copy `setup.sh` from the flashdrive using something similar to the following command:
```
cp /media/ESD-USB/setup-a.sh .
cp /media/ESD-USB/setup-b.sh .
```
Confirm that you have successfully copied the file by typing `ls` into the terminal and pressing enter. The terminal should say `setup-a.sh    setup-b.sh`.

Run the setup script using
```
bash setup-a.sh
```

Login to the SolidarityPi's GitHub account by entering:
```
gh auth login
```
and providing the login information. Then, run the second bash script using:
```
bash setup-b.sh
```

Reboot your SolidarityPi, or enter `sudo systemctl start db-backup.service` to begin the automatic backup.