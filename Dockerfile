# Based on openjre 8
FROM openjdk:8-jre-alpine

# Install screen to container for server access
RUN apk add screen

# Set build directory - can be given at build time
ARG SERVER_DIR=/usr/share/minecraft

# Setup server directory
VOLUME ["${SERVER_DIR}"]
WORKDIR ${SERVER_DIR}

# Expose ports for server and rcon
EXPOSE 25565/tcp
EXPOSE 25575/tcp

# Copy server files
COPY ./server-files ${SERVER_DIR}

# Run server on container start
ENTRYPOINT ["./entrypoint.sh"]
