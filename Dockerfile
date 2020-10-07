FROM openjdk:11-jre-slim
RUN mkdir -p /code
COPY target/*.jar /code/discovery-server.jar
EXPOSE 8761
WORKDIR /code/
ENTRYPOINT ["java","-jar","discovery-server.jar"]