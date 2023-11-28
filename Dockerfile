# Use an official Maven image as the build image
FROM maven:3.8.4-openjdk-11-slim AS build

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the POM file first to leverage Docker cache
COPY pom.xml .

# Download dependencies (only if pom.xml has changed)
RUN mvn dependency:go-offline

# Copy the application source code
COPY src ./src

# Build the application
RUN mvn package

# Use a minimal JRE image for the final image
FROM gcr.io/distroless/java:11

# Set the working directory in the final image
WORKDIR /app

# Copy the JAR file from the build image to the final image
COPY --from=build /usr/src/app/target/your-app.jar .

# Specify the command to run on container start
CMD ["java", "-jar", "your-app.jar"]
