#!/bin/bash

function log()
{
  mess="$(hostname): $1"
  logger -t "${BASH_SCRIPT}" "${mess}"
}

# print commands and arguments as they are executed
set -x

echo "initializing mrp installation"
date
ps axjf

CWD="$(cd -P -- "$(dirname -- "$0")" && pwd -P)"

log "CustomScript Directory is ${CWD}" "N"

# Parameters
BASH_SCRIPT="${0}"

# Install PartsUnlimitedMRP dependencies

log "Update the list of available packages and their versions ..."
until apt-get --yes update
do
    log "Lock detected on apt-get while install Try again..."
    sleep 2
done

#log "Installs newer versions of the packages ..."
# apt-get upgrade -y

log "Install openjdk-8-jdk ..."
until apt-get --yes install openjdk-8-jdk > /dev/null 2>&1
do
    log "Lock detected on apt-get while install Try again..."
    sleep 2
done

log "Install openjdk-8-jre ..."
until apt-get --yes install openjdk-8-jre > /dev/null 2>&1
do
    log "Lock detected on apt-get while install Try again..."
    sleep 2
done

log "Install mongodb ..."
until apt-get --yes install mongodb > /dev/null 2>&1
do
    log "Lock detected on apt-get while install Try again..."
    sleep 2
done

log "Install tomcat7 ..."
until apt-get --yes install tomcat7 > /dev/null 2>&1
do
    log "Lock detected on apt-get while install Try again..."
    sleep 2
done

log "Install wget ..."
until apt-get --yes install wget > /dev/null 2>&1
do
    log "Lock detected on apt-get while install Try again..."
    sleep 2
done

log "Install dos2unix ..."
until apt-get --yes install dos2unix > /dev/null 2>&1
do
    log "Lock detected on apt-get while install Try again..."
    sleep 2
done

# In Release Management PowerShell Script use a Sudo Command through a plink call (without tty)
log "Adding the Remove requiretty in /etc/sudoers" "N"
#changing the value if the line was already there
#sed -i 's/Defaults    requiretty/Defaults    !requiretty/g' /etc/sudoers
#adding the line if it was not already there
USER="stephgou"
printf "Defaults:%s !requiretty\n" "${USER}"       >> "/etc/sudoers"

# Set Java environment variables
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export PATH=$PATH:/usr/lib/jvm/java-8-openjdk-amd64/bin
