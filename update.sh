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

echo -e "\e[1m\e[32m 22 Mayıs Güncellemesi Yükleniyor \e[0m"  && sleep 2
export PATH="/root/.aztec/bin:$PATH"
aztec-up alpha-testnet
aztec
rm -rf /root/.aztec/alpha-testnet/data

echo -e "\e[1m\e[32m Node Başlatılıyor.. \e[0m"  && sleep 2

aztec start --node --archiver --sequencer \
  --network alpha-testnet \
  --l1-rpc-urls $RPC  \
  --l1-consensus-host-urls $BEACON \
  --sequencer.validatorPrivateKey $Priv \
  --sequencer.coinbase $Adres \
  --p2p.p2pIp $IP
  --p2p.maxTxPoolSize 1000000000
