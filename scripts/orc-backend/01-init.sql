######################################################################
# MySQL backend DB setup
#######################################################################

CREATE USER 'orc_server_user'@'%' IDENTIFIED BY 'orc_server_password';
GRANT ALL ON orchestrator.* TO 'orc_server_user'@'%';
