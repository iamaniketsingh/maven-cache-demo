#Build the app
FROM maven:3.9.4-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests

# port used by app
EXPOSE 8080 

# Run app when container starts
ENTRYPOINT ["java", "-jar", "target/demo-app-1.0.jar"]
