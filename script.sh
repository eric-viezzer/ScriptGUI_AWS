#!/bin/bash

PURPLE='0;35'
NC='\033[0m'
VERSAO=11

clear
echo "
@@@  @@@  @@@  @@@@@@@@  @@@@@@@@  @@@@@@@       @@@@@@    @@@@@@    @@@@@@   @@@   @@@@@@   @@@@@@@  
@@@  @@@  @@@  @@@@@@@@  @@@@@@@@  @@@@@@@@     @@@@@@@@  @@@@@@@   @@@@@@@   @@@  @@@@@@@   @@@@@@@  
@@!  @@@  @@!       @@!  @@!       @@!  @@@     @@!  @@@  !@@       !@@       @@!  !@@         @@!    
!@!  @!@  !@!      !@!   !@!       !@!  @!@     !@!  @!@  !@!       !@!       !@!  !@!         !@!    
@!@  !@!  !!@     @!!    @!!!:!    @!@!!@!      @!@!@!@!  !!@@!!    !!@@!!    !!@  !!@@!!      @!!    
!@!  !!!  !!!    !!!     !!!!!:    !!@!@!       !!!@!!!!   !!@!!!    !!@!!!   !!!   !!@!!!     !!!    
:!:  !!:  !!:   !!:      !!:       !!: :!!      !!:  !!!       !:!       !:!  !!:       !:!    !!:    
 ::!!:!   :!:  :!:       :!:       :!:  !:!     :!:  !:!      !:!       !:!   :!:      !:!     :!:    
  ::::     ::   :: ::::   :: ::::  ::   :::     ::   :::  :::: ::   :::: ::    ::  :::: ::      ::    
   :      :    : :: : :  : :: ::    :   : :      :   : :  :: : :    :: : :    :    :: : :       :    
"
sleep 3
clear

echo "[Vizer] Olá, serei seu assistente!"
echo "[Vizer] Verificando aqui se você possui o Java instalado...;"

java -version
if [ $? -eq 0 ]; then
    echo "[Vizer] Java encontrado!"
    sleep 2
    clear
else
    echo "[Vizer] Java nao identificado, mas sem problemas, irei resolver isso agora!"
    echo "[Vizer] realmente deseja instalar o Java (S/N)?"
    read inst
    if [ \"$inst\" == \"s\" ]; then
        echo "[Vizer] Adicionando o repositório!"
        sleep 2
        sudo add-apt-repository ppa:webupd8team/java -y
        clear
        echo "[Vizer] Atualizando..."
        sleep 2
        sudo apt update -y
        clear
        if [ $VERSAO -eq 11 ]; then
            echo "[Vizer] Instalar a versão 11 do Java. Confirme a instalação quando solicitado ;D"
            sudo apt install default-jre
            apt install openjdk-11-jre-headless -y
            sleep 2
            clear
            echo "[Vizer] Java instalado com sucesso!"
        fi
    else
        echo "[Vizer] Você optou por não instalar o Java por enquanto!"
        sleep 3
        clear
    fi
fi
clear
echo "[Vizer] Verificando se possui voçe possui um docker..."
sleep 2
docker --version
if [ $? -eq 0 ]; then
    clear
    echo "[Vizer] Docker encontrado!"
    sleep 2
    clear
else
    clear
    echo "[Vizer] Docker nao foi encontrado :("
    sleep 2
    clear
    echo "[Vizer] Mas sem problemas, deseja instalar o docker (s/n)?"
    sleep 2
    read inst
    if [ \"$inst\" == \"s\" ]; then
        echo "[Vizer] Instalando o Docker..."
        sleep 2
        clear
        sudo apt install docker.io -y
        sleep 1
        clear
        echo "[Vizer] Docker instalado!!!"
        sleep 2
        clear
        echo "[Vizer] Iniciando o Docker..."
        sudo systemctl start docker
        sudo systemctl enable docker
        sleep 4
        clear
        echo "[Vizer] Docker iniciado com sucesso!!!"
        echo "[Vizer] Deseja executar o java? (s/n)"
        read inst
        if [ \"$inst\" == \"s\" ]; then
            echo "[Vizer] Coloque sua conta GitHub quando solicitado..."
            sleep 3
            clear
            cd /home/ubuntu/Desktop/
            git clone https://github.com/BandTec/2ADSB-2021-1-Grupo-03
            cd /home/ubuntu/Desktop/2ADSB-2021-1-Grupo-03/Java/projeto-zini/
            sudo docker run ziniapp
        else
            echo "[Zini] ok... :)"
            sleep 2
        fi
    else
        echo "[Vizer] Voce optou por nao instalar o docker..."
        sleep 2
        clear
        echo "[Vizer] Até a proxima :)"
        sleep 2
        clear
    fi
fi
