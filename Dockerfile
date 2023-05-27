#Build stage
FROM gradle:latest AS BUILD
WORKDIR /app
COPY . .
RUN gradle build

# Package stage
FROM amazoncorretto:17
ENV APP_HOME=/app
WORKDIR $APP_HOME
ARG jar_file

COPY --from=BUILD $APP_HOME .
EXPOSE 8080
ENTRYPOINT exec java -jar $APP_HOME/build/libs/$jar_file
