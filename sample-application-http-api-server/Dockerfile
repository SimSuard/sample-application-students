# Run
FROM openjdk:11-jre
ENV MYAPP_HOME /opt/myapp
WORKDIR $MYAPP_HOME
RUN ls -l 
COPY ~/sample-application-http-api-server/target/sample-application-http-api-server-0.0.1-SNAPSHOT-exec.jar $MYAPP_HOME/myapp.jar

EXPOSE 8080

ENTRYPOINT java -jar myapp.jar
