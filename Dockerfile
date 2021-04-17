# Based on openjre 8
FROM openjdk:8-jre-alpine

# Set build directory - can be given at build time
ARG SERVER_DIR=/usr/share/minecraft

# Setup server directory
WORKDIR ${SERVER_DIR}

# Move required files into container
COPY ./server-files ${SERVER_DIR}
# Download vanilla jar
ADD https://launcher.mojang.com/v1/objects/1b557e7b033b583cd9f66746b7a9ab1ec1673ced/server.jar ${SERVER_DIR}/

# Run required install commands
RUN ./install.sh

# Expose ports for server and rcon
EXPOSE 25565/tcp
EXPOSE 25575/tcp

# Define server directory as volume
VOLUME ["${SERVER_DIR}"]

# Run server on container start
ENTRYPOINT ["./entrypoint.sh"]
