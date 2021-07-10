#!/bin/bash


name=$(basename $1)
name="${name%%.*}"
path=$(dirname $1)


pandoc -d utils/params.yaml -o "$path/$name.html" "$1"
