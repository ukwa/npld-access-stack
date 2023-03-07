#!/bin/sh

echo "Sleeping for 15 seconds while the OutbackCDX server starts up..."
sleep 15

echo "Now posting the data to the CDX server..."
curl -X POST --data-binary @/test-data/portico.bl.uk-data-102148-31031342-BL-31031342-0.cdx http://localhost:8080/tc

