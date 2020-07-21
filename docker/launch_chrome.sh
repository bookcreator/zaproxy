#!/usr/bin/env nix-shell
#! nix-shell -i bash -p nssTools

set -xeuo pipefail

curl  http://localhost:8090/OTHER/core/other/rootcert/ | \
  certutil -d sql:$HOME/.pki/nssdb -A -t "CT,c,c" -n "ZAProxy Trust Root" \

ALL_PROXY=http://localhost:8090/ google-chrome-unstable > /dev/null 2>&1 &
