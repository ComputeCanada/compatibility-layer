#!/bin/bash

module --force purge
module load gentoo/2023 apptainer

curl "https://gitweb.gentoo.org/repo/proj/prefix.git/plain/scripts/bootstrap-prefix.sh?id=55c58e90fb683662fa6d7ecd5b3697697eeb3e10" -o bootstrap-prefix-upstream.sh
sed -i 's/cmd=\"emerge -v -/cmd=\"emerge --ask=n -v -/' bootstrap-prefix-upstream.sh
sed -i 's/emerge -u /emerge --ask=n -u /' bootstrap-prefix-upstream.sh

unset SSL_CERT_FILE
unset CURL_CA_BUNDLE
./install_compatibility_layer.sh -r soft.computecanada.ca -v 2026 ${1+"$@"}
