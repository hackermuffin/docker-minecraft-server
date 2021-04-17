# minecraft-docker-server

This repo contains the build files for a series of vanilla and modded Minecraft servers setup to run in docker containers.

## Current (supported) tag options
- `latest`, `1.16.5`
- `enigmatica6`

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
  minecraft-server:
```

The server launches in a screen terminal within the docker container. This can be accessed with the following command:
``` console
docker exec -it enigmatica6-minecraft-server screen -x
```

## Server configuration
The server may be configured through the use of the following environment variables
### Settings from server.properties
The following environment variables can be used to change settings in server.properties, shown with their default values

- `spawn-protection=16`
- `max-tick-time=60000`
- `query.port=25565`
- `generator-settings=`
- `sync-chunk-writes=true`
- `force-gamemode=false`
- `allow-nether=true`
- `enforce-whitelist=false`
- `gamemode=survival`
- `broadcast-console-to-ops=true`
- `enable-query=false`
- `player-idle-timeout=0`
- `text-filtering-config=`
- `difficulty=easy`
- `spawn-monsters=true`
- `broadcast-rcon-to-ops=true`
- `op-permission-level=4`
- `pvp=true`
- `entity-broadcast-range-percentage=100`
- `snooper-enabled=true`
- `level-type=default`
- `hardcore=false`
- `enable-status=true`
- `enable-command-block=false`
- `max-players=20`
- `network-compression-threshold=256`
- `resource-pack-sha1=`
- `max-world-size=29999984`
- `function-permission-level=2`
- `rcon.port=25575`
- `server-port=25565`
- `server-ip=`
- `spawn-npcs=true`
- `allow-flight=false`
- `level-name=world`
- `view-distance=10`
- `resource-pack=`
- `spawn-animals=true`
- `white-list=false`
- `rcon.password=`
- `generate-structures=true`
- `max-build-height=256`
- `online-mode=true`
- `level-seed=`
- `use-native-transport=true`
- `prevent-proxy-connections=false`
- `enable-jmx-monitoring=false`
- `enable-rcon=false`
- `rate-limit=0`
- `motd=A Minecraft Server`

### Server configuration
The following variables can be used to configure properties of how the server is run, with their default values. Currently, these values are only used if the server is started directly, rather than through a wrapper script.

- `minram=1024M`
- `maxram=1024M`
- `javaargs=`

## More advanced usage

To use rcon to access the server console, you will need to set the rconpassword environment variable, map the container port 25575 to an external port, then connect to the server using a rcon client ([my personal choice](https://github.com/Tiiffi/mcrcon)) on port 25575 (or wherever you choose to map it).


If you're looking for a Minecraft specific proxy, check out [this project](https://github.com/janispritzkau/minecraft-reverse-proxy).
