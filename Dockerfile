# Use the official Maven image as a base image
FROM maven:3.8.4-openjdk-11-slim AS builder

# Set the working directory in the container
WORKDIR /app

# Copy the project files into the container
COPY . .

# Build the Maven project
RUN mvn clean install

# Use the official Tomcat image as a base image
FROM tomcat:9.0.53-jdk11-openjdk-slim

# Copy the war file built in the previous stage into the Tomcat webapps directory
COPY --from=builder /app/target/your-web-app.war /usr/local/tomcat/webapps/

# Expose the port on which Tomcat will run
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
