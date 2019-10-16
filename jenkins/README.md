### INSTRUCTIONS

Create folder jenkins_home to be used by docker-compose.yml:
```
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

Copy file from local to Docker container

```
docker cp prueba-automation-script.sh jenkins_jenkins_1:/home/prueba-automation-script.sh
```

[Manage Jenkins from script or shell environment using Jenkins CLI](https://jenkins.io/doc/book/managing/cli/) 

We download jenkins-cli.jar from inside Jenkins manager area: DOCKER_JENKINS_IP:8080/jnlpJars/jenkins-cli.jar

```
java -jar jenkins-cli.jar -s http://DOCKER_JENKINS_IP:8080 -ssh -user YOUR_USER_CREATED_IN_JENKINS help
```