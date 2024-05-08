FROM amazonlinux:latest

RUN yum install -y tomcat
#RUN cd /var/lib/jenkins/workspace/PipelineJenkinsfile/'ABC Technologies'/target
COPY /var/lib/jenkins/workspace/PipelineJenkinsfile/'ABC Technologies'/target/abc_tech.war /usr/local/tomcat
EXPOSE 8080
CMD ["catalina.sh", "run"]
