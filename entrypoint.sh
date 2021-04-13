#!/bin/sh

# Set required variables
minram=${minram-1024M}
maxram=${maxram-1024M}
javaargs=""

# Construct command
CMD="java -Xmx${minram} -Xms${maxram} ${javaargs} -jar server.jar nogui"

# Output the command to the logs.
echo "Attempting to run: ${CMD}"

# Use environment variable to keep eula requirement
if [[ $eula != "true" ]]
  then
    echo "Please accept the EULA by adding -e eula=true"
    exit
  else
    echo "eula=true" > eula.txt
fi

# Configure rcon using given password
if [[ -z $rconpassword ]]
  then
    sed -i "s/enable-rcon=.*/enable-rcon=false/g" ./server.properties
    echo "For console access, set a rcon password by adding -e rconpassword=<password>"
  else
    sed -i "s/enable-rcon=.*/enable-rcon=true/g" ./server.properties
    sed -i "s/rcon.password=.*/rcon.password=${rconpassword}/g" ./server.properties
    echo "RCON password set to ${rconpassword}"
fi

# Run the command.
${CMD}
