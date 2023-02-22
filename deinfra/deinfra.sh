
#!/bin/bash

echo "======================================================================================================================================"
echo -e "\e[92m" 
echo  "       /0000000 /000000  /00000000|        /000000               /0000000   /00|                                                "; 
echo  "      / 0000000| 00__  00|__0000__/       /00__  00             | 00____/  | 00|                                                ";
echo  "     | 00 /\ 00| 00  \ 00  | 00           | 00  \__/  /00   /00 | 00       /000000    /000000     /000000   /00000/0000         ";
echo  "     | 00000000| 0000000/  | 00   /000000 |  000000  | 00  | 00 | 0000000 |_ 00_/    /00__  00   |____ 00  | 00_  00_  00       ";
echo  "     | 00__  00| 00__  00  | 00| |______/ \____  00 | 00  | 00  |_____ 00 | 00      | 00000000   /0000000  | 00 \ 00 \ 00       ";
echo  "     | 00  | 00| 00  \ 00  | 00|         /00  \ 00 | 00  | 00   /00   \ 0 | 00 / 00 | 00_____/  /00 __ 00  | 00 | 00 | 00       ";
echo  "     | 00  | 00| 00  | 00  | 00|        |  000000/ | 000000 | 0000000/  |  00000 /  | 0000000  |  0000000  | 00 | 00 | 00       ";   
echo  "     |__/  |__/|__/  |__/  |__ /         \______/  \____  00  \________/   \____/   \_______/  \_______/   |__/ |__/ |__/       ";
echo  "                                                   /00  | 00                                                                    ";
echo  "                                                  |  000000/                                                                    ";
echo  "                                                   \______/                                                                     ";
echo -e "\e[0m"
echo "======================================================================================================================================"

sleep 2

echo -e "\e[1m\e[32m1. Updating packages... \e[0m" && sleep 1
# update
sudo apt update -y && sudo apt install jq && sudo apt install apt-transport-https ca-certificates curl software-properties-common -y && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" && sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin && sudo apt install docker-compose

echo -e "\e[1m\e[32m2. Pull Docker... \e[0m" && sleep 1
# pull
docker pull thepowerio/tpnode

echo -e "\e[1m\e[32m3. Run Docker... \e[0m" && sleep 1
# Run Docker
docker run -d -p 44000:44000 --name testnet thepowerio/tpnode

echo '=============== SETUP STEP 2 SELESAI ===================' && sleep 1
