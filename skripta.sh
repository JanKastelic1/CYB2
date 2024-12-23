#!/bin/bash

if lsb_release -a > /dev/null 2>&1; then
    # Install dependencies
    pip install python-dotenv
    cd ..
    cd Documents/
    touch network_ips.txt
    mkdir nmapp
    cd nmapp/
    git clone https://github.com/JanKastelic1/NMAP_CYB.git
    cd ..

    # Run networking commands
    ifconfig > ifconfig_output.txt
    grep -E 'inet|netmask' ifconfig_output.txt > inet_mask_output.txt

    # Navigate to the project directory and run the script
    cd nmapp/NMAP_CYB/
    python3 netips.py

    # Run Nmap scan (ensure the network_ips.txt file exists)
    nmap -T5 -F --min-parallelism 100 -iL ~/Documents/network_ips.txt -oN ~/Documents/scan_results.txt --exclude 127.0.0.0/8

    # Create .env for Telegram Bot integration
    cd ~/Documents/nmapp/NMAP_CYB/
    touch .env
    echo "TELEGRAM_BOT_TOKEN=7705762228:AAG3jKGXa8FnUZZ6FaWKznQa02y7TShu_fk" >> .env
    echo "TELEGRAM_CHAT_ID=-4531222193" >> .env

    # Run the Telegram bot script
    python3 bot.py
else
    echo "lsb_release command not found or not available."
    exit 1
fi