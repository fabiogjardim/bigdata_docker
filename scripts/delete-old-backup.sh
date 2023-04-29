# vars
COLOR1='\033[1;32m'
COLOR2='\033[1;36m'
NC='\033[0m' # No Color

echo -e "\n${COLOR1}::: LIMPANDO BACKUPS ANTIGOS :::${NC}\n"

# mantem somente os ultimos 7 backups
ls -l /mba-datasets/backup | grep "^d" | head -n -7 | while read line ; do

file_path="/mba-datasets/backup/$(echo ${line} | awk '{print $9}')"
rm -rf $file_path

echo -e "\nBackup removido: ${COLOR2}$file_path${NC}\n"

done
