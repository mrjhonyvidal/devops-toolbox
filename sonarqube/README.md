### Instructions

- [ ] Download sonarqube and sonar-scanner 
- [ ] Add to ~/.bash_profile 
```
###########################
## SONARQUBE DEV SCANNER ##
###########################
export PATH=$PATH:$HOME/devops/sonarqube-7.9.2/bin/macosx-universal-64
export PATH=$PATH:$HOME/devops/sonar-scanner-4.2.0.1873-macosx/bin
```

```Run in terminal: source ~/.bash_profile```

- [ ] Start SonarQube
~/devops/sonarqube-7.9.2/bin/macosx-universal-64/sonar.sh start/status/stop

Detail: MUST have JDK >= 11.0.2 in order to work.

- [ ] Add sonar-project.properties to the root of the project
```
sonar.projectKey=""
sonar.projectName=""
sonar.sourceEncoding=UTF-8
sonar.sources=src/main/java
sonar.exclusion=.idea/*
sonar.java.binaries=target/classes
```
Run in terminal of the repository/connector/project: 

```~/devops/sonar-scanner-4.2.0.1873-macosx/bin/sonar-scanner & ``
Open link to report. SonarQube should be running on port 9000
User: admin
Password: admin