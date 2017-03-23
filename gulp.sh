#!/bin/bash

set -e

CMD="${1}"
if [ "$#" -lt 1 ]; then
  echo "Usage: <command>"
  exit 1
fi

WD=${PWD}


build() {
  gulp
}

if [ -n "${BINTRAY_USER}" ] && [ -n "${BINTRAY_PASSWORD}" ]; then
    curl -u${BINTRAY_USER}:${BINTRAY_PASSWORD} https://api.bintray.com/npm/driveclutch/clutch-ui/auth/scope/clutch > ~/.npmrc
    npm config set @clutch:registry https://api.bintray.com/npm/driveclutch/clutch-ui
fi;

case "${1}" in
  build)
    npm install
    gulp
    ;;
  test)
    gulp test
    ;;
  version)
    gulp version
    ;;
  *)
    echo "Invalid command."
    ;;
esac

exit 0
