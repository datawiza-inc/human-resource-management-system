# Stage 1: Dependency caching layer
FROM maven:3.9.5-eclipse-temurin-17 as maven-cache
WORKDIR /build
# Copy just the POM file first
COPY HumanResourceManagementSystem/pom.xml .
# Download all dependencies (creates cache layer)
RUN mvn dependency:go-offline -B

# Stage 2: Build application
FROM maven:3.9.5-eclipse-temurin-17 as builder
WORKDIR /app
# Copy cached dependencies from previous stage
COPY --from=maven-cache /root/.m2 /root/.m2
# Copy source files
COPY /HumanResourceManagementSystem/src ./src
COPY /HumanResourceManagementSystem/pom.xml .
# Build application (will use cached dependencies)
RUN mvn clean package -DskipTests -B


# Use a base image with Java and Tomcat
FROM tomcat:9-jdk17-openjdk as datawiza-hrm-app

# Copy your WAR file to Tomcat's webapps directory
COPY --from=builder /app/target/HumanResourceManagementSystem-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Expose ports
EXPOSE 8080

# Set up entrypoint to start both MySQL and Tomcat
CMD ["catalina.sh", "run"]

FROM mysql:8.0 as datawiza-hrm-app-db

ENV MYSQL_ROOT_PASSWORD=psrootpswd
ENV MYSQL_DATABASE=construct_week2
ENV MYSQL_USER=myuser
ENV MYSQL_PASSWORD=mypassword

COPY /data/MySQL_table_creation_query.sql /docker-entrypoint-initdb.d/init.sql

# Expose ports
EXPOSE 3306
