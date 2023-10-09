#!/bin/bash

export ORACLE_HOME=/u01/app/oracle/product/19.3.0/dbhome_1

# Create the Oracle home
mkdir -p /u01/app/oracle/product/19.3.0/dbhome_1

# Create a folder for each patch
mkdir -p /home/oracle/binaries/patches/34765931
mkdir -p /home/oracle/binaries/patches/33973908
mkdir -p /home/oracle/binaries/patches/34871935
mkdir -p /home/oracle/binaries/patches/34932268
mkdir -p /home/oracle/binaries/patches/35046819
mkdir -p /home/oracle/binaries/patches/34793099
mkdir -p /home/oracle/binaries/patches/34879016
mkdir -p /home/oracle/binaries/patches/35012866


# Uncompress the oracle base package in the target Oracle home
unzip /home/oracle/binaries/LINUX.X64_193000_db_home.zip -d /u01/app/oracle/product/19.3.0/dbhome_1

# remove the old OPatch and unzip the Opatch package in the Oracle home
rm -rf /u01/app/oracle/product/19.3.0/dbhome_1/OPatch
unzip /home/oracle/binaries/p6880880_190000_Linux-x86-64-OPATCH.zip -d /u01/app/oracle/product/19.3.0/dbhome_1

# unzip all patches each one in its own separate folder
unzip /home/oracle/binaries/p34765931_190000_Linux-x86-64.zip      -d /home/oracle/binaries/patches/34765931
unzip /home/oracle/binaries/p33973908_1918000DBRU_Linux-x86-64.zip -d /home/oracle/binaries/patches/33973908 
unzip /home/oracle/binaries/p34871935_1918000DBRU_Linux-x86-64.zip -d /home/oracle/binaries/patches/34871935 
unzip /home/oracle/binaries/p34932268_1918000DBRU_Linux-x86-64.zip -d /home/oracle/binaries/patches/34932268 
unzip /home/oracle/binaries/p35046819_1918000DBRU_Linux-x86-64.zip -d /home/oracle/binaries/patches/35046819
unzip /home/oracle/binaries/p34793099_1918000DBRU_Linux-x86-64.zip -d /home/oracle/binaries/patches/34793099 
unzip /home/oracle/binaries/p34879016_1918000DBRU_Linux-x86-64.zip -d /home/oracle/binaries/patches/34879016 
unzip /home/oracle/binaries/p35012866_1918000DBRU_Linux-x86-64.zip -d /home/oracle/binaries/patches/35012866

# remove the zip files
rm /home/oracle/binaries/*.zip

cd /u01/app/oracle/product/19.3.0/dbhome_1
# Fix a failed check
sed -i "s/#CV_ASSUME_DISTID=OEL5/CV_ASSUME_DISTID=OEL7.8/" /u01/app/oracle/product/19.3.0/dbhome_1/cv/admin/cvu_config

# run the silent installation
./runInstaller \
    -ignorePrereqFailure \
    -silent \
    -waitForCompletion \
    -responseFile /home/oracle/response/install.rsp \
    -applyRU /home/oracle/binaries/patches/34765931/34765931 \
    -applyOneOffs /home/oracle/binaries/patches/33973908/33973908,\
/home/oracle/binaries/patches/34793099/34793099,\
/home/oracle/binaries/patches/34871935/34871935,\
/home/oracle/binaries/patches/34879016/34879016,\
/home/oracle/binaries/patches/34932268/34932268,\
/home/oracle/binaries/patches/35012866/35012866,\
/home/oracle/binaries/patches/35046819/35046819

retCode=$?

# the swapfile precheck fail on docker causing retrun code 6, we ignore it
if [ $retCode -eq 6 ] 
then 
    echo "Ignored failed prereqs" 
    retCode=0
fi


# Patch storage
rm -rf .patch_storage/*
# APEX
rm -rf /u01/app/oracle/product/19.3.0/dbhome_1/apex
# ORDS
rm -rf /u01/app/oracle/product/19.3.0/dbhome_1/ords
# SQL Developer
rm -rf /u01/app/oracle/product/19.3.0/dbhome_1/sqldeveloper
# UCP connection pool
rm -rf /u01/app/oracle/product/19.3.0/dbhome_1/ucp
# All installer files
rm -rf /u01/app/oracle/product/19.3.0/dbhome_1/lib/*.zip
# OUI backup
rm -rf /u01/app/oracle/product/19.3.0/dbhome_1/inventory/backup/*
# Network tools help
rm -rf /u01/app/oracle/product/19.3.0/dbhome_1/network/tools/help
# Database upgrade assistant
rm -rf /u01/app/oracle/product/19.3.0/dbhome_1/assistants/dbua
# Database migration assistant
rm -rf /u01/app/oracle/product/19.3.0/dbhome_1/dmu
# Remove pilot workflow installer
rm -rf /u01/app/oracle/product/19.3.0/dbhome_1/install/pilot
# Support tools
rm -rf /u01/app/oracle/product/19.3.0/dbhome_1/suptools
