#!/bin/bash

module --force purge
module load gentoo/2020 apptainer

curl "https://gitweb.gentoo.org/repo/proj/prefix.git/plain/scripts/bootstrap-prefix.sh?id=572c1a5a03ea459d305754ccc25de70dffaaa196" -o bootstrap-prefix-upstream.sh
sed -i 's/cmd=\"emerge -v -/cmd=\"emerge --ask=n -v -/' bootstrap-prefix-upstream.sh
sed -i 's/emerge -u /emerge --ask=n -u /' bootstrap-prefix-upstream.sh

unset SSL_CERT_FILE
unset CURL_CA_BUNDLE
./install_compatibility_layer.sh -r soft.computecanada.ca -v 2023 ${1+"$@"}
