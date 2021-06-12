# minecraft-docker-server

This repo contains the build files for a series of vanilla and modded Minecraft servers setup to run in docker containers.

## Current (supported) tag options
- `latest`, `vanilla-1.17`
- `vanilla-1.16.5`
- `enigmatica6`
- `simply-magic-1.1.6`

## Basic usage

The following command will run the docker container with the default configuration. By using the `eula=true` you agree to the [Minecraft End User License Agreement](https://www.minecraft.net/en-us/eula). 

``` console
docker run -dit \
    --name 1.16.5-minecraft-server \
    -v minecraft-server:/usr/src/minecraft \
    -p 25565:25565 \
    -e eula=true \
    hackermuffin/minecraft-server:vanilla-1.16.5
```

Or for a docker-compose version:

``` console
version: "3"
services:
  minecraft-server:
    image: "hackermuffin/minecraft-server:vanilla-1.16.5"
    container_name: 1.16.5-minecraft-server
    stdin_open: true
    tty: true
    restart: unless-stopped
    ports:
      - 25565:25565
    volumes:
      - minecraft-server:/usr/share/minecraft
    environment:
      - eula=true

volumes:
  minecraft-server:
```

The server launches in a screen terminal within the docker container. This can be accessed with the following command:
``` console
docker exec -it 1.16.5-minecraft-server screen -x
```

## Server configuration
The server may be configured through the use of the following environment variables
### Settings from server.properties
The following environment variables can be used to change settings in server.properties, shown with their default values
- `spawn_protection=16`
- `max_tick_time=60000`
- `query_port=25565`
- `generator_settings=`
- `sync_chunk_writes=true`
- `force_gamemode=false`
- `allow_nether=true`
- `enforce_whitelist=false`
- `gamemode=survival`
- `broadcast_console_to_ops=true`
- `enable_query=false`
- `player_idle_timeout=`
- `text_filtering_config=`
- `difficulty=easy`
- `spawn_monsters=true`
- `broadcast_rcon_to_ops=true`
- `op_permission_level=4`
- `pvp=true`
- `entity_broadcast_range_percentage=100`
- `snooper_enabled=true`
- `level_type=default`
- `hardcore=false`
- `enable_status=true`
- `enable_command_block=false`
- `max_players=20`
- `network_compression_threshold=256`
- `resource_pack_sha1=`
- `max_world_size=29999984`
- `function_permission_level=2`
- `rcon_port=25575`
- `server_port=25565`
- `server_ip=`
- `spawn_npcs=true`
- `allow_flight=false`
- `level_name=world`
- `view_distance=10`
- `resource_pack=`
- `spawn_animals=true`
- `white_list=false`
- `rcon_password=`
- `generate_structures=true`
- `max_build_height=256`
- `online_mode=true`
- `level_seed=`
- `use_native_transport=true`
- `prevent_proxy_connections=false`
- `enable_jmx_monitoring=false`
- `enable_rcon=false`
- `rate_limit=`
- `motd=A Minecraft Server`
### Server configuration
The following variables can be used to configure properties of how the server is run, with their default values. Currently, these values are only used if the server is started directly, rather than through a wrapper script.

- `minram=1024M`
- `maxram=1024M`
- `javaargs=`

## More advanced usage

To use rcon to access the server console, you will need to set the rconpassword environment variable, map the container port 25575 to an external port, then connect to the server using a rcon client ([my personal choice](https://github.com/Tiiffi/mcrcon)) on port 25575 (or wherever you choose to map it).


If you're looking for a Minecraft specific proxy, check out [this project](https://github.com/janispritzkau/minecraft-reverse-proxy).
