FROM tomcat:8.5.31-jre8
ADD  /target/my-app.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]
EXPOSE 8080
