#!/bin/bash

cd ${STORAGE_PATH_SHARED}

$FOLDER=wayback_excludes_update
$URL = https://git.wa.bl.uk/bl-services/wayback_excludes_update.git

if [ ! -d "$FOLDER" ] ; then
    git clone $URL $FOLDER
else
    cd $FOLDER
    git pull $URL
fi