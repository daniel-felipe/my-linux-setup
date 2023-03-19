#!/bin/bash

source './setup/includes/utils.sh'

CURRENT_PATH=$(pwd)

# --- [ INSTALLING GO ]
echo -e "${INFO}[+] Installing go \033[0m"
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.20.2.linux-amd64.tar.gz
echo "export PATH=$PATH:/usr/local/go/bin" >> "$HOME/.profile" && source "$HOME/.profile"

# --- [ INSTALLING SUBFINDER ]
echo -e "${INFO}[+] Installing SUBFINDER \033[0m"
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
subfinder --version &> /dev/null
last_task_status

# --- [ INSTALLING HTTPX ]
echo -e "${INFO}[+] Installing HTTPX \033[0m"
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
httpx --version &> /dev/null
last_task_status

# --- [ INSTALLING NAABU ]
echo -e "${INFO}[+] Installing NAABU \033[0m"
go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
naabu --version &> /dev/null
last_task_status

# --- [ INSTALLING NOTIFY ]
echo -e "${INFO}[+] Installing NOTIFY \033[0m"
go install -v github.com/projectdiscovery/notify/cmd/notify@latest
notify --version &> /dev/null
last_task_status

# --- [ INSTALLING NUCLEI ]
echo -e "${INFO}[+] Installing NUCLEI \033[0m"
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
nuclei --version &> /dev/null
last_task_status
