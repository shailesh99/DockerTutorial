#*********************************************************************************
#Totorial to create a Docker image with Ubuntu, Closure compiler, python and java 
#and push it to your own repository in DockerHub
#*********************************************************************************

#Step 1
#Download the official Ubuntu image from Docker hub
docker image pull ubuntu

#see the downloaded image
docker image ls

#Step 2
#Create a repository in Dockerhub https://hub.docker.com/repositories
#Go to "Create Repository"
#Add the image to your own repository as the 1st version of your image

#docker image tag (image):[tag] [repository]/(image):[tag]
#docker image push [repository]/(image):[tag]
#example
docker image tag ubuntu:latest shailesh99/myubuntu:1.0
docker image push shailesh99/myubuntu:1.0

#Step3
#Create a Dockerfile in a directory designated for your project
#A sample Dockerfile is given with this documentation.
#
#
#The first command FROM gives the base image your custom image will use
#Every RUN command will add a layer to your image
#The ENTRYPOINT command gives the 1st command to run when a container of the image starts
#CMD gives additional parameters to the command given in ENTRYPOINT
#
#CMD vs ENTRYPOINT
#CMD sets default command and/or parameters, which can be overwritten from command line when docker container runs


#Step 4
#Build the image
#docker build -t [repository]/[image]:[tag]
docker build -t shailesh99/myubuntu:1.1
#list the newly built image and notice the difference in size of the two versions of the Ubuntu images
docker image ls

#Step 5
#Run a container of the newly built image
#docker run -d --name [name of the container] [image:tag]
docker run -d --name myubuntu1.1 shailesh99/myubuntu:1.1
#see the running container
docker container ls 
docker container ls -a
docker ps
docker ps -a

#Step 6
#Checkin the new image in your repository with a different tag
docker image push [repository]/(image):[tag]
docker image push shailesh99/myubuntu1.1

#login to your running container 
docker exec -it myubuntu1.1 /bin/bash
