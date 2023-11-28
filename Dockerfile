# Build stage
FROM maven:3.8.5-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

# Final stage
FROM openjdk:17.0.1-jdk-slim
COPY --from=build /target/MVC-0.0.1-SNAPSHOT.jar MVC.jar

# Debugging information
RUN ls -al /target

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "MVC.jar"]
