#!/bin/bash
#
# Resume the compatibility layer installation interactively inside an Apptainer container.
# This can be run on any machine which has Apptainer installed, no special privileges are required.
#

CONTAINER=docker://ghcr.io/eessi/build-node-compat-layer:debian-12
RESUME=$1

if [ -z "$RESUME" ]; then
    echo Please specify the name of the installation directory
    exit 1
fi

module --force purge
module load gentoo/2023 apptainer
unset SSL_CERT_FILE
unset CURL_CA_BUNDLE
unset PIP_CONFIG_FILE
unset PIP_CONSTRAINT

$RESUME/software-layer-scripts/eessi_container.sh -c $CONTAINER -g $RESUME -r none -b $RESUME/cvmfs:/cvmfs,$PWD:/compatibility-layer --resume $RESUME --mode shell
