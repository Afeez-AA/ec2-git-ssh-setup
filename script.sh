#!/bin/bash

# Variables for GitHub account setup
GITHUB_USERNAME="Afeez-AA"    # Replace with your GitHub username
GITHUB_EMAIL="afeezadeboyee@gmail.com"  # Replace with your GitHub email

# Update and install necessary packages
sudo apt-get update -y
sudo apt-get install -y git openssh-client

# Set up git configuration for the user
git config --global user.name "$GITHUB_USERNAME"
git config --global user.email "$GITHUB_EMAIL"

# Check if SSH keys already exist
if [ ! -f ~/.ssh/id_rsa ]; then
  echo "Generating SSH key at the default location (~/.ssh/id_rsa)..."
  ssh-keygen -t rsa -b 4096 -C "$GITHUB_EMAIL" -N "" -f ~/.ssh/id_rsa
else
  echo "SSH key already exists at ~/.ssh/id_rsa"
fi

# Ensure the SSH agent is running and add the SSH key
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

# Display public key to be added to GitHub
echo "Copy the following SSH public key and add it to your GitHub account:"
echo ""
cat ~/.ssh/id_rsa.pub
echo ""
echo "Go to https://github.com/settings/keys and add a new SSH key."

# Test SSH connection to GitHub
echo "Testing SSH connection to GitHub..."
ssh -T git@github.com

# Guide for next steps
echo ""
echo "Git setup complete!"
echo "You can now push to your GitHub repositories using SSH."

# Optional: Clone a repository to test (comment out if not needed)
# git clone git@github.com:<your-username>/<your-repo>.git
