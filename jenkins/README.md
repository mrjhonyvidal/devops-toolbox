### INSTRUCTIONS

```
mkdir jenkins_home folder (same level of docker-compose.yml file)
sudo chown -R $USER $PWD/jenkins_home 
```

Start the docker container and create a bash shell to it:
```
docker-compose up -d
docker-compose exec local-jenkins /bin/bash
```
You will find your local Jenkins in your browser at http://localhost:8787.

First time you point your browser to your local Jenkins your will see the Installation Wizard. Defaults are fine, be sure you install the pipeline plugin during the setup though.

Note: to get the "initialAdminPassword":
```
docker-compose logs | grep -A5 -B5 initialAdminPassword
```

### Setup your jenkins:
You are an admin user by default. You can verify your rights in this URL: http://localhost:8787/configureSecurity

Please verify that the checkbox Prevent Cross Site Request Forgery exploits is unchecked. (Since this Jenkins is only reachable from your computer this isn't such a big deal)

### Add the local-git user:
We need to allow the git hook to login to the local Jenkins. Just to see and build jobs is sufficient (but for this demo, this user can be an admin too). Therefore we create a user called "local-git" with password "Password123".

Point your browser to http://localhost:8787/securityRealm/addUser and add "local-git" as username and "Password123" as password. Click on [ Create User ].


### Create the pipeline project
Having git enabled project with the Jenkinsfile in the root of folder "demo-app-jenkinsfile".

In your Local Jenkins (http://localhost:8787) add a new pipeline project, let's say "qa-pipeline".

Click on New Item in the Jenkins menu:

- Name the project "pipelinedemo"
- Click on Pipeline
- Click [ OK ]
- Tick the checkbox Poll SCM in the Build Triggers section. Leave the Schedule empty. In the Pipeline section:
- Select Pipeline script from SCM In the Repository URL field:
- TODO: add step to point to git url
- TODO: add step <In the Script Path> to point to the Jenkinsfile inside the folder https://github.com/mrjhonyvidal/devops-swissarmyknife/tree/master/jenkins/demo-app-jenkinsfile

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

