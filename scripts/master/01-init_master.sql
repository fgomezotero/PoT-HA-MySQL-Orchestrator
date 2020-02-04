###############################################################################
# Post-Install steps for config Master Node in Cluster Replication
###############################################################################


##################################################
# USE semisynchronous replication
##################################################
SET GLOBAL rpl_semi_sync_slave_enabled = 1;
SET GLOBAL rpl_semi_sync_master_wait_for_slave_count = 2;
SHOW VARIABLES LIKE 'rpl_semi_sync%';


##########################################################################################
# Configuring master node replication user and get the initial replication co-ordinates
########################################################################################
CREATE USER 'repl'@'%' IDENTIFIED BY 'slavepass';
GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%';
SHOW MASTER STATUS;



