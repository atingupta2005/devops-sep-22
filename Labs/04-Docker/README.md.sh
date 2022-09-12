# Setup Docker
#sudo apt-get remove -y docker docker-ce-cli docker-ce docker-engine docker.io containerd runc
#curl -fsSL get.docker.com -o get-docker.sh
#sh get-docker.sh
#sudo usermod -aG docker $USER

# Now should logout and login again
docker version

USER_SUFFIX=${USER: -2}
echo $USER_SUFFIX

# Creating and Using Containers
## Starting a Nginx Web Server
docker container run --publish 81$USER_SUFFIX:80 --detach --name webhost$USER_SUFFIX nginx
curl localhost:81$USER_SUFFIX
docker container ls
docker container stop webhost$USER_SUFFIX
docker container ls
docker container ls -a
docker container logs webhost$USER_SUFFIX
docker container rm webhost$USER_SUFFIX
docker container ls -a

## Getting a Shell Inside Containers - Open Terminal
docker container run -itd --name ubuntu$USER_SUFFIX ubuntu
docker container ls
docker container exec -it ubuntu$USER_SUFFIX bash

## --- Run some commands in container now
exit

docker container ls
docker container stop ubuntu$USER_SUFFIX
docker container rm ubuntu$USER_SUFFIX
docker container ls -a


# Container Images
# - http://hub.docker.com

docker image ls

docker pull nginx

docker image ls

## Image Tagging and Pushing to Docker Hub

docker image ls

docker image tag nginx $DOCKER_LOGIN_ID/nginx

docker image push $DOCKER_LOGIN_ID/nginx

docker login

docker image push @DOCKER_LOGIN_ID/nginx

## Building Images: The Dockerfile Basics

cd dockerfile-sample-1

vim Dockerfile

## Building Images: Running Docker Builds

docker image build -t customnginx .

docker image ls

docker image build -t customnginx .

## Building Images: Extending Official Images

cd ../dockerfile-sample-2

vim Dockerfile

docker container run -p 80$USER_SUFFIX:80 --rm nginx

docker image build -t nginx-with-html .

docker container run -p 80$USER_SUFFIX:80 --rm nginx-with-html

docker image ls

docker image tag nginx-with-html:latest $DOCKER_LOGIN_ID/nginx-with-html:latest

docker image ls

docker push
