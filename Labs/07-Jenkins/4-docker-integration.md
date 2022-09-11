
Install plugin - docker-build-step
Install plugin - CloudBees Docker Build and Publish

https://github.com/atingupta2005/simple-java-maven-app.git
mvn clean install


Pipeline Name: atin-pipeline-docker

Execute Shell:
docker run -itd --name atin-java-jenkins-docker-$BUILD_NUMBER atingupta2005/java-jenkins-docker:latest

docker logs atin-java-jenkins-docker-$BUILD_NUMBER

--------------------------
https://github.com/atingupta2005/docker-file-node-app

- Execute Shell
port=$(echo $USER | cut -c2-6)
docker run -p 10$BUILD_NUMBER:8081 --name node-hello-$BUILD_NUMBER --detach atingupta2005/docker-file-node-app
sleep 2
curl localhost:10$BUILD_NUMBER
