# Use an official Maven image to build the app
FROM maven:3.9.6-eclipse-temurin-17 AS build

# Clone the repository
RUN git clone https://github.com/muhadh98/weather-api.git /app
WORKDIR /app

# Build the application (skip tests for faster build)
RUN mvn clean package -DskipTests

# Use a lightweight JRE image for running the app
FROM eclipse-temurin:17-jre-alpine

# Set work directory
WORKDIR /app

# Copy the built jar from the build stage
COPY --from=build /app/target/weather-api-1.0-SNAPSHOT.jar app.jar

# Expose the application port
EXPOSE 8082

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]