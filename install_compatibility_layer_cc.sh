#!/bin/bash

module --force purge
module load gentoo/2023 apptainer

curl "https://gitweb.gentoo.org/repo/proj/prefix.git/plain/scripts/bootstrap-prefix.sh?id=9080653d8fc30e2f7bb446356bc5d870852c8e00" -o bootstrap-prefix-upstream.sh
sed -i 's/cmd=\"emerge -v -/cmd=\"emerge --ask=n -v -/' bootstrap-prefix-upstream.sh
sed -i 's/emerge -u /emerge --ask=n -u /' bootstrap-prefix-upstream.sh

unset SSL_CERT_FILE
unset CURL_CA_BUNDLE
./install_compatibility_layer.sh -r soft.computecanada.ca -v 2026 ${1+"$@"}
