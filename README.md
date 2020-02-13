# Ambiente de HA MySQL Orchestrator en docker

Partiendo de una ambiente de replicación en MySQL tomando como base el siguiente proyecto: https://github.com/wagnerjfr/mysql-master-slaves-replication-docker

Nos propusimos construir un archivo **docker-compose.yaml** para el armado del ambiente con los siguientes servicios:
* test-node01-te (MySQL Master)
* test-node02-te (MySQL Slave)
* test-node03-pa (MySQL Slave)
* orchestrator
* orc-backend

La imagen que utilizamos en el servicio de orchestrator es la construida a partir del Dockerfile oficial de dicho repositorio https://github.com/github/orchestrator

En esta rama de Git nuestro objetivo es configurar un nodo Orchestrator con backend SQLite y sin habilitar el recovery autmático del cluster de PoT