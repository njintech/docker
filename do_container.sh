#!/bin/sh

docker run -d --name jenkins \
	--security-opt apparmor:unconfined\
	--cap-add SYS_ADMIN\
	-v ~/_project/reposit/devops-volume/jenkins:/var/jenkins_home\
	-p 8088:8080 \
	-p 50000:50000 \
	-e JENKINS_OPTS="-httpPort=8080" \
	-e JAVA_OPTS="-Djava.io.tmpdir=/var/jenkins_home/tmp" \
	jenkins:latest
