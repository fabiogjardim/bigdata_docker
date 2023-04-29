# BIG DATA ECOSYSTEM COM DOCKER

## OBJETIVO

Este repositório tem como objetivo exercitar atividades relacionadas à aula sobre Hadoop realizada em sala de aula durante o MBA de Engenharia de Dados, disciplina Distributed Data Processing & Storage na FIAP em 2023.

## PROPOSTA

Ele é um fork do repositório do Fabio Jardim --> [bigdata_docker](https://github.com/fabiogjardim/bigdata_docker)

Pegamos o ambiente Hadoop em Docker montado pelo Fabio e criamos uma simulação de rotina de ETL + Backup utilizando Shell scripts.

Para ter mais detalhes sobre configurações do ambiente e comandos específicos, consulte o repositório original.

A ideia do trabalho é seguir estes passos:

* Baixar um dataset público da internet para dentro do HDFS
* criar uma estrutura de diretórios no HDFS pensando em uma periodicidade e diversas versões desse dataset
* carregar de forma semi-automatizada (script) o dataset na estrutura definida
* definir uma estratégia de backup
* criar script para realizar o backup
* documentar todas as estratégias adotadas

## COMO RODAR A SIMULAÇÃO

Antes de tudo, você precisa ter o [Docker Desktop](https://www.docker.com/products/docker-desktop/) instalado e inicializado.

Para iniciar o ambiente Hadoop em Docker execute o comando abaixo, de preferência em um terminal shell:

```shell
docker compose up -d
```

Execute o script abaixo para rodar a simulação:

```shell
. ./init.sh
```

Para encerrar a simulação utilize a combinação de teclas `CTRL+C` e se quiser encerrar o ambiente Hadoop em Docker basta executar este comando:

```shell
docker compose down
```

## NOSSA IDEIA

Separamos os scripts da simulação dentro do diretório */scripts*.

O script *init.sh* que fica no diretório raiz, orquestra a execução dos scripts de carga dentro do container *namenode*. Ele executa a cada 10 segundos para efeito de demonstração.

Em uma aplicação no mundo real, poderíamos pegar o conteúdo do script *init.sh* e adaptar para rodar diariamente em um *cronjob* dentro do servidor do namenode.

### ESTRUTURA DE DIRETÓRIOS

Primeiro executamos o *config.sh* para criar a estrutura de diretórios.

Criamos um diretório dentro da estrutura HDFS para armazenar as cargas de datasets:

    ├── HDFS
    │   └── mba-datasets

E uma estrutura dentro do "servidor" do namenode, neste exemplo para criar uma área de staging, onde utilizaremos como área temporária para baixar o dataset e uma área de backups fora do ambiente HDFS.

    ├── namenode
    │   └── mba-datasets
    │       ├── staging
    │       └── backup

### JOBS

Depois executamos em looping a cada 10 segundos os scripts de carga, backup e deleção de arquivos antigos.

O script *job-data.sh* é responsável por baixar o dataset e gravar no HDFS.

Utilizamos como exemplo arquivos em CSV de cotações de moedas do banco central em D-1 (pra garantir que o arquivo exista).

O script *job-backup.sh* realiza um backup do último dataset baixado e copia para o diretório backup fora do HDFS.

O script *delete-old-data.sh* mantém somente as últimas 10 cargas de datasets. Em um job no mundo real, poderíamos manter por exemplo, os últimos 12 meses de carga ou mais, dependendo da necessidade do negócio.

O script *delete-old-backup.sh* mantém somente os últimos 7 backups. Em um job no mundo real, poderíamos manter por exemplo, os últimos 30 dias ou mais, dependendo do tamanho do storage e da necessidade de negócio.

Depois de executar a simulação, a estrutura de arquivos no HDFS e no namenode deve ficar por exemplo desta forma:

    ├── HDFS
    │   └── mba-datasets
    │       ├── 20230428-132720
    │       │   └── dataset.csv
    │       ├── 20230428-132801
    │       │   └── dataset.csv
    │       ├── 20230428-132741
    │       │   └── dataset.csv
    │       ├── 20230428-132822
    │       │   └── dataset.csv
    │       ├── 20230428-132843
    │       │   └── dataset.csv
    │       ├── 20230428-132903
    │       │   └── dataset.csv
    │       ├── 20230428-132924
    │       │   └── dataset.csv
    │       ├── 20230428-132944
    │       │   └── dataset.csv
    │       ├── 20230428-133005
    │       │   └── dataset.csv
    │       └── 20230428-133026
    │           └── dataset.csv


    ├── namenode
    │   └── mba-datasets
    │       ├── staging
    │       └── backup
    │           ├── 20230428-132822
    │           │   └── dataset.csv
    │           ├── 20230428-132843
    │           │   └── dataset.csv
    │           ├── 20230428-132903
    │           │   └── dataset.csv
    │           ├── 20230428-132924
    │           │   └── dataset.csv
    │           ├── 20230428-132944
    │           │   └── dataset.csv
    │           ├── 20230428-133005
    │           │   └── dataset.csv
    │           └── 20230428-133026
    │               └── dataset.csv


No mundo real poderíamos criar mais quebras de diretório para facilitar a organização dos arquivos. Por exemplo, por ano / mês / dia. Neste exemplo, utilizamos HORA-MINUTOS-SEGUNDOS no final do nome para facilitar a demonstração.
