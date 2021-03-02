# Based on openjre 8
FROM openjdk:8-jre-alpine

# Set build directory - can be given at build time
ARG SERVER_DIR=/usr/share/minecraft

# Setup server directory
VOLUME ["${SERVER_DIR}"]
WORKDIR ${SERVER_DIR}

# Expose ports for server and rcon
EXPOSE 25565/tcp
EXPOSE 25575/tcp

# Copy basic files
COPY forge-1.7.10-10.13.4.1614-1.7.10-universal.jar ${SERVER_DIR}/
COPY minecraft_server.1.7.10.jar ${SERVER_DIR}/
COPY server.properties ${SERVER_DIR}/server.properties
COPY eula.txt ${SERVER_DIR}/eula.txt

# Copy simply magic configuartion files
COPY asm ${SERVER_DIR}/asm/
COPY config ${SERVER_DIR}/config/
COPY libraries ${SERVER_DIR}/libraries/
COPY mods ${SERVER_DIR}/mods/
COPY scripts ${SERVER_DIR}/scripts/

# Script for runtime
ADD entrypoint.sh ${SERVER_DIR}/entrypoint.sh

# Run server on container start
ENTRYPOINT ["./entrypoint.sh"]
