FROM tomcat:8.5.31-jre8
RUN rm -rvf /usr/local/tomcat/webapps/ROOT
ADD  /target/my-app.war /usr/local/tomcat/webapps/ROOT.war
CMD ["catalina.sh", "run"]
EXPOSE 8080
