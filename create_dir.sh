#!/bin/bash

for i in {1..14}; do
  dir=section${i}
  if [ ! -d $dir ] ; then
    mkdir $dir
    echo "create directory: ${dir}"
  fi
done
