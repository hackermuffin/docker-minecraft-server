# Based on openjre 8
FROM openjdk:8-jre-alpine

# Set build directory - can be given at build time
ARG SERVER_DIR=/minecraft

# Setup server directory
VOLUME ["${SERVER_DIR}"]
WORKDIR ${SERVER_DIR}

# Expose ports for server and rcon
EXPOSE 25565/tcp
EXPOSE 25575/tcp

# Setup minecraft files
ADD https://launcher.mojang.com/v1/objects/1b557e7b033b583cd9f66746b7a9ab1ec1673ced/server.jar ${SERVER_DIR}/
COPY server.properties ${SERVER_DIR}/server.properties
COPY eula.txt ${SERVER_DIR}/eula.txt

# Script for runtime
ADD entrypoint.sh ${SERVER_DIR}/entrypoint.sh

# Run server on container start
ENTRYPOINT ["./entrypoint.sh"]
