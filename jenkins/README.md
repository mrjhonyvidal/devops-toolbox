### INSTRUCTIONS

Set locally
```
docker pull jenkins/jenkins

sudo chown $USER -R ~/jenkins 

docker-compose up -d

To find out the container ID
docker ps 

Use to check the admin password
docker logs -f CONTAINER_ID 
```

Access in the ip obtained in docker logs o using docker inspect CONTAINER_ID --> IPADDRESS
http://IP_CONTAINER:8080/

