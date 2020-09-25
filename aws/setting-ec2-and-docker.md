### Setup EC2, Docker, SonarQube, GitLab, Jenkins

🚨🚨🚨 With EC2 t2.micro we run short in memory and storage 🚨🚨🚨

```
Jenkins - http://your-ip-address:8080
SonarQube - http://your-ip-address:9000
GitLab - http://your-ip-address:10080
```
![](https://res.cloudinary.com/dsk6auln9/image/upload/c_scale,w_1962/v1600557507/us9vdzerfcbntbx2uo5w.png)


LogIn to your EC2 instance
```
ssh -i ~/.ssh/YOUR_KEY_PAIR.pem ec2-user@INSTANCE-Public IPv4 DNS.amazonaws.com                      ✔  

       __|  __|_  )
       _|  (     /   Amazon Linux 2 AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-2/
No packages needed for security; 1 packages available
Run "sudo yum update" to apply all updates.
```
Change to Root user
```
[ec2-user@ip-n ~]$ sudo su -
```
Install Docker
``` 
[root@ip-n ~]# yum install -y docker
```

Download current stable release of Docker Compose:
```
curl -L "https://github.com/docker/compose/releases/download/1.27.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```

Apply executable permissions to the binary:
```
sudo chmod +x /usr/local/bin/docker-compose
```
Create syslink and check version
```
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
docker-compose --version
```
Start Docker inside EC2 Machine and 
```
[root@ip-n docker-compose-jenkins-nexus-sonar]# docker ps
Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?
[root@ip-n docker-compose-jenkins-nexus-sonar]# service docker start
Redirecting to /bin/systemctl start docker.service

[root@ip-n docker-compose-jenkins-nexus-sonar]# usermod -a -G docker ec2-user
```
Make docker-autostart
```
[root@ip-n docker-compose-jenkins-nexus-sonar]# chkconfig docker on
```
Install git and clone our docker-compose.yml
```
yum install -y git
git clone https://github.com/sms-joliveira/devops-swissarmyknife/blob/master/docker/jenkins-sonar-docker-compose/docker-compose.yml
```

### Resources
https://appfleet.com/blog/jenkins-pipeline-with-sonarqube-and-gitlab/

https://medium.com/@chandupriya93/deploying-docker-containers-with-aws-ec2-instance-265038bba674

https://gist.github.com/sysboss/46082ab874d10248036fed5a4b3af95d