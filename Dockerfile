FROM shailesh99/myubuntu:1.1

RUN apt-get update
#install closure
RUN apt-get install -y closure-compiler 
#install python
RUN apt-get install -y python2.7
#install java
RUN apt-get install -y default-jdk

ENTRYPOINT ["top", "-b"]
CMD ["-c"]
