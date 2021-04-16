# minecraft-docker-server

This repo contains the build files for a series of vanilla and modded Minecraft servers setup to run in docker containers.

## Current (supported) tag options
- `latest`, `1.16.5`

## Basic usage

The following command will run the docker container with the default configuration. By using the `eula=true` you agree to the [Minecraft End User License Agreement](https://www.minecraft.net/en-us/eula). 

``` console
docker run -dit \
    --name enigmatica6-minecraft-server \
    -v minecraft-server:/usr/src/minecraft \
    -p 25565:25565 \
    -e eula=true \
    hackermuffin/minecraft-server:enigmatica6
```

Or for a docker-compose version:

``` console
version: "3"
services:
  enigmatica6-minecraft-server:
    image: "hackermuffin/minecraft-server:enigmatica6"
    container_name: enigmatica6-minecraft-server
    stdin_open: true
    tty: true
    restart: unless-stopped
    ports:
      - 25565:25565
    volumes:
      - enigmatica6-minecraft-server:/usr/share/minecraft
    environment:
      - eula=true

volumes:
  minecraft-server:e
```

The server launches in a screen terminal within the docker container. This can be accessed with the following command:
``` console
docker exec -it enigmatica6-minecraft-server screen -x
```

## More advanced usage

To use rcon to access the server console, you will need to set the rconpassword environment variable, map the container port 25575 to an external port, then connect to the server using a rcon client ([my personal choice](https://github.com/Tiiffi/mcrcon)) on port 25575 (or wherever you choose to map it).

Other optional environment variables are:
- `minram`: minimum ram of the server
- `maxram`: maximum ram of the server
- `javaargs`: jvm arguments to use

If you're looking for a Minecraft specific proxy, check out [this project](https://github.com/janispritzkau/minecraft-reverse-proxy).
