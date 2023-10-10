FROM oraclelinux:8-slim AS ol8-base
RUN  microdnf install -y oracle-database-preinstall-19c.x86_64 && \
     microdnf clean all && \
     sed -i -e "s/^oracle/# oracle/g" /etc/security/limits.conf && \
     sed -i -e "s/^oracle/# oracle/g" /etc/security/limits.d/oracle-database-preinstall-19c.conf 
     
FROM ol8-base AS ol8-stage1
RUN  mkdir -p /home/oracle/scripts && \
     mkdir /home/oracle/binaries && \
     mkdir /home/oracle/response

COPY docker/binaries/*.zip /home/oracle/binaries/
COPY docker/response/install.rsp /home/oracle/response/
COPY docker/scripts/install-db-software.sh /home/oracle/scripts/

RUN chown -R oracle:oinstall /home/oracle && \
    sed -i -e "s/^oracle/# oracle/g" /etc/security/limits.conf && \
    sed -i -e "s/^oracle/# oracle/g" /etc/security/limits.d/oracle-database-preinstall-19c.conf && \
    mkdir /u01 && \
    chown -R oracle:oinstall /u01 && \
    chmod 755 /home/oracle/scripts/install-db-software.sh && \
    su oracle -c /home/oracle/scripts/install-db-software.sh && \
    /u01/app/oraInventory/orainstRoot.sh && \
    /u01/app/oracle/product/19.3.0/dbhome_1/root.sh && \
    rm -rf /home/oracle/binaries && \
    rm -rf /home/oracle/response && \
    rm -rf /home/oracle/scripts

FROM ol8-base AS ol8-stage2
COPY --from=ol8-stage1 /u01/app /u01/app