
#!/bin/bash
docker ps
./rm-all.sh
docker-compose up -d --force-recreate
docker ps
