#!/bin/sh

# Install required programs
apk add --no-cache screen               # Screen for console access
apk add --no-cache bash                 # Bash for enigmatica start script

# Construct server.properties edit script
cat > properties.sh << 'EOF'                # Write header to file
#!/bin/sh
set_server_properties() { 
    property_name=$1
    property_value=$2
    sed -i "s/${property_name}=.*/${property_name}=${property_value}/g" server.properties
}
EOF
awk -v q="'" -F'[-=.]' -f properties.awk server.properties >> properties.sh # Run awk
chmod +x properties.sh                      # Make script executable