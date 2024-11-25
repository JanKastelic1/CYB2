# CYB2


# Network Scanner with Telegram Notification

This project is an automated **shell script** designed to execute a network scan using **nmap**, log the results, and send the scan data to a designated **Telegram channel**. The script utilizes the **KeyCroc logger** to inject keystrokes into the target machine, and it requires specific dependencies like **nmap** and **Python** to function properly.

## Features

- **Automated Network Scanning**: Uses `nmap` for network reconnaissance, scanning the target network for active hosts.
- **Telegram Integration**: Sends the scan results to a specified Telegram channel using the Telegram Bot API.
- **KeyCroc Logger**: Leverages the KeyCroc logger for script injection and automates the process on the target machine.

## Requirements

1. **nmap**: Must be installed on the target machine for network scanning.
2. **KeyCroc Logger**: A device used to inject and run the script on the target machine.
3. **Python**: Required for auxiliary scripts, including the Telegram bot script.
4. **Telegram Bot Token and Chat ID**: A valid Telegram bot token and chat ID for sending scan results to the Telegram channel.
5. **git**: Must be on the target machine.

## Installation

### Step 1: Install nmap

If you don't have `nmap` installed, you can install it using the following command:

#### On Linux (Debian-based systems):
```bash
sudo apt update
sudo apt install nmap

Then just type nmap anywhere, and process should start.
