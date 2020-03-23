### Notes

This is an example of a Node.js basic application using Redis running inside a Docker container.

Steps: 
1. Create Node.js web app
2. Create a Dockerfile
3. Build image from dockerfile
4. Run image as container
5. Connect to web app from a browser

Template of Dockerfile:
1. Specify a base image
2. Run some commands to install additional programs
3. Specify a command to run on container setup

So in Redis container case:
- REDIS  
    ``` 
        From alpine
        Run apk add --update redis
        CMD["redis-server"]
     ``` 
- Node
     ``` 
         From node:alpine
         Run npm install 
         CMD["npm, start"]
    ``` 

Build the Docker image based on the instruction set on Dockerfile:
```
docker build .
```
It's a best practice to tag the image being built:
```
docker build -t trailblazersgarage/node-redis-app .
```
Run the image:
```
docker run trailblazersgarage/node-redis-app
```
Define the port mapping from income network traffic to your docker container
```
docker run -p ROUTE_INCOMING_REQUEST_PORT_LOCAL_HOST : PORT_INSIDE_CONTAINER <image_ID>
docker run -p 5000:8080 trailblazersgarage/node-redis-app
```

#### Extra notes
Change the port where the application is running = PORT_INSIDE_CONTAINER
```
app.listen(8080, () => {
    console.log('Listening on port 8080');
});
```
