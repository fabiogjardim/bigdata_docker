# BIG DATA ECOSYSTEM COM DOCKER

Ambiente para estudo dos principais frameworks big data em docker.
<br> HDFS, HBase, Hive, Presto, Spark, Jupyter, Hue, Mongodb, Metabase, Nifi, kafka, Mysql e Zookeeper.
<br>  

![Ecossistema](ecosystem.jpeg)

## SETUP

#### Baixar o repo
          git clone https://github.com/fabiogjardim/bigdata_docker.git

#### Instalar o Docker
   ##### No Windows ou Mac: [Docker Toolbox](https://docs.docker.com/toolbox/overview/)
   
   ##### No Ubuntu: [Docker](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
      
   ##### Verificar a instação:
   
        docker version
        docker-compose version
 
#### No diretorio bigdata_docker, executar o docker-compose
          docker-compose up -d
        
#### Verificar imagens e containers
 
         docker image ls
         docker container ls

#### Parar todos containers
         docker stop $(docker ps -a -q)
         
#### Remover todos containers
         docker rm $(docker ps -a -q)
         
#### Dados do containers
         docker container inspect [nome do container]

## Acesso WebUI dos Frameworks
 
* HDFS *http://localhost:50070*
* Presto *http://localhost:8080*
* Hbase *http://localhost:16010/master-status*
* Mongo Express *http://localhost:8081*
* Kafka Manager *http://localhost:9000*
* Metabase *http://localhost:3000*
* Nifi *http://localhost:9090*
* Jupyter Spark *http://localhost:8889*
* Hue *http://localhost:8888*

## Acesso por shell

   ##### HDFS

          docker exec -it datanode bash

   ##### HBase

          docker exec -it hbase-master bash

   ##### Sqoop

          docker exec -it datanode bash
        
   ##### Kafka

          docker exec -it kafka bash

## Acesso JDBC

   ##### MySQL
          jdbc:mysql://database/employees

   ##### Hive

          jdbc:hive2://hive-server:10000/default

   ##### Presto

          jdbc:presto://presto:8080/hive/default
 
## Imagens     

[Docker Hub](https://hub.docker.com/u/fjardim)

## Documentação Oficial

* https://zookeeper.apache.org/
* https://kafka.apache.org/
* https://nifi.apache.org/
* https://prestodb.io/
* https://spark.apache.org/
* https://www.mongodb.com/
* https://www.metabase.com/
* https://jupyter.org/
* https://hbase.apache.org/
* https://sqoop.apache.org/
* https://hadoop.apache.org/
* https://hive.apache.org/
* https://gethue.com/
* https://github.com/yahoo/CMAK
* https://www.docker.com/
