#!/bin/sh

echo "LOCKS_AUTH = $LOCKS_AUTH"
echo "STORAGE_PATH_SHARED = $STORAGE_PATH_SHARED"
echo "PYWB_IMAGE = $PYWB_IMAGE"
echo "PUSHPROX_URL = $PUSHPROX_URL"
echo "PUSHPROX_FQDN = $PUSHPROX_FQDN"
echo "EXTRA_CONFIG = $EXTRA_CONFIG"
echo "DLS_ACCESS_SERVER = $DLS_ACCESS_SERVER"
echo "Removing current stack so deployment is completely fresh..."
docker stack rm access_rrwb
echo "Waiting for the services to get cleaned up..."
sleep 30
echo "Deploying the stack..."
echo "Running: docker stack deploy -c docker-compose.yml $EXTRA_CONFIG access_rrwb"
docker stack deploy -c docker-compose.yml $EXTRA_CONFIG access_rrwb
