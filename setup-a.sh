#/bin/bash

################################################
# ONLY RUN THIS SCRIPT ONCE TO SET UP THE RPI. #
################################################

# Install Git
sudo apt -y install git

# Configure Git
git config --global user.email "nicks-spi@protonmail.com"
git config --global user.name "nicks-spi"

# Install GitHub client, gh
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt -y update
sudo apt -y install gh

echo "Run the following command in the terminal:"
echo "    gh auth login"
echo "and login to the SPi's GitHub account."