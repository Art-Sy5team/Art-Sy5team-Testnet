
#!/bin/bash

clear
echo "===================================================================================================================================================="
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
echo "===================================================================================================================================================="

sleep 2

function info(){
     cn=0
     while true
     do
             echo "$cn second."
             echo "node $1"
             rs=`curl -H "Content-Type: application/json" --data '{"jsonrpc":"2.0","method":"eth_blockNumber","id":64}' https://api.wormholestest.com 2>/dev/null`
             blockNumbers=$(parse_json $rs "result")
             echo "Block height of the whole network: $((16#${blockNumbers:2}))"
             rs1=`curl -H "Content-Type: application/json" --data '{"jsonrpc":"2.0","method":"net_peerCount","id":64}' 127.0.0.1:$1 2>/dev/null`
             count=$(parse_json $rs1 "result")
             echo "Number of node connections: $((16#${count:2}))"
             rs2=`curl -H "Content-Type: application/json" --data '{"jsonrpc":"2.0","method":"eth_blockNumber","id":64}' 127.0.0.1:$1 2>/dev/null`
             blckNumber=$(parse_json $rs2 "result")
             echo "Block height of the current peer: $((16#${blckNumber:2}))"
             sleep 5
             clear
             let cn+=5
     done
}

function parse_json(){
      if [[ $# -gt 1 ]] && [[ $1 =~ $2 ]];then
         echo "${1//\"/}"|sed "s/.*$2:\([^,}]*\).*/\1/"
      else
         echo "0x0"
     fi
}

function main(){
     if [[ $# -eq 0 ]];then
             info 8545
     else
             info $1
     fi
}

main "$@"