#!/bin/bash

source './setup/includes/utils.sh'

# --- [ INSTALLING GO ]
go version &> /dev/null
if [ $? -ne 0 ]; then
    echo -e "${INFO}[+] Installing go \033[0m"
    wget https://go.dev/dl/go1.20.2.linux-amd64.tar.gz -O go.tar.gz &> /dev/null
    sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf "$BASE_DIR/go.tar.gz"
    rm "$BASE_DIR/go.tar.gz"
    echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.profile && source ~/.profile
fi

# --- [ SETTING UP TOOLS PATH ]
grep "$HOME/go/bin" ~/.zshrc &> /dev/null
if [ $? -ne 0 ]; then
    echo "export PATH=$PATH:$HOME/go/bin" >> ~/.zshrc
    source ~/.zshrc
fi

# --- [ INSTALLING SUBFINDER ]
subfinder --version &> /dev/null
if [ $? -ne 0 ]; then
    echo -e "${INFO}[+] Installing SUBFINDER \033[0m"
    go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
    subfinder --version &> /dev/null
    last_task_status
fi

# --- [ INSTALLING HTTPX ]
httpx --version &> /dev/null
if [ $? -ne 0 ]; then
    echo -e "${INFO}[+] Installing HTTPX \033[0m"
    go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
    httpx --version &> /dev/null
    last_task_status
fi

# --- [ INSTALLING NAABU ]
naabu --version &> /dev/null
if [ $? -ne 0 ]; then
    echo -e "${INFO}[+] Installing NAABU \033[0m"
    go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
    naabu --version &> /dev/null
    last_task_status
fi

# --- [ INSTALLING NOTIFY ]
notify --version &> /dev/null
if [ $? -ne 0 ]; then
    echo -e "${INFO}[+] Installing NOTIFY \033[0m"
    go install -v github.com/projectdiscovery/notify/cmd/notify@latest
    notify --version &> /dev/null
    last_task_status
fi

# --- [ INSTALLING NUCLEI ]
nuclei --version &> /dev/null
if [ $? -ne 0 ]; then
    echo -e "${INFO}[+] Installing NUCLEI \033[0m"
    go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
    nuclei --version &> /dev/null
    last_task_status
fi

# --- [ INSTALLING INTERACT.SH ]
interactsh-client --version &> /dev/null
if [ $? -ne 0 ]; then
    echo -e "${INFO}[+] Installing INTERACT.SH \033[0m"
    go install -v github.com/projectdiscovery/interactsh/cmd/interactsh-client@latest
    nuclei --version &> /dev/null
    last_task_status
fi

# --- [ INSTALLING SPOTIFY-DL ]
echo -e "${INFO}[+] Installing SPOTIFY-DL"
pip install spofify_dl
