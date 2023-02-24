#!/bin/bash

# Be verbose and stop if there is a failure
set -euxo pipefail

echo "Start shutdown..."
docker stack rm access_rrwb

echo "Waiting for the stack to shutdown..."
# The network is the last thing to go, so check for that...
until [[ $( docker network ls | grep access_rrwb_default | wc -l) == 0 ]]; do

    # Wait before re-checking:
    echo "Sleeping for 5 seconds..."
    sleep 5

done
echo "The stack is down."
