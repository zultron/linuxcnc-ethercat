#!/bin/bash -xe
#
# Add package repos needed to build linuxcnc-ethercat

# IgH EtherLab Master:  Cloudsmith etherlabmaster repo
curl -1sLf \
    'https://dl.cloudsmith.io/public/zultron/etherlabmaster/setup.deb.sh' \
    | sudo -E bash

# Machinkeit-HAL deps:  Cloudsmith machinekit repo
curl -1sLf \
    'https://dl.cloudsmith.io/public/machinekit/machinekit/setup.deb.sh' \
    | sudo -E bash

# Machinekit:  Cloudsmith machinekit-hal repo
curl -1sLf \
    'https://dl.cloudsmith.io/public/machinekit/machinekit-hal/setup.deb.sh' \
    | sudo -E bash
