FROM openjdk:19-jdk-slim

# Copy jar into container
COPY logger.jar /app/logger.jar

WORKDIR /app    

CMD ["java", "-jar", "logger.jar"]