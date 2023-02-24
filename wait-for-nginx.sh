#!/bin/bash

# Be verbose and stop if there is a failure
set -euxo pipefail

NGINX_CONTAINER=access_rrwb_nginx

echo "Waiting for ${NGINX_CONTAINER} to start up..."
until [[ $(docker inspect --format '{{json .Spec.Mode.Replicated.Replicas}}' $NGINX_CONTAINER) == 1 ]]; do

    # Wait before re-checking:
    echo "Sleeping for 5 seconds..."
    sleep 5

done
echo "${NGINX_CONTAINER} has started."