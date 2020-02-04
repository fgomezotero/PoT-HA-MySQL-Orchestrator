###############################################################################
# Post-Install steps for config Slaves Node in Cluster Replication
###############################################################################

CREATE USER 'repl'@'%' IDENTIFIED BY 'slavepass';
GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%';

##################################################
# USE semisynchronous replication
##################################################
SET GLOBAL rpl_semi_sync_slave_enabled = 1;
SHOW VARIABLES LIKE 'rpl_semi_sync%';


##########################################################################################
# Configuring Slaves node replication
########################################################################################
CHANGE MASTER TO MASTER_HOST='test-node01-te', MASTER_USER='repl', MASTER_PASSWORD='slavepass', MASTER_LOG_FILE='mysql-bin-1.000002';
START SLAVE;
SHOW SLAVE STATUS\G;




