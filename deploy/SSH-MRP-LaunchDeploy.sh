#!/bin/bash

function log()
{
  mess="$(hostname): $1"
  logger -t "${BASH_SCRIPT}" "${mess}"
}

# print commands and arguments as they are executed
#set -x

echo "initializing mrp installation"

# Parameters
BASH_SCRIPT="${0}"
DEPLOY_DIRECTORY="${1}"

log "Deploy Directory is ${DEPLOY_DIRECTORY}" "N"

cd "$DEPLOY_DIRECTORY/deploy"

#in VSTS SSH Task output from bash commands are considered as ##[debug]stderr = converting file deploy_mrp_app.sh to Unix format ...
dos2unix deploy_mrp_app.sh >/dev/null 2>&1
sudo bash ./deploy_mrp_app.sh > ${DEPLOY_DIRECTORY}/deploy_mrp_app.log 2>&1