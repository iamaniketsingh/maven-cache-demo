#Build the app
FROM maven:3.9.4-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests

# java 17 for creating image  
FROM openjdk:17-jdk-slim
 
 # working directory inside container
WORKDIR /app

#Copies jar into container
COPY --from=build /app/target/demo-app-1.0.jar app.jar

# port used by app
EXPOSE 8080 

# Run app when container starts
ENTRYPOINT ["java", "-jar", "app.jar"]
