Container for Neo4j 2.2
=======================

Neo4j is an highly scalable, robust (fully ACID) native graph database. 
It is used in mission-critical apps by thousands of leading, startups, enterprises, and governments around the world.

Learn more on http://neo4j.com and get started with http://neo4j.com/developer

This Dockerfile creates a Neo4j 2.2 (Milestone) container that is ready to run and can link to your external data directories.

### Setup

1. Run:

	`docker run -i -t -d --name neo4j-22 -v </path/to/neo4j/data-dir>:/opt/data -p <external port>:7474 jexp/docker-neo4j-2.2`

e.g.:

    `docker run -i -t -d --name neo4j-22 -v /home/michael/neo4j/data:/opt/data -p 17474:7474 jexp/docker-neo4j-2.2`

2. Open in browser

     `http://localhost:17474` 

Please note that Neo4j 2.2 requires auth.
You have to login with `neo4j/neo4j` at the first connection and set a new password.

Todo
====

* Provide initial password externally
* Allow to disable auth via environment variable
* Memory Tuning Options (esp. page-cache)
