#!/bin/bash
set -e
echo "Script ini tidak bisa dihentikan hingga proses selesai dijalankan."
echo "Lanjut Install Tema Nebula?"
echo "1. Lanjut"
echo "2. Batal"
read -p "Masukkan pilihanmu (1/2): " pilihan

case "$pilihan" in
  1)
    echo "Oke, mulai install tema Nebula..."
    echo "▀▄▀ █▀▄ █ █▀▄▀█ ▀█ █▀ █▀█ █▀▄ █▀▀"
    echo "█░█ █▄▀ █ █░▀░█ █▄ █▄ █▄█ █▄▀ ██▄"
    echo ""
    echo -e "\033[1;36m▶ Prosessing Install All Dependencies...\033[0m"
    apt update && apt upgrade -y
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    source "$NVM_DIR/nvm.sh"
    nvm install 24
    nvm use 24
    nvm alias default 24
    echo "Mengaktifkan Corepack..."
    corepack enable
    corepack prepare yarn@stable --activate
    curl -fsSL https://deb.nodesource.com/setup_24.x | sudo -E bash -
    sudo apt install -y nodejs
    apt install ruby -y
    gem install lolcat
    apt install toilet -y
    clear
    echo
    toilet -f big "Script By" | lolcat
    toilet -f big "XDimzCode" | lolcat
    echo
    figlet "Selamat Datang Di Nebula Installer" | lolcat
    echo -e "\033[1;32m📅 Tanggal:\033[0m $(date '+%A, %d %B %Y')" | lolcat
    echo -e "\033[1;34m⏰ Waktu:\033[0m $(date '+%H:%M:%S')" | lolcat
    echo -e "\033[1;36m🔌 Device:\033[0m Virtual Private Server" | lolcat
    echo -e "\033[1;35m💻 Shell :\033[0m bash" | lolcat
    echo -e "\033[1;33m🧠 Quote :\033[0m \"Fokus aja dulu sama karya lu. Nanti yang support juga bakal dateng sendiri.\""

    echo "「0」Prosessing Install Blueprint「0」"
    sudo apt-get install -y ca-certificates curl gnupg
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
    apt-get update
    apt-get install -y nodejs
    cd /var/www/pterodactyl
    yarn
    apt install -y zip unzip git curl wget
    cd ~/
    wget "$(curl -s https://api.github.com/repos/BlueprintFramework/framework/releases/latest | grep 'browser_download_url' | cut -d '"' -f 4)" -O release.zip
    mv release.zip /var/www/pterodactyl/release.zip
    cd /var/www/pterodactyl
    unzip release.zip
    touch /var/www/pterodactyl/.blueprintrc
    echo \
    'WEBUSER="www-data";
    OWNERSHIP="www-data:www-data";
    USERSHELL="/bin/bash";' >> /var/www/pterodactyl/.blueprintrc
    chmod +x blueprint.sh
    bash blueprint.sh
    echo "「0」Install Blueprint Succes✔「0」"
    clear
    echo "Continueing Install Nebula"
    cd ~/
    git clone https://github.com/xdimzcode/nebula-installer
    cd nebula-installer
    mv nebula.blueprint /var/www/pterodactyl
    cd /var/www/pterodactyl
    blueprint --install nebula
    echo "「0」Proses Install Selesai✔「0」"
    echo "┏━〔 Thank You For Using This Script 〕━┓"
    echo "┃Don't Forget To Follow Channel Developer"
    echo "┃Info Update Script:"
    echo "┃https://whatsapp.com/channel/0029VbAc86FBadmTNsOS0u2v"
    echo "┃This Script Make With 💞 By XDimzCode"
    echo "┗━━━━━━━━━━━━━━━━━━━━━┛"
    ;;
  2)
    echo "Install dibatalkan."
    exit 0
    ;;
  *)
    echo "Pilihan tidak valid!"
    exit 1
    ;;
esac