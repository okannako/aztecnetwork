<p align="center">
  <a href="">
    <img alt="Hero" src="https://github.com/user-attachments/assets/24051f3b-7f55-465b-b389-6cc7f5f46146" width="75%" />
  </a>
</p>

## Tavsiye Edilen Sistem Gereksinimleri
- CPU: 4-8 ÇEKİRDEK
- RAM: 8-16 GB
- SSD: 1 TB (Sadece rol alacaksanız 100GB da yeter)
- İşletim Sistemi: Ubuntu 22.04LTS

## Kurulum Adımları ve Kodları
- Aztec Network test ağını başlattı ve node kurulumunda da Discord'da rol veriyor. Rol alıp kapatıp kapatmamak sizin kararanız ileriye dönük ne olur bilinmez. Zaten takım airdrop olmayacağını açıkladı. Kurmak isteyen çok fazla kişi olduğu için kılavuz ve video yayınlaamya karar verdimn. Şimdi adım adım işlemlere geçelim. Node kurulumunu en son yapacağız. Öncesinde yapmamız gereken ve elde etmemiz gereken gereksinimler mevcut.

1-) İlk olarak ```https://dashboard.alchemy.com``` sitesine girip üyelik oluşturup Create New App'e tıklayıp isim verip, daha sonraki ekranbda Ethereum tıklayıp sağ alttan onaylamayı yaptıktan sonra app'i oluşturuyoruz. Görseldeki gibi networks kısmına geldikten sonra ağı Sepolia yapıp çıkan RPC'yi bir yere kopyalıyoruz.

![alchm1](https://github.com/user-attachments/assets/a90d38e2-81e1-45ed-8a39-5b777e08b4f9)
![alch2](https://github.com/user-attachments/assets/6a44bca8-ae3e-4aca-8c88-0d89134b6dd2)


2-) Şimdide ```https://drpc.org/dashboard``` üzerinden Beacon Rpc alacağız. Siteye gidip üyelik oluşturduktan sonra Endpoints kısmından kutucuğa Ethereum Beacon yazıyoruz ve çıkan Rpc'yi de bir yere kaydediyoruz.

![drpc1](https://github.com/user-attachments/assets/9888f9be-afc7-4fdd-95ac-73f219b0d02f)


3-) Şimdi yeni bir Met*mask cüzdanı oluşturup hem adresini hem de Private Key'ini alıyoruz. Daha sonra faucetten ETH Sepolia test ağında Eth alıyoruz ya da elinizde varsa oradan da atabilirsiniz. 0.1 yeterli ancak Validatör kaydı yapacaksanız ki şart değil, cüzdanda 2.4 ETH olmalı.                  

4-) Son olarak da kulllanacağımız Vps'in IP adresini bir yere kaydediyoruz                                                                                                                                                                                                                                  

5-) Aşağıdaki kodlarla hazırladığım scriptle kurulumu başlattığımzıda bir süre yüklemeleri yapacak ve daha sonra gerekli ekleri sizden isteyecek. Yukarıda kaydettiğimiz bilgileri isteklerine göre girerek node'u başlatmasını sağlıyoruz.

```
apt install tmux
tmux
wget -q -O aztec.sh https://raw.githubusercontent.com/okannako/aztecnetwork/refs/heads/main/aztec.sh && chmod +x aztec.sh && sudo /bin/bash aztec.sh
```

6-) Tmux ile oluşturduğumuz ekranda node başladıktan sonra bir süre sisteme eşitlenmesi için bekliyoruz. Ve bu tmux ekranında çıkmak için ```ctrl+b``` sonra ```d```'ye basarak ekrandan çıkıyoruz.                                                                                                        

7-) Bu adımda Discord'da rol almak için bize gereken bilgileri elde ediyoruz. 1. kodda bize bir Blok Numarası verecek, bunu kaydediyoruz. İkinci kodda birinci koddan elde ettiğimiz Blok Numrasını BlOCK_NUMBER'ları silerek yerine yazıyoruz(2 defa) ve bu kodda bize uzunca bir değer verecek bunu da bir yere kaydediyoruz.
```
curl -s -X POST -H 'Content-Type: application/json' \
-d '{"jsonrpc":"2.0","method":"node_getL2Tips","params":[],"id":67}' \
http://localhost:8080 | jq -r ".result.proven.number"
```

```
curl -s -X POST -H 'Content-Type: application/json' \
-d '{"jsonrpc":"2.0","method":"node_getArchiveSiblingPath","params":["BLOCK_NUMBER","BLOCK_NUMBER"],"id":67}' \
http://localhost:8080 | jq -r ".result"
```                                                                                                                                                                                                                                                                                         

8-) ```https://discord.gg/aztec``` Discord kanalına giriyoruz ve sol taraftan ```operators | start-here``` kanalına gelip altta ```/operator start``` yazıyoruz ve address kısmına cüzdan adresinizi block-number'a 1. kodla elde ettiğiniz numarayı proof kısmınıa da 2. kodla elde ettiğiniz uzun çıktıyı gidirp Enter'a basıyor ve 5-10 saniye içinde onaylayıp rolünüzü verecek.

![azzzzzt](https://github.com/user-attachments/assets/9a958bdd-8085-4160-9c98-6378e7e831d0)


9-) Aşağıdaki kodla Validatör olarak da kaydolabilirsiniz ancak günlük bir limit olduğundan eğer girilmezse hata veriyor. Rol almak için gerekli değil.

```
aztec add-l1-validator \
  --l1-rpc-urls $RPC \
  --private-key $Priv \
  --attester $Adres \
  --proposer-eoa $Adres \
  --staking-asset-handler 0xF739D03e98e23A7B65940848aBA8921fF3bAc4b2 \
  --l1-chain-id 11155111
```


10-) İşlemler bu kadardı bunula alakalı videoyu ve duyuru Telegram kanalımın anahatırı bırakıyorum.



