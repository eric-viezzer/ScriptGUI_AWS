#!/bin/bash

PURPLE='0;35'
NC='\033[0m'
VERSAO=11

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
sleep 5
clear

echo "[Vizer] Olá, serei seu assistente java!;"
echo "[Vizer] Verificando aqui se você possui o Java instalado...;"

java -version
if [ $? -eq 0 ]; then
    echo "[Vizer] Java encontrado!"
    sleep 2
    clear
    echo "[Vizer] Deseja criar um Docker (S/N)?"
    read inst
    if [ \"$inst\" == \"s\" ]; then
        sudo apt update
        clear
        echo "[Vizer] Confirme quando solicitado..."
        sleep 3
        sudo apt install docker.io
        clear
        sudo systemctl start docker
        sudo systemctl enable docker
        sleep 3
        clear
        echo "[Vizer] Verificando versão do Docker..."
        docker --version
        sleep 2
        clear
        echo "[Vizer] Instalando mysql..."
        sleep 2
        clear
        sudo docker pull mysql:5.7
        clear
        echo "[Vizer] Listando todas as imagens"
        sleep 2
        clear
        echo "[Vizer] Confinando aplicação Mysql em um conteiner"
        sleep 2
        clear
        sudo docker run -d -p 3306:3306 --name ConteinerMysql -e "MYSQL_DATABASE=bancoMysql" -e "MYSQL_ROOT_PASSWORD=urubu100" mysql:5.7
        echo "[Vizer] Vamos ver oq temos no conteiner"
        sleep 2
        clear
        sudo docker ps
        echo "[Vizer] Deseja abrir o software Zini (S/N)?"
        sleep 3
        clear
        read inst
        if [ \"$inst\" == \"s\" ]; then
            cd /home/ubuntu/Desktop/2ADSB-2021-1-Grupo-03/Java/projeto-zini/target
            java -jar projeto-zini-1.0-SNAPSHOT-jar-with-dependencies.jar
        else
            echo"[Vizer] ok..."
            clear
            sleep 5
        fi
    else
        clear
        echo "[Vizer] ok..."
        sleep 5
        echo "[Vizer] Deseja abrir o software Zini (S/N)?"
        read inst
        if [ \"$inst\" == \"s\" ]; then
            cd /home/ubuntu/Desktop/2ADSB-2021-1-Grupo-03/Java/projeto-zini/target
            java -jar projeto-zini-1.0-SNAPSHOT-jar-with-dependencies.jar
        else
            echo"[Vizer] ok..."
            clear
            sleep 5
        fi
    fi
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
            echo "[Vizer] Deseja criar um Docker (S/N)?"
            read inst
            if [ \"$inst\" == \"s\" ]; then
                sudo apt update
                clear
                echo "[Vizer] Confirme quando solicitado..."
                sleep 2
                sudo apt install docker.io
                clear
                sudo systemctl start docker
                sudo systemctl enable docker
                sleep 2
                clear
                echo "[Vizer] Verificando versão do Docker..."
                docker --version
                sleep 2
                clear
                echo "[Vizer] Instalando mysql..."
                sleep 2
                clear
                sudo docker pull mysql:5.7
                clear
                echo "[Vizer] Listando todas as imagens"
                sleep 2
                clear
                echo "[Vizer] Confinando aplicação Mysql em um conteiner"
                sleep 2
                clear
                sudo docker run -d -p 3306:3306 --name ConteinerMysql -e "MYSQL_DATABASE=bancoMysql" -e "MYSQL_ROOT_PASSWORD=urubu100" mysql:5.7
                echo "[Vizer] Vamos ver oq temos no conteiner"
                sleep 2
                clear
                sudo docker ps
            else
                clear
                echo "[Vizer] ok..."

                sleep 2
                clear

                echo "[Vizer] Deseja abrir o software Zini (S/N)?"
                read inst
                if [ \"$inst\" == \"s\" ]; then
                    cd /home/ubuntu/Desktop/2ADSB-2021-1-Grupo-03/Java/projeto-zini/target
                    java -jar projeto-zini-1.0-SNAPSHOT-jar-with-dependencies.jar
                else
                    echo"[Vizer] ok..."
                    clear
                    sleep 2
                fi

            fi
        fi
    else
        echo "[Vizer] Você optou por não instalar o Java por enquanto, até a próxima então!"
        sleep 3
        clear
        echo "[Vizer] Deseja criar um Docker (S/N)?"
        read inst
        if [ \"$inst\" == \"s\" ]; then
            sudo apt update
            clear
            echo "[Vizer] Confirme quando solicitado..."
            sleep 3
            sudo apt install docker.io
            clear
            sudo systemctl start docker
            sudo systemctl enable docker
            sleep 3
            clear
            echo "[Vizer] Verificando versão do Docker..."
            docker --version
            sleep 2
            clear
            echo "[Vizer] Instalando mysql..."
            sleep 2
            clear
            sudo docker pull mysql:5.7
            clear
            echo "[Vizer] Listando todas as imagens"
            sleep 2
            clear
            echo "[Vizer] Confinando aplicação Mysql em um conteiner"
            sleep 2
            clear
            sudo docker run -d -p 3306:3306 --name ConteinerMysql -e "MYSQL_DATABASE=bancoMysql" -e "MYSQL_ROOT_PASSWORD=urubu100" mysql:5.7
            echo "[Vizer] Vamos ver oq temos no conteiner"
            sleep 2
            clear
            sudo docker ps
        fi
    fi
fi

# ===================================================================
# Todos direitos reservados para o autor: Dra. Profa. Marise Miranda.
# Sob licença Creative Commons @2020
# Podera modificar e reproduzir para uso pessoal.
# Proibida a comercialização e a exclusão da autoria.
# ===================================================================
