#!/bin/bash

module --force purge
module load gentoo/2023 apptainer

curl "https://gitweb.gentoo.org/repo/proj/prefix.git/plain/scripts/bootstrap-prefix.sh?id=18b2060485f5d66a50c6bd7dcf2dd628cf89f0af" -o bootstrap-prefix-upstream.sh
sed -i 's/cmd=\"emerge -v -/cmd=\"emerge --ask=n -v -/' bootstrap-prefix-upstream.sh
sed -i 's/emerge -u /emerge --ask=n -u /' bootstrap-prefix-upstream.sh

unset SSL_CERT_FILE
unset CURL_CA_BUNDLE
./install_compatibility_layer.sh -r soft.computecanada.ca -v 2026 ${1+"$@"}
