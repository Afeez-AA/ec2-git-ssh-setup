# GitHub SSH Setup Script

This repository contains a simple Bash script that automates the setup of Git and SSH configuration on an EC2 instance. The script ensures that Git operations such as pushing code to GitHub are performed using your personal GitHub account instead of the default `ubuntu` user.

## Features
- Configures Git with your GitHub username and email.
- Generates an SSH key if one doesn't exist at the default location (`~/.ssh/id_rsa`).
- Automatically adds the SSH key to the SSH agent for secure GitHub authentication.
- Displays the SSH public key, ready to be added to your GitHub account for SSH-based Git operations.
- Tests SSH connectivity to GitHub.

## Prerequisites
Before running this script, ensure you have:
- An active EC2 instance running Ubuntu.
- Git installed on the instance.
- An existing GitHub account.

## How to Use
1. Clone this repository to your EC2 instance:
   ```bash
   git clone https://github.com/Afeez-AA/setup_git_github.git
   cd setup_git_github
   ```

2. Modify the script to include your GitHub username and email at the top:
   ```bash
   GITHUB_USERNAME="your_username"
   GITHUB_EMAIL="your_email@example.com"
   ```

3. Make the script executable:
   ```bash
   chmod +x setup_git_github.sh
   ```

4. Run the script:
   ```bash
   ./setup_git_github.sh
   ```

5. After the script runs, copy the SSH public key displayed in the terminal and add it to your GitHub account under **Settings > SSH and GPG keys**.

6. Test the SSH connection to GitHub using the command provided by the script to ensure everything is set up correctly.

## Notes
- If an SSH key already exists at `~/.ssh/id_rsa`, the script will not overwrite it. You can manually regenerate the key by deleting the existing one or specifying a custom path in the script.
- The SSH key generated does not have a passphrase for ease of use (if security is a concern, modify the script to prompt for one).

## Troubleshooting
If you encounter issues pushing code to GitHub via SSH, check the following:
- Ensure that the SSH key has been added to your GitHub account.
- Run the script again to confirm the SSH agent is running and the key is loaded.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
