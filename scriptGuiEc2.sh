#!/bin/bash
echo "Olá, vou te ajudar a instalar sua GUI na instancia..."
sleep 3
clear
echo "primeiro vamos mudar a senha do usuario"
sleep 3
clear
echo "coloque a senha quando solicitado"
sudo passwd ubuntu
echo "ok..."
sleep 3
clear
echo "vamos atualizar os pacotes do sistema!"
sleep 3
clear
sudo apt update && sudo apt upgrade
clear
echo "vamos instalar os outros pacotes!!"
sleep 3
clear 
echo "precione <ENTER> ao aparecer a tela rosa!!"
sleep 3
clear
sudo apt-get install xrdp lxde-core lxde tigervnc-standalone-server -y
clear 
echo "tudo pronto! basta conectar no ambiente... bye bye :D"
sleep 3
clear
