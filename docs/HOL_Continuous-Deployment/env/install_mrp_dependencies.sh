#!/bin/bash

function log()
{
  mess="$(hostname): $1"
  logger -t "${BASH_SCRIPT}" "${mess}"
}

# Install PartsUnlimitedMRP dependencies

log "Update the list of available packages and their versions ..."
until apt-get --yes update
do
    log "Lock detected on apt-get while install Try again..."
    sleep 2
done

log "Installs newer versions of the packages ..."
until apt-get --yes upgrade > /dev/null 2>&1
do
    log "Lock detected on apt-get while install Try again..."
    sleep 2
done

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



# Set Java environment variables
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export PATH=$PATH:/usr/lib/jvm/java-8-openjdk-amd64/bin
