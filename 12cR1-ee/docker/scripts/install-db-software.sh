#!/bin/bash

cd /home/oracle/binaries
unzip /home/oracle/binaries/linuxamd64_12102_database_1of2.zip
unzip /home/oracle/binaries/linuxamd64_12102_database_2of2.zip
rm *.zip
cd /home/oracle/binaries/database
./runInstaller -ignorePrereq -ignoreSysPrereqs -silent -waitForCompletion -responseFile /home/oracle/response/install.rsp -waitForCompletion
