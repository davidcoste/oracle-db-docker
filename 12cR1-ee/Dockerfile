FROM oraclelinux:7.8
RUN groupadd -f dba && groupadd -f oinstall && \
    useradd -m -g dba -G oinstall -d /home/oracle oracle && \
    mkdir /u01 && chown oracle:dba /u01 && \
     yum install -y oracle-rdbms-server-12cR1-preinstall glibc-static wget unzip && \
     yum clean all && \
     mkdir -p /home/oracle/scripts && \
     mkdir /home/oracle/binaries && \
     mkdir /home/oracle/response
     
COPY docker/binaries/linuxamd64_12102_database_1of2.zip /home/oracle/binaries/
COPY docker/binaries/linuxamd64_12102_database_2of2.zip /home/oracle/binaries/
COPY docker/response/install.rsp /home/oracle/response/
COPY docker/scripts/install-db-software.sh /home/oracle/scripts/

RUN chown -R oracle:oinstall /home/oracle && \
    sed -i -e "s/^oracle/# oracle/g" /etc/security/limits.conf && \
    sed -i -e "s/^oracle/# oracle/g" /etc/security/limits.d/oracle-rdbms-server-12cR1-preinstall.conf && \
    su oracle -c /home/oracle/scripts/install-db-software.sh && \
    /u01/app/oraInventory/orainstRoot.sh && \
    /u01/app/oracle/product/12.1.0/dbhome_1/root.sh && \
    rm -rf /home/oracle/binaries && \
    rm -rf /home/oracle/response && \
    rm -rf /home/oracle/scripts