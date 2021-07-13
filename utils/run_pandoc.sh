#!/bin/bash


name=$(basename $1)
name="${name%%.*}"
path=$(dirname $1)

outdir="$path/out"
mkdir -p "$outdir"


pandoc --from markdown --to revealjs -d utils/params.yaml -o "$outdir/$name.html" "$1"
