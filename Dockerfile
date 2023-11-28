# Use an official OpenJDK runtime as a base image
FROM openjdk:8-jdk-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the application JAR file into the container
COPY target/your-spring-mvc-app.jar /app/your-spring-mvc-app.jar

# Expose the port that the application will run on
EXPOSE 8080

# Specify the command to run on container startup
CMD ["java", "-jar", "your-spring-mvc-app.jar"]
