# minecraft-docker-server

A repo designed to house a number of vanilla and modded Minecraft servers.

## Current tag options
- `latest`,`1.16.5`

## Basic usage

The following command will run the docker container. By setting the `eula=true` you agree to the [Minecraft End User License Agreement](https://www.minecraft.net/en-us/eula). 

For console access, you will need to set the rconpassword environment variable, then connect to the server using a rcon client ([my personal choice](https://github.com/Tiiffi/mcrcon)).

``` console
docker run -d \
    -v minecraft:/usr/src/minecraft \
    -p 25565:25565 \
    -p 25575:25575 \
    -e eula=true \
    -e rconpassword=<password> \
    hackermuffin/minecraft-server
```