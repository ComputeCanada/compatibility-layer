#!/bin/bash

module --force purge
module load gentoo/2020 apptainer

curl "https://gitweb.gentoo.org/repo/proj/prefix.git/plain/scripts/bootstrap-prefix.sh?id=572c1a5a03ea459d305754ccc25de70dffaaa196" -o bootstrap-prefix-upstream.sh

./install_compatibility_layer.sh -r soft.computecanada.ca -v 2023 ${1+"$@"}
