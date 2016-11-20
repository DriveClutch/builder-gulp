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
