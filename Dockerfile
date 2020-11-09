FROM openjdk:11.0.7-jre-slim

VOLUME /tmp

RUN mvn package 

COPY apiEncryptionKey.jks apiEncryptionKey.jks
COPY UnlimitedJCEPolicyJDK8/* /usr/lib/jvm/java-1.11-openjdk/jre/lib/security/
COPY target/photo-app-api-config-server-0.0.1-SNAPSHOT.jar SpringCloudConfigServer.jar
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "SpringCloudConfigServer.jar"]



 