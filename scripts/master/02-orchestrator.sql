###############################################################################
# Post-Install steps for Orchestrator Integrations
###############################################################################

CREATE USER 'orc_client_user'@'%' IDENTIFIED BY 'orc_client_password';
GRANT SUPER, PROCESS, REPLICATION SLAVE, RELOAD ON *.* TO 'orc_client_user'@'%';
GRANT SELECT ON mysql.slave_master_info TO 'orc_client_user'@'%';
GRANT DROP ON _pseudo_gtid_.* TO 'orc_client_user'@'%';  


############################################################################
# Tabla auxiliar para la clasificación de los cluster
###########################################################################

CREATE DATABASE IF NOT EXISTS meta;
use meta;
GRANT SELECT ON meta.* TO 'orc_client_user'@'%';

CREATE TABLE IF NOT EXISTS cluster (
  anchor VARCHAR(128) NOT NULL,
  cluster_name VARCHAR(128) CHARSET ascii NOT NULL DEFAULT '',
  cluster_domain VARCHAR(128) CHARSET ascii NOT NULL DEFAULT '',
  PRIMARY KEY (anchor)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO cluster (anchor, cluster_name, cluster_domain)
  VALUES (@@hostname, 'PoT', 'PoT')
  ON DUPLICATE KEY UPDATE cluster_name=VALUES(cluster_name), cluster_domain=VALUES(cluster_domain);