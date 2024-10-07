# Start with a base image containing Java runtime and Maven
FROM maven:3.8.4-openjdk-17 as build

COPY src /laptop-store/src
COPY pom.xml /laptop-store

WORKDIR /laptop-store

RUN mvn clean package -DskipTests


FROM openjdk:17-slim

COPY --from=build /laptop-store/target/*.war /laptop-store/app.war

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/laptop-store/app.war"]

