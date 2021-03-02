#!/bin/sh

CMD="java -Xmx1024M -Xms1024M -XX:PermSize=256M -jar forge-1.7.10-10.13.4.1614-1.7.10-universal.jar nogui"

# Output the command to the logs.
echo "Attempting to run: ${CMD}"

if [[ $eula != "true" ]]
  then
    echo "Please accept the EULA by adding -e eula=true"
    exit
fi

if [[ -z $rconpassword ]]
  then
    echo "For console access, set a rcon password by adding -e rconpassword=<password>"
  else
    sed -i "s/rcon.password=.*/rcon.password=${rconpassword}/g" ./server.properties
    echo "RCON password set to ${rconpassword}"
fi

# Run the command.
${CMD}
