#!/bin/sh

# Set required variables
eula=${eula-false}          # Default eula to false
minram=${minram-1024M}      # Default minimum ram
maxram=${maxram-1024M}      # Default maximum ram
name="minecraft-server"     # Set screen session name
jar="server.jar"            # Set jar to execute

# Use environment variable to keep eula requirement
if [ $eula != true ]; then
  echo "Please accept the EULA by adding -e eula=true"
  exit
else
  echo "Agreed to EULA"
  echo "eula=true" > eula.txt
fi

# Configure rcon using given password
if [ -z $rconpassword ]; then
  sed -i "s/enable-rcon=.*/enable-rcon=false/g" ./server.properties
  echo "For console access, set a rcon password by adding -e rconpassword=<password>"
else
  sed -i "s/enable-rcon=.*/enable-rcon=true/g" ./server.properties
  sed -i "s/rcon.password=.*/rcon.password=${rconpassword}/g" ./server.properties
  echo "RCON password set to ${rconpassword}"
fi

# Construct command
CMD="java -Xmx${minram} -Xms${maxram} ${javaargs} -jar ${jar} nogui"

# Output the command to the logs.
echo "Attempting to use a screen session called ${name} to run: ${CMD}"

# Run the command in a screen terminal, redirecting incorrect error message to /dev/null
screen -S minecraft-server sh -c "while :; do ${CMD}; echo Server down. Press Ctrl+C to stop reboot; sleep 10; done" 2> /dev/null