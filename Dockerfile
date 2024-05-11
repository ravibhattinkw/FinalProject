FROM tomcat:latest

#RUN cd /var/lib/jenkins/workspace/PipelineJenkinsfile/'ABC Technologies'/target
#COPY /var/lib/jenkins/workspace/PipelineJenkinsfile/abc_tech.war /usr/local/tomcat
#COPY abc_tech.war /opt/apache-tomcat-9.0.89/webapps/.
COPY server.xml /usr/local/tomcat/conf/
COPY abc_tech.war /usr/local/tomcat/webapps/
EXPOSE 8090
CMD ["catalina.sh", "run"]
