## Neo4j

Using official Neo4j image with authentication disabled.  
This is needed for Profound 3.8, also shouldn't break anything on elarier versions either.  
Also note need BOLT port 7687 mapped too.
Since we snt use much resources, the following should suffice, just remeber to map data directories.  

docker run \
    --name om-neo4j \
    -p7474:7474 -p7687:7687 \
    -d \
    -v $HOME/neo4j/data:/data \
    -v $HOME/neo4j/logs:/logs \
    dc-neo4j:latest

Note: Default other services look for om-neo4j as service name.

See https://neo4j.com/developer/docker-run-neo4j/ for more deatils on running.