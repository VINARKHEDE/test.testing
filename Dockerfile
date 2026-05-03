FROM alpine/java:22
WORKDIR /app
COPY HelloWorld.java /app
RUN  ["javac","HelloWorld.java"]
CMD  ["java","HelloWorld"]
