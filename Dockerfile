# Based on openjre 8
FROM openjdk:8-jre-alpine

# Setup container
VOLUME ["/minecraft"]
WORKDIR /minecraft
EXPOSE 25565/tcp
EXPOSE 25575/tcp

# Setup minecraft files
COPY server.jar /minecraft/server.jar
COPY eula.txt /minecraft/eula.txt

# Run server on container start
CMD ["java", "-Xmx1024M", "-Xms1024M", "-jar", "server.jar", "nogui"]
