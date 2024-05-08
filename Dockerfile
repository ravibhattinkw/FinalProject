FROM amazonlinux:latest

RUN yum install -y tomcat
COPY /var/lib/jenkins/workspace/Test/ABC Technologies/target/ABCtechnologies*.war /usr/local/tomcat
EXPOSE 8080
CMD ["catalina.sh", "run"]
