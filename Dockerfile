# ---- Build stage ----
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app

# Copy project files
COPY pom.xml .
COPY src ./src

# Build jar (skip tests for faster build)
RUN mvn clean package -DskipTests

# ---- Run stage ----
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

# Copy built jar
COPY --from=build /app/target/*.jar app.jar

# Allow dynamic port
ENV PORT=8080
EXPOSE 8080

ENTRYPOINT ["java","-jar","app.jar"]
