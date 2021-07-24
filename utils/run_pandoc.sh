#!/bin/bash


name=$(basename $1)
name="${name%%.*}"
path=$(dirname $1)

pushd "$path"
codebraid pandoc --overwrite --from markdown --to revealjs -d ../../utils/params.yaml -o "$name.html" "$name.md"
popd
