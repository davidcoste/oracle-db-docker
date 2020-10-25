#!/bin/bash

cd /home/oracle/binaries
unzip /home/oracle/binaries/linux.x64_11gR2_database_1of2.zip
unzip /home/oracle/binaries/linux.x64_11gR2_database_2of2.zip
rm *.zip
cd /home/oracle/binaries/database
./runInstaller -ignorePrereq -ignoreSysPrereqs -silent -responseFile /home/oracle/response/install.rsp -waitForCompletion
rm -rf /home/oracle/binaries/database