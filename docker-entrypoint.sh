#!/bin/sh

echo $PWD

while getopts c:C: OPTION
do
  case "${OPTION}" in
    c|C)  C_FLAG="${OPTARG}" ;;
    *)  exit 1 ;;
  esac
done

make build

if "${C_FLAG}" ; then
  make clean
fi

exit 0