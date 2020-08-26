#!/bin/bash -xe
#
# Add package repos needed to build linuxcnc-ethercat

# IgH EtherLab Master:  Cloudsmith etherlabmaster repo
curl -1sLf \
     'https://dl.cloudsmith.io/public/zultron/etherlabmaster/cfg/setup/bash.deb.sh' \
    | bash

# Machinkeit-HAL deps:  Cloudsmith machinekit repo
curl -1sLf \
     'https://dl.cloudsmith.io/public/machinekit/machinekit/cfg/setup/bash.deb.sh' \
    | bash

# Machinekit:  Cloudsmith machinekit-hal repo
curl -1sLf \
     'https://dl.cloudsmith.io/public/machinekit/machinekit-hal/cfg/setup/bash.deb.sh' \
    | bash
