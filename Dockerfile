# Use the official Corretto 18 base image
FROM amazoncorretto:18

# Set the working directory in the container
WORKDIR /app

# Copy the Spring server JAR file to the container
COPY target/my-spring-server.jar /app/my-spring-server.jar

# Expose the port on which the server will run
EXPOSE 8080

# Set the entry point for the container
ENTRYPOINT ["java", "-jar", "/app/my-spring-server.jar"]
