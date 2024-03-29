#!/bin/bash

cat > README.md << 'EOF_README_TOP'  # Write header to file
# minecraft-docker-server

This repo contains the build files for a series of vanilla and modded Minecraft servers setup to run in docker containers.

## Current (supported) tag options
- `latest`, `vanilla`, `vanilla-1.17.1`
- `vanilla-1.17`
- `vanilla-1.16.5`
- `enigmatica6`, `enigmatica6-0.5.9` 
- `enigmatica6-0.4.14`
- `engimatica6-0.4.8`
- `simply-magic`, `simply-magic-1.1.6`

## Basic usage

The following command will run the docker container with the default configuration. By using the `eula=true` you agree to the [Minecraft End User License Agreement](https://www.minecraft.net/en-us/eula). 

``` console
docker run -dit \
    --name vanilla-minecraft-server \
    -v vanilla-minecraft-server:/usr/src/minecraft \
    -p 25565:25565 \
    -e eula=true \
    hackermuffin/minecraft-server:vanilla
```

Or for a docker-compose version:

``` console
version: "3"
services:
  minecraft-server:
    image: "hackermuffin/minecraft-server:vanilla"
    container_name: vanilla-minecraft-server
    stdin_open: true
    tty: true
    restart: unless-stopped
    ports:
      - 25565:25565
    volumes:
      - vanilla-minecraft-server:/usr/share/minecraft
    environment:
      - eula=true

volumes:
  vanilla-minecraft-server:
```

The server launches in a screen terminal within the docker container. This can be accessed with the following command:
``` console
docker exec -it vanilla-minecraft-server screen -x
```

## Server configuration
The server may be configured through the use of the following environment variables
### Settings from server.properties
The following environment variables can be used to change settings in server.properties, shown with their default values
EOF_README_TOP

awk -v q="'" -F'[-=.]' -f readme-generation.awk server-files/server.properties >> README.md

cat >> README.md << 'EOF_README_BOTTOM'
### Server configuration
The following variables can be used to configure properties of how the server is run, with their default values. Currently, these values are only used if the server is started directly, rather than through a wrapper script.

- `minram=1024M`
- `maxram=1024M`
- `javaargs=`

## More advanced usage

To use rcon to access the server console, you will need to set the rconpassword environment variable, map the container port 25575 to an external port, then connect to the server using a rcon client ([my personal choice](https://github.com/Tiiffi/mcrcon)) on port 25575 (or wherever you choose to map it).


If you're looking for a Minecraft specific proxy, check out [this project](https://github.com/janispritzkau/minecraft-reverse-proxy).
EOF_README_BOTTOM
