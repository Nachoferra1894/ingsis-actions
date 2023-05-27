# Use the official Corretto 18 base image
FROM amazoncorretto:17

# Set the working directory in the container
WORKDIR /app
ARG jar_file

# Copy the Spring server JAR file to the container
COPY build/libs/${jar_file} /app/${jar_file}

# Expose the port on which the server will run
EXPOSE 8080

# Set the entry point for the container
ENTRYPOINT ["java", "-jar", "/app/my-spring-server.jar"]
