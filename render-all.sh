#!/bin/bash
#
# Usage with docker:
# docker run -u $UID:$GID --rm -v `pwd`:/data kageurufu/headless-openscad bash render-all.sh PATH/TO/STL/FILES
#

set -euo pipefail

render-stl() {
  STL="$1"

  if [[ "$STL" == *"[a]"* ]]; then
    MATERIAL="540809 cc1417 a64b4b" # Voron Red
  else
    MATERIAL="262626 41434a 232a33" # Dim Grey ish
  fi
 
  echo "--> Rendering $STL"
  mkdir -p "images/$(dirname "$STL")"
  
  stl-thumb --material $MATERIAL "$STL" "images/${STL%.*}.png"
}
export -f render-stl

parallel render-stl ::: "$(find . -iname '*.stl')"
