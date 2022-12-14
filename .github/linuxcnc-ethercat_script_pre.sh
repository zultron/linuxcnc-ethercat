#!/bin/bash -xe
#
# Add package repos needed to build linuxcnc-ethercat

sudo apt-get install -y curl

add_cloudsmith_repo() {
    local ORG=$1
    local REPO=$2
    curl -1sLf "https://dl.cloudsmith.io/public/$ORG/$REPO/setup.deb.sh" \
        > /tmp/setup.deb.sh
    sudo -E bash /tmp/setup.deb.sh
}

# IgH EtherLab Master
add_cloudsmith_repo zultron etherlabmaster-test

# Machinekit-HAL deps
add_cloudsmith_repo machinekit machinekit

# Machinekit-HAL
# add_cloudsmith_repo machinekit machinekit-hal
add_cloudsmith_repo zultron machinekit
