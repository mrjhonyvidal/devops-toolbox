### Instructions

Alright you got here because either you want to learn about Docker or improve your skills by applying it in a real world project out there.

Each example app has its own folder which you'll find the instructions inside to launch it using some Docker commands. 

### Building a Docker image and deploying to Heroku 

Heroku allows store Docker images on Heroku Registry

```
Make sure you have a working Docker installation (eg. docker ps) and that you’re logged in to Heroku (heroku login).

Log in to Container Registry:

heroku container:login
Get sample code by cloning an Alpine-based python example:

git clone https://github.com/heroku/alpinehelloworld.git
Navigate to the app’s directory and create a Heroku app:

heroku create
Creating salty-fortress-4191... done, stack is heroku-18
https://salty-fortress-4191.herokuapp.com/ | https://git.heroku.com/salty-fortress-4191.git

Build the image and push to Container Registry:

docker build -t herokupython:1.0 .

To avoid
Error: Missing required flag:
 ›     -a, --app APP  app to run command against
 ›   See more help with --help
Inside the repo folder type: 
git init and heroku git:remote -a dry-scrubland-46355 #Your App Name on Heroku

heroku container:push web

Then release the image to your app:

heroku container:release web
Now open the app in your browser:

heroku open

```

Test locally
```
docker run -p 5000:5000 -e PORT=5000 herokupython
```

[Heroku Container Registry](https://devcenter.heroku.com/articles/container-registry-and-runtime#using-a-ci-cd-platform)

Extra 
```
docker build will read our Dockerfile from git clone https://github.com/heroku/alpinehelloworld.git

#Grab the latest alpine image
FROM alpine:latest

# Install python and pip
RUN apk add --no-cache --update python3 py3-pip bash
ADD ./webapp/requirements.txt /tmp/requirements.txt

# Install dependencies
RUN pip3 install --no-cache-dir -q -r /tmp/requirements.txt

# Add our code
ADD ./webapp /opt/webapp/
WORKDIR /opt/webapp

# Expose is NOT supported by Heroku
# EXPOSE 5000 		

# Run the image as a non-root user
RUN adduser -D myuser
USER myuser

# Run the app.  CMD is required to run on Heroku
# $PORT is set by Heroku			
CMD gunicorn --bind 0.0.0.0:$PORT wsgi


 ~/devops/alpinehelloworld │ master  docker build -t herokupython:1.0 .                     1 х 
Sending build context to Docker daemon  9.216kB
Step 1/9 : FROM alpine:latest
latest: Pulling from library/alpine
df20fa9351a1: Pull complete 
Digest: sha256:185518070891758909c9f839cf4ca393ee977ac378609f700f60a771a2dfe321
Status: Downloaded newer image for alpine:latest
 ---> a24bb4013296
Step 2/9 : RUN apk add --no-cache --update python3 py3-pip bash
 ---> Running in 1ffa1a0ebad2
fetch http://dl-cdn.alpinelinux.org/alpine/v3.12/main/x86_64/APKINDEX.tar.gz
fetch http://dl-cdn.alpinelinux.org/alpine/v3.12/community/x86_64/APKINDEX.tar.gz
(1/37) Installing ncurses-terminfo-base (6.2_p20200523-r0)
(2/37) Installing ncurses-libs (6.2_p20200523-r0)
(3/37) Installing readline (8.0.4-r0)
(4/37) Installing bash (5.0.17-r0)
Executing bash-5.0.17-r0.post-install
(5/37) Installing libbz2 (1.0.8-r1)
(6/37) Installing expat (2.2.9-r1)
(7/37) Installing libffi (3.3-r2)
(8/37) Installing gdbm (1.13-r1)
(9/37) Installing xz-libs (5.2.5-r0)
(10/37) Installing sqlite-libs (3.32.1-r0)
(11/37) Installing python3 (3.8.5-r0)
(12/37) Installing py3-appdirs (1.4.4-r1)
(13/37) Installing py3-ordered-set (4.0.1-r0)
(14/37) Installing py3-parsing (2.4.7-r0)
(15/37) Installing py3-six (1.15.0-r0)
(16/37) Installing py3-packaging (20.4-r0)
(17/37) Installing py3-setuptools (47.0.0-r0)
(18/37) Installing py3-chardet (3.0.4-r4)
(19/37) Installing py3-idna (2.9-r0)
(20/37) Installing py3-certifi (2020.4.5.1-r0)
(21/37) Installing py3-urllib3 (1.25.9-r0)
(22/37) Installing py3-requests (2.23.0-r0)
(23/37) Installing py3-msgpack (1.0.0-r0)
(24/37) Installing py3-lockfile (0.12.2-r3)
(25/37) Installing py3-cachecontrol (0.12.6-r0)
(26/37) Installing py3-colorama (0.4.3-r0)
(27/37) Installing py3-distlib (0.3.0-r0)
(28/37) Installing py3-distro (1.5.0-r1)
(29/37) Installing py3-webencodings (0.5.1-r3)
(30/37) Installing py3-html5lib (1.0.1-r4)
(31/37) Installing py3-pytoml (0.1.21-r0)
(32/37) Installing py3-pep517 (0.8.2-r0)
(33/37) Installing py3-progress (1.5-r0)
(34/37) Installing py3-toml (0.10.1-r0)
(35/37) Installing py3-retrying (1.3.3-r0)
(36/37) Installing py3-contextlib2 (0.6.0-r0)
(37/37) Installing py3-pip (20.1.1-r0)
Executing busybox-1.31.1-r16.trigger
OK: 66 MiB in 51 packages
Removing intermediate container 1ffa1a0ebad2
 ---> a08ed35c2ffa
Step 3/9 : ADD ./webapp/requirements.txt /tmp/requirements.txt
 ---> 21a4faa68011
Step 4/9 : RUN pip3 install --no-cache-dir -q -r /tmp/requirements.txt
 ---> Running in 2a5a71da1ce0
Removing intermediate container 2a5a71da1ce0
 ---> 33f2567b5aba
Step 5/9 : ADD ./webapp /opt/webapp/
 ---> c57fd9a16a17
Step 6/9 : WORKDIR /opt/webapp
 ---> Running in 5c4c49b398ed
Removing intermediate container 5c4c49b398ed
 ---> b637e28d1c73
Step 7/9 : RUN adduser -D myuser
 ---> Running in 744eef4aff08
Removing intermediate container 744eef4aff08
 ---> 25792c6531d5
Step 8/9 : USER myuser
 ---> Running in 7bee04c01e86
Removing intermediate container 7bee04c01e86
 ---> ab64a087b59a
Step 9/9 : CMD gunicorn --bind 0.0.0.0:$PORT wsgi
 ---> Running in 97d3cdf85dde
Removing intermediate container 97d3cdf85dde
 ---> 5751d945346e
Successfully built 5751d945346e
Successfully tagged herokupython:1.0
```