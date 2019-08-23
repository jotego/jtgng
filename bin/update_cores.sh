#!/bin/bash
MIST=mist

while [ $# -gt 0 ]; do
    case "$1" in
        "-mister")
            MIST=mister;;
        "-mist")
            MIST=mist;;
        *)  echo "ERROR: Unknown option $1";
            exit 1;;
    esac
    shift
done

cores="1942 1943 gng commando"

(for i in $cores; do echo $i; done) | parallel jtcore $MIST