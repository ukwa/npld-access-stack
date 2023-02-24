#!/bin/bash

# Be verbose and stop if there is a failure
set -euxo pipefail

echo "Waiting for all replicas to start up..."
until [[ $(docker stack services access_rrwb | grep "0/1" | wc -l) == 0 ]]; do

    # Wait before re-checking:
    echo "Sleeping for 5 seconds..."
    sleep 5

done
echo "All containers have started."