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

## Manual Quickstart
Log into and connect your Solidarity Pi to the internet. Install git via:
```
sudo apt -y install git
```

Configure git using your Pi's GitHub username and email. For example:
```
git config --global user.email "nicks-spi@protonmail.com"
git config --global user.name "nicks-spi"
```

Install the GitHub client via:
```
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt -y update
sudo apt -y install gh
```

Login to the SolidarityPi's GitHub account by entering:
```
gh auth login
```
and providing the login information.

Clone the Solidarity Pi repositories via:
```
gh repo clone Solidarity-Engineering/Solidarity-Pi-Bkups
gh repo clone Solidarity-Engineering/SolidarityPi
```

The last thing you need to do is set up the service that backs up the kolibri database to the GitHub repository whenever the Pi connects to the internet. Enter the following:
```
cp SolidarityPi/bkup-service.sh .
chmod u+x bkup-service.sh
sudo cp SolidarityPi/db-backup.service /etc/systemd/system/db-backup.service
sudo systemctl enable db-backup.service
```

Finally, either reboot or enter
```
sudo systemctl start db-backup.service
```
to start the automated backup service.