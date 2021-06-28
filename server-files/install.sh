#!/bin/sh

# Install required programs
apk add --no-cache screen               # Screen for console access
apk add --no-cache bash                 # Bash for enigmatica start script

# Construct server.properties edit script
cat > properties.sh << 'EOF_properties_header'  # Write header to file
#!/bin/sh
set_server_properties() { 
    property_name=$1
    property_value=$2
    sed -i "s/${property_name}=.*/${property_name}=${property_value}/g" server.properties
}
EOF_properties_header
cat > properties.awk << 'EOF_properties_awk'    # Write awk command to file
!/#/ {
    {printf "set_server_properties "}
    {printf $1}{for(i=2;i<NF;i++){printf "-%s", $i}}
    {printf " \"${"$1}{for(i=2;i<NF;i++){printf "_%s", $i}}
    if($NF) {printf "-" $NF }{printf "}\"\n"}
}
EOF_properties_awk
awk -v q="'" -F'[-=.]' -f properties.awk server.properties >> properties.sh
chmod +x properties.sh                          # Make script executable
