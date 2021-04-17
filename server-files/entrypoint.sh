#!/bin/sh

# Set required variables
eula=${eula-false}          # Default eula to false
runscript=false             # Run using script provided by modpack (true/false)
minram=${minram-1024M}      # Default minimum ram
maxram=${maxram-1024M}      # Default maximum ram
name="minecraft-server"     # Set screen session name
jar="server.jar"            # Set jar to execute
scriptname=""               # Script name to use if needed

# Use environment variable to keep eula requirement
if [ $eula != true ]; then
  echo "Please accept the EULA by adding -e eula=true"
  exit
else
  echo "Agreed to EULA"
  echo "eula=true" > eula.txt
fi

# Use generated script to update server.properties based on variables
./properties.sh

# Construct command
if [ $runscript == false ]; then
  CMD="java -Xmx${minram} -Xms${maxram} ${javaargs} -jar ${jar} nogui"
elif [ $runscript == true ]; then
  CMD="./${scriptname}"
else
  echo "Please use a boolean value for runscript"
  exit
fi

# Output the command to the logs.
echo "Attempting to use a screen session called ${name} to run: ${CMD}"

# Run the command in a screen terminal
screen -S minecraft-server sh -c "while :; do ${CMD}; echo Server down. Press Ctrl+C to stop reboot; sleep 10; done"