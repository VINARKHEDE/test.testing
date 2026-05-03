# Use OpenJDK as base image
FROM openjdk:11-jdk-slim
# Copy the source code into the container
COPY HelloWorld.java /app/HelloWorld.java
WORKDIR /app
# Compile the Java program
RUN javac HelloWorld.java
# Run the application
CMD ["java", "HelloWorld"]
