# ==============================
# BUILD STAGE
# ==============================
FROM maven:3.9.9-eclipse-temurin-17 AS build

WORKDIR /app

# Copy Maven configuration
COPY pom.xml .

# Download dependencies
RUN mvn dependency:go-offline -B

# Copy source code
COPY src ./src

# Build WAR file
RUN mvn clean package -DskipTests


# ==============================
# RUNTIME STAGE
# ==============================
FROM tomcat:9.0-jdk17-temurin

# Remove default Tomcat applications
RUN rm -rf /usr/local/tomcat/webapps/*

# Deploy ShopEase as ROOT application
COPY --from=build /app/target/ShopEase.war \
    /usr/local/tomcat/webapps/ROOT.war

# Render provides the PORT environment variable
EXPOSE 10000

# Configure Tomcat to listen on Render's PORT
CMD ["sh", "-c", "sed -i \"s/port=\\\"8080\\\"/port=\\\"${PORT}\\\"/\" /usr/local/tomcat/conf/server.xml && catalina.sh run"]
