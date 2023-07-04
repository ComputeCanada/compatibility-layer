#!/bin/bash

module --force purge
module load gentoo/2020 apptainer

./install_compatibility_layer.sh -r soft.computecanada.ca -v 2023 ${1+"$@"}
