# java 17 for creating image  
FROM openjdk:17-jdk-slim
 
 # working directory inside container
WORKDIR /app

#Copies jar into container
COPY target/demo-app-1.0.jar app.jar

# port used by app
EXPOSE 8080 

# Run app when container starts
ENTRYPOINT ["java", "-jar", "app.jar"]
