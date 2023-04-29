# vars
COLOR1='\033[1;32m'
NC='\033[0m' # No Color

echo -e "\n${COLOR1}::: LIMPANDO CARGAS ANTIGAS :::${NC}\n"

# mantem somente as ultimas 10 cargas
hadoop fs -ls /mba-datasets | grep "^d" | head -n -10 | while read line ; do

filePath=$(echo ${line} | awk '{print $8}')
hadoop fs -rm -r $filePath

done
