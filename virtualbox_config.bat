@echo OFF
SET vbox=C:/Program Files/Oracle/VirtualBox/
echo Executando em %vbox%
CD /D %vbox%
echo
echo *****************************************
echo ************** INICIO ******************
echo *****************************************

echo *****************************************
echo **** REMOVENDO VM DEFAULT
echo *****************************************
docker-machine rm default -y

echo 
echo *****************************************
echo **** RECRIANDO VM DEFAULT
echo *****************************************
docker-machine create -d virtualbox --virtualbox-disk-size "100000"  default

echo 
echo *****************************************
echo **** PARANDO VM DEFAULT
echo *****************************************
docker-machine stop default

echo 
echo *****************************************
echo **** CONFIGURANDO DISCOS COMPARTILHADOS
echo *****************************************

:: se a unidade de disco não for a d: altera para a unidade correta
:: altear apenas o "c:/" para a outra. ex: "d:/"
VBoxManage.exe sharedfolder add default --name "d" --hostpath "d:/" --automount
VBoxManage.exe setextradata default VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root 1
VBoxManage.exe setextradata default VBoxInternal2/SharedFoldersEnableSymlinksCreate/d 1

echo 
echo *****************************************
echo **** AUMENTANDO MEMORIA DA VM DEFAULT
echo *****************************************
VBoxManage.exe  modifyvm default --memory 8192


echo 
echo *****************************************
echo **** MAPEANDO PORTAS DE REDE
echo *****************************************
VBoxManage.exe modifyvm default --natpf1 "namenode,tcp,,50070,,50070"
VBoxManage.exe modifyvm default --natpf1 "datanode,tcp,,50075,,50075"
VBoxManage.exe modifyvm default --natpf1 "presto,tcp,,8080,,8080"
VBoxManage.exe modifyvm default --natpf1 "hbase-master,tcp,,16010,,16010"
VBoxManage.exe modifyvm default --natpf1 "hbase-regionserver,tcp,,16030,,16030"
VBoxManage.exe modifyvm default --natpf1 "mongo,tcp,,27017,,27017"
VBoxManage.exe modifyvm default --natpf1 "mongo_express,tcp,,8081,,8081"
VBoxManage.exe modifyvm default --natpf1 "kafkamanager,tcp,,9000,,9000"
VBoxManage.exe modifyvm default --natpf1 "metabase,tcp,,3000,,3000"
VBoxManage.exe modifyvm default --natpf1 "nifi,tcp,,9090,,9090"
VBoxManage.exe modifyvm default --natpf1 "jupyter,tcp,,8889,,8889"
VBoxManage.exe modifyvm default --natpf1 "Hue,tcp,,8888,,8888"
VBoxManage.exe modifyvm default --natpf1 "hive,tcp,,10000,,10000"
VBoxManage.exe modifyvm default --natpf1 "mysql,tcp,,3306,,3306"
VBoxManage.exe modifyvm default --natpf1 "zookeeper,tcp,,2181,,2181"
VBoxManage.exe modifyvm default --natpf1 "kafka,tcp,,9092,,9092"
VBoxManage.exe modifyvm default --natpf1 "spark1,tcp,,4040,,4040"
VBoxManage.exe modifyvm default --natpf1 "spark2,tcp,,4041,,4041"
VBoxManage.exe modifyvm default --natpf1 "spark3,tcp,,4042,,4042"
VBoxManage.exe modifyvm default --natpf1 "spark4,tcp,,4043,,4043"

echo *****************************************
echo **************** FIM ********************
echo *****************************************

pause
