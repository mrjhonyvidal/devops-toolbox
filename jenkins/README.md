### INSTRUCTIONS

Set locally
```
create folder jenkins_home to be used in docker-compose.yml
mkdir jenkins_home

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


### AUTOMATION SCRIPTS RUNNING ON JENKINS

Create a file in automation_scripts folder and add execution permisions as sudo user: chmod +x SCRIPT_NAME.sh