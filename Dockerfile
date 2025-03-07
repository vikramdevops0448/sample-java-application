# Use an OpenJDK base image
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the compiled Java app into the container
COPY target/sample-java-app-1.0-SNAPSHOT.jar app.jar

# Expose the application port (optional)
EXPOSE 8080

# Command to run the Java app
CMD ["java", "-jar", "app.jar"]
