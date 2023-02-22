<h1 align="center"><strong>Tutorial Testnet WormholesChain<strong></h1>

- [Website](https://www.wormholes.com/)
- [Discord](https://discord.gg/KkM88sQXg6)
- [Dashboard](https://www.wormholesscan.com/)
- [Doc offcial](https://www.wormholes.com/docs/install/index.html)

## Spesifikasi Minimum

| Komponen    | Requirements minimal                                 |
| ----------- | ---------------------------------------------------- |
| sistem      | Ubuntu 18.04 atau lebih tinggi                       |
| CPU         | 4 Cores atau lebih tinggi                            |
| RAM         | 8 GB atau lebih tinggi                               |
| Penyimpanan | 250 GB atau lebih tinggi                             |
| Koneksi     | 6 MBps atau lebih tinggi upload & bandwidth download |

<h1 align="center"><strong>Setup Wallet<strong></h1>
Pertama anda diharuskan membuat wallet Wormholes di limino.com

- Buka website [limino.com](https://limino.com/#/guidance)
- Silahkan buat wallet dan backup wallet yang dibuat
- Kebagian `setting` > `Security & Privacy`
- Masukan password wallet copy `private key`
- simpan dan lanjutkan next step

[![limino.png](https://i.postimg.cc/Kztv09sC/limino.png)](https://postimg.cc/sQDrXJzJ)

<h1 align="center"><strong>Setup NODE<strong></h1>

Silahkan buka terminal dan setup docker, jika sebelumnya sudah mengintall docker lanjut step RUN NODE.

```
sudo ufw allow 8545/tcp
sudo ufw allow 30303/tcp
```

```
sudo apt-get update
sudo apt-get install \
  ca-certificates \
  curl \
  gnupg \
  lsb-release
```

```
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```

```
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

```
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

```
apt-get install wget
```

<h1 align="center"><strong>RUN NODE<strong></h1>

- install wormholes

```
wget -O wormholes_install.sh https://docker.wormholes.com/wormholes_install.sh && sudo bash wormholes_install.sh
```

- Masukan Private Key wallet yang di backup tadi
- Tunggu Hingga Selesai

[![limino.png](https://i.postimg.cc/0jCKjSr4/limino.png)](https://postimg.cc/jnLSkLH6)

- Install monitor dan run

```
wget https://raw.githubusercontent.com/Art-Sy5team/WormholesChain/main/monitor.sh
```

- cek status node
- ScreenShot Status node
- simpan dan upload ke G.form untuk melanjutkan step Faucet & Stake

```
bash monitor.sh
```

[![block.png](https://i.postimg.cc/2STQSPgw/block.png)](https://postimg.cc/v4ggPSYg)

<h1 align="center"><strong>Faucet & Stake<strong></h1>

Jika semua step diatas selesai dan NODE block jalan, lanjut isi G.from untuk mendapatkan token testnet **ERB**

## Step Faucet

[Twiter](https://twitter.com/WormholesChain) | [Discord](https://discord.gg/KkM88sQXg6) | [Teleram](https://t.me/wormholes_chain) | [all social media](https://linktr.ee/WormholesChain)

- Follow dan Join social media WormholesChain
- Buka [G.form](https://s.id/1z65Q)
- masukan detail kalian

**Server configuration？**| jawab sistem OS anda ex: `Ubuntu 22.04` atau yang lainya yg anda gunakan

**Twitter URL？**| Jawab `Link Twitter anda`

**Country and IP？** | Jawab `Negara & IP VSP` yang digunakan run Wormholes

**Email address?** Discord and Telegram? | Masukan `email` dan username `Discord & Telegram`

**Screenshot of running node？**| (Display node height）| `Upload ScreenShoot` Status NODE

**Limino Wallet address?** | Jawab `Address wallet Limino`

- Kirim G.Form dan biarkan node berjalan
- team Wormholes akan review node dan jika lolos address yang masukan di form akan menerima 70.000 aset ERB.
- tunggu pemberitahuan diemail
- akan memakan waktu 1-2 minggu!

## Step Stake

step ini jika anda sudah menerima ERB di wallet dan dapat konfirmasi email bahwa anda lolos.

[![block.png](https://i.postimg.cc/9FhNkwTq/block.png)](https://postimg.cc/rzfJ0mf8)

- Buka wallet [limino.com](https://www.limino.com/#/wallet)
- Klik `More Setting` sebelah kiri
- Di bagian `Become a Validator`
- Delegate Stake token anda 70.000 ERB
- Konfirmasi wallet and `done`
- untuk melihat detail statu validator NODE buka [dashboard](https://www.wormholesscan.com/) paste address

<h1 align="center"><strong>Perintah-perintah Berguna<strong></h1>

`soon`

### Art-Team INFO

noted: **art team** here does not have any specific goals or intentions, they only collect data and share it with everyone.

untuk INFO Testnet lainya Silahkan join Discord 👇

[![twitter](https://img.shields.io/badge/twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white)](https://twitter.com/ArtSy5team)
[![Discord](https://img.shields.io/badge/discord-7289d9?style=for-the-badge&logo=discord&logoColor=white)](https://discord.gg/EAKEdZU6c8)
[![Github](https://img.shields.io/badge/GitHub-171515?style=for-the-badge&logo=GitHub&logoColor=white)](https://github.com/Art-Sy5team)
[![trakteer](https://img.shields.io/badge/trakteer.id-e31e1e?style=for-the-badge&logo=ko-fi&logoColor=white)](https://trakteer.id/Art-Sy5team/tip)
