# Build
FROM maven:3.6.3-jdk-11 AS myapp-build
ENV MYAPP_HOME /opt/myapp
WORKDIR $MYAPP_HOME
COPY pom.xml .
COPY sample-application-db-changelog-job/pom.xml ./sample-application-db-changelog-job/
COPY sample-application-http-api-server/pom.xml ./sample-application-http-api-server/
RUN mvn dependency:go-offline
COPY sample-application-db-changelog-job/src ./sample-application-db-changelog-job/src
COPY sample-application-http-api-server/src ./sample-application-http-api-server/src
RUN mvn clean verify

# Run
FROM openjdk:11-jre
ENV MYAPP_HOME /opt/myapp
WORKDIR $MYAPP_HOME
COPY --from=myapp-build $MYAPP_HOME/target/*.jar $MYAPP_HOME/myapp.jar

EXPOSE 8080

ENTRYPOINT java -jar myapp.jar
