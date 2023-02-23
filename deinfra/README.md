# Tutorial Testnet Deinfra

Power Ecosystem the Tea Ceremony

- [Website](https://linktr.ee/thepowerio)
- [Discord](https://discord.gg/yx4JXNWFEx)
- [Doc offcial](https://doc.thepower.io/)
- [Dashboard NODE](https://zabbix.thepower.io/zabbix.php?action=dashboard.view)
- [Telegram BOT](https://t.me/thepowerio_bot)

## Spesifikasi Minimum

| Komponen    | Requirements minimal                |
| ----------- | ----------------------------------- |
| sistem      | Ubuntu 18.04 atau lebih tinggi      |
| CPU         | 2 cores / 4 Cores                   |
| RAM         | 2 GB / 8 GB                         |
| Penyimpanan | 20 GB HDD                           |
| Koneksi     | 20 mbps upload & bandwidth download |

# STEP 1 (Follow & buat wallet)

- Start BOT [Telegram](https://t.me/thepowerio_bot)
- Klik **Testnet Campaign** di BOT
- Klik **NEXT** dan follow semua sosial media
- Buat wallet di **[POWER HUB](https://hub.thepower.io)**
- Backup wallet dan copy address paste ke BOT
- done

### Join waitlist

- Klik **Let's roll**
- Periksa Phase yang terbuka saat ini Phase 1
- di BOT KLik **Next** dan **Start the test**
- Next lanjut di VPS kalian

`Contoh Address: AA100000172805325404`

# STEP 2 (Setup join waitlist)

## Rules

- Disarangkan menggunakan VPS untuk memastikannya berfungsi dan online setiap saat
- harus mempertahankan minimal 50% waktu aktif node setiap bulan untuk mendapatkan poin (minimal selama 3 bulan sejak dimulainya chain spesifik )

### Instal otomatis

```
wget -qO deinfra.sh https://raw.githubusercontent.com/Art-Sy5team/Deinfra/main/deinfra.sh && chmod +x deinfra.sh && ./deinfra.sh
```

#### Check status Node

```
curl http://IP-VPS:44000/api/node/status | jq
```

di bagian `IP-VPS` Ganti Dengan IP VPS Kalian

#### Stop Node (STOP jika sudah masuk waitlist!)

```
docker stop tptest
```

- Setelah install dan check status node aman
- Next Buka BOT Telegram
- Masukan Link status node anda di BOT
  `Contoh: http://IP-VPS:44000/api/node/status`
- di bagian `IP-VPS` Ganti Dengan IP VPS Kalian
- Done

Token kode akan diberikan seletelah team **thepower** memeriksa anda layak

# STEP 3 (Setup Node dan RUN)

## Rules

- Hanya user yang sudah masuk waitlist yang bisa lanjut step ini
- Di **Telegram BOT** sudah mendapatkan **TOKEN CODE**

Open Port

```
ufw allow 22 && ufw allow 1080 && ufw allow 1443 && ufw allow 1800
ufw enable
```

Install Package

```
sudo apt update
sudo apt upgrade
sudo apt install git
```

## Install Erlang 24.3 (install sesuai dengan versi UBUNTU yang digunakan)

#### Jika menggunakan UBUNTU 20.04

```
sudo apt update
sudo apt install curl wget gnupg apt-transport-https -y
```

```
curl -fsSL https://packages.erlang-solutions.com/ubuntu/erlang_solutions.asc | sudo gpg --dearmor -o /usr/share/keyrings/erlang.gpg
```

```
echo "deb [signed-by=/usr/share/keyrings/erlang.gpg] https://packages.erlang-solutions.com/ubuntu $(lsb_release -cs) contrib" | sudo tee /etc/apt/sources.list.d/erlang.list
```

```
sudo apt update
sudo apt install erlang
```

#### Jika menggunakan UBUNTU 22.04

```
apt install cmake clang gcc git curl libssl-dev build-essential automake autoconf libncurses5-dev elixir erlang
```

```
apt -y install erlang-base erlang-public-key erlang-ssl
```

## Install Tea Ceremony client dan token

```
wget https://tea.thepower.io/teaclient
```

```
chmod +x teaclient
```

## Install Docker

```
sudo apt update && sudo apt upgrade -y
```

```
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update && sudo apt install docker-ce docker-ce-cli containerd.io -y
```

```
docker pull thepowerio/tpnode
```

```
docker run -d -p 44000:44000 --name tptest thepowerio/tpnode
```

## Install SSL

```
cd /opt
mkdir -p thepower/db/cert/
cd
apt-get install socat
curl https://get.acme.sh | sh -s email=ISI-EMAIL
source ~/.bashrc
```

- Di Bagian `ISI-EMAIL` ganti dengan email anda

## Start Tea Ceremony Client

```
./teaclient -n nickname aaaaa.bbbbb
```

setelah memasukan command ini tunggu hingga semua slot penuh dan lanjut next step

- **Nickname** : NAMA node anda **BEBAS** Menggunakan nama apa saja!
- **aaaaa** : adalah token kode dari **[Channel Telegram](https://t.me/thepowerio)** yang dibagikan team thepower
- **bbbbb** : adalah token kode anda dari BOT TELEGRAM

**Contoh** `./teaclient -n  ARTteam 12A41AA548A5.22E9AE7333D64`

- contoh kode di atas tidak bisa dipake (kode random)
- Untuk mendapatkan token **aaaaa** Pantau Channel thepowerio

### Next set config

```
source ~/.bashrc
acme.sh --server letsencrypt --issue --standalone  -d your_node.example.com
acme.sh --install-cert -d your_node.example.com \
--cert-file /opt/thepower/db/cert/your_node.example.com.crt \
--key-file /opt/thepower/db/cert/your_node.example.com.key \
--ca-file /opt/thepower/db/cert/your_node.example.com.crt.ca.crt
acme.sh --info -d your_node.example.com
```

- Buka File **node.config**
- Copy **hostname** ganti semua bagian `your_node.example.com`
- Noted: saat membuka file **node.config** hanya ada Private KEY jalankan ulang `./teaclient -n nickname aaaaa.bbbbb`

# Docker RUN Node

```
cd /opt/thepower
mkdir log
cd
cp node.config /opt/thepower/node.config
cp genesis.txt /opt/thepower/genesis.txt
```

```
cd /opt/thepower
docker run -d \
--name tpnode \
--restart unless-stopped \
--mount type=bind,source="$(pwd)"/db,target=/opt/thepower/db \
--mount type=bind,source="$(pwd)"/log,target=/opt/thepower/log \
--mount type=bind,source="$(pwd)"/node.config,target=/opt/thepower/node.config \
--mount type=bind,source="$(pwd)"/genesis.txt,target=/opt/thepower/genesis.txt \
-p 1800:1800 \
-p 1080:1080 \
-p 1443:1443 \
thepowerio/tpnode
```

## Check Status Node

```
curl http://your_node.example.com:1080/api/node/status | jq
```

| `your_node.example.com`                                          |
| ---------------------------------------------------------------- |
| Ganti Dengan Nama Host Anda Yang ada di dalam File `node.config` |

<h1 align="center"><strong>last Setup<strong></h1>

- Buka TELEGRAM BOT
- Klik `Whats Next`
- Klik `Done` dan
- Paste Domain status `http://your_node.example.com:1800/api/node/status`
- menunggu hingga **height 1**
- BOT otomatis verifikasi NODE
- Done

#### check status NODE

- Telegram BOT klik Check your Status
- Buka URL [dashboard](https://zabbix.thepower.io/zabbix.php?action=dashboard.view)
- di dashbord ke halaman sesuai **chain**
- selesaikan **problem** jika node bermasalah
- done

di bagian `your_node.example.com` ganti dengan hostname dari file **node.config**

## Command Delete STOP dan Delete NODE

```
docker stop tpnode
```

```
docker rm tpnode
```

```
docker rmi thepowerio/tpnode
```

<h1 align="center"><strong>Update Versi NODE<strong></h1>

Check Status Versi node

```
curl http://localhost:1080/api/node/status | jq -r .status.ver
```

Masuk ke File repo

```
cd /opt/thepower
```

Stop docker dan delete node

```
 docker stop tpnode && docker rm tpnode
```

pull versi baru NODE

```
docker pull thepowerio/tpnode
```

RUN NODE

```
 docker run -d \
--name tpnode \
--restart unless-stopped \
--mount type=bind,source="$(pwd)"/db,target=/opt/thepower/db \
--mount type=bind,source="$(pwd)"/log,target=/opt/thepower/log \
--mount type=bind,source="$(pwd)"/node.config,target=/opt/thepower/node.config \
--mount type=bind,source="$(pwd)"/genesis.txt,target=/opt/thepower/genesis.txt \
-p 1800:1800 \
-p 1080:1080 \
-p 1443:1443 \
thepowerio/tpnode
```

Check Status Versi node lagi!

```
curl http://localhost:1080/api/node/status | jq -r .status.ver
```

### Art-Team INFO

noted: **art team** here does not have any specific goals or intentions, they only collect data and share it with everyone.

untuk INFO Testnet lainya Silahkan join Discord 👇

[![twitter](https://img.shields.io/badge/twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white)](https://twitter.com/ArtSy5team)
[![Discord](https://img.shields.io/badge/discord-7289d9?style=for-the-badge&logo=discord&logoColor=white)](https://discord.gg/EAKEdZU6c8)
[![Github](https://img.shields.io/badge/GitHub-171515?style=for-the-badge&logo=GitHub&logoColor=white)](https://github.com/Art-Sy5team)
[![trakteer](https://img.shields.io/badge/trakteer.id-e31e1e?style=for-the-badge&logo=ko-fi&logoColor=white)](https://trakteer.id/Art-Sy5team/tip)
