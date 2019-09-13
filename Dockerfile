# Container with Neo4j 2.2
# Repository http://github.com/jexp/docker-neo4j-2.2

FROM openjdk:8
LABEL maintainer="Michael Hunger, michael.hunger@neotechnology.com"

# Install latest Neo4j _Milestone_ according to http://debian.neo4j.org

RUN curl http://debian.neo4j.org/neotechnology.gpg.key | apt-key add - && \
    echo 'deb http://debian.neo4j.org/repo testing/' > /etc/apt/sources.list.d/neo4j.list && \
    apt-get update && \
    apt-get install neo4j=2.2.0.M04 -y && \
    apt-get clean

## add launcher and set execute property
# enable shell server on all network interfaces
# change data directory to /opt/data/graph.db for external linking

ADD launch.sh /

RUN chmod +x /launch.sh && \
    sed -i "s|remote_shell_enabled=.+|remote_shell_enabled=true|g" /var/lib/neo4j/conf/neo4j.properties && \
    sed -i "s|data/graph.db|/data/graph.db|g" /var/lib/neo4j/conf/neo4j-server.properties && \
    sed -i "s|dbms.security.authorization_enabled=true|dbms.security.authorization_enabled=false|g" /var/lib/neo4j/conf/neo4j-server.properties && \
    echo "remote_shell_host=0.0.0.0" >> /var/lib/neo4j/conf/neo4j.properties && \
    cat /var/lib/neo4j/conf/neo4j-server.properties 

# expose REST-server and remote-shell ports
EXPOSE 7474
EXPOSE 1337

WORKDIR /etc/neo4j

## Run start script
CMD ["/bin/bash", "-c", "/launch.sh"]