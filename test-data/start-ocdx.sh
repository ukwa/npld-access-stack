#!/bin/sh

# Fork a process to populate the server:
/test-data/populate-cdx.sh &

# Startup...
echo "Starting OutbackCDX..."
java -jar outbackcdx.jar -d /cdx-data -p 8080 -b 0.0.0.0