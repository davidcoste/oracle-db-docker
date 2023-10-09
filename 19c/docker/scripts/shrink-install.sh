# Remove not needed components
# APEX
rm -rf /u01/app/oracle/product/19.3.0/dbhome_1/apex && \
# ORDS
rm -rf /u01/app/oracle/product/19.3.0/dbhome_1/ords && \
# SQL Developer
rm -rf /u01/app/oracle/product/19.3.0/dbhome_1/sqldeveloper && \
# UCP connection pool
rm -rf /u01/app/oracle/product/19.3.0/dbhome_1/ucp && \
# All installer files
rm -rf /u01/app/oracle/product/19.3.0/dbhome_1/lib/*.zip && \
# OUI backup
rm -rf /u01/app/oracle/product/19.3.0/dbhome_1/inventory/backup/* && \
# Network tools help
rm -rf /u01/app/oracle/product/19.3.0/dbhome_1/network/tools/help && \
# Database upgrade assistant
rm -rf /u01/app/oracle/product/19.3.0/dbhome_1/assistants/dbua && \
# Database migration assistant
rm -rf /u01/app/oracle/product/19.3.0/dbhome_1/dmu && \
# Remove pilot workflow installer
rm -rf /u01/app/oracle/product/19.3.0/dbhome_1/install/pilot && \
# Support tools
rm -rf /u01/app/oracle/product/19.3.0/dbhome_1/suptools && \
# Temp location
rm -rf /tmp/* && 
