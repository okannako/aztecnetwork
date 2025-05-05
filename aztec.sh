#!/bin/bash
echo -e "\033[0;37m"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++";
echo " #####   ####        ####        ####  ####    ######    ##########  ####    ####  ###########   ####  ####";
echo " ######  ####       ######       #### ####    ########   ##########  ####    ####  ####   ####   #### ####";
echo " ####### ####      ###  ###      ########    ####  ####     ####     ####    ####  ####   ####   ########";   
echo " #### #######     ##########     ########   ####    ####    ####     ####    ####  ###########   ########";
echo " ####  ######    ############    #### ####   ####  ####     ####     ####    ####  ####  ####    #### ####";  
echo " ####   #####   ####      ####   ####  ####   ########      ####     ############  ####   ####   ####  ####";
echo " ####    ####  ####        ####  ####   ####    ####        ####     ############  ####    ####  ####   ####";
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++";
echo -e '\e[36mTwitter :\e[39m' https://twitter.com/NakoTurk
echo -e '\e[36mGithub  :\e[39m' https://github.com/okannako
echo -e '\e[36mYoutube :\e[39m' https://www.youtube.com/@CryptoChainNakoTurk
echo -e "\e[0m"
sleep 5

echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

echo -e "\e[1m\e[32m Güncellemeler ve Bütün Gereksinimler Yükleniyor. Bitene kadar Bekleyin.. \e[0m"  && sleep 2

sudo apt update && sudo apt install make gcc ocl-icd-opencl-dev nano tmux ocl-icd-libopencl1 libleveldb-dev libopencl-clang-dev libgomp1 curl git tar wget build-essential -y && sudo apt install wget -y && cd $HOME
curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh
curl -s https://install.aztec.network | bash
aztec
aztec-up alpha-testnet

echo -e "\e[1m\e[32m Node Başlatmak için Atamaları Yapın.. \e[0m"  && sleep 2

echo -n "RPC_URL Girin: " RPC
echo -n "BEACON_URL Girin: " BEACON
echo -n "Cüzdan Private Key Girn: " Priv
echo -n "Cüzdan Adresi Girin: " Adres
echo -n "Sunucu IP Girin: " IP


echo -e "\e[1m\e[32m Node Başlatılıyor.. \e[0m"  && sleep 2

aztec start --node --archiver --sequencer \
  --network alpha-testnet \
  --l1-rpc-urls $RPC  \
  --l1-consensus-host-urls $BEACON \
  --sequencer.validatorPrivateKey $Priv \
  --sequencer.coinbase $Adres \
  --p2p.p2pIp $IP
  --p2p.maxTxPoolSize 1000000000


