#!/bin/bash
#
# Usage with docker:
# docker run -u $UID:$GID --rm -v `pwd`:/data kageurufu/headless-openscad bash render-all.sh PATH/TO/STL/FILES
#

set -euo pipefail

cat <<EOF >__render.scad
color(render_color) rotate([0, 0, 0]) import(model);
EOF

find . -iname '*.stl' | while read STL; do
  if [[ "$STL" == *"[a]"* ]]; then
    COLOR="DimGrey" # Accent in Grey
  else
    COLOR="Red" # Voron Red
  fi
 
  echo "--> Rendering $STL"
  mkdir -p "images/$(dirname "$STL")"
  
  openscad --quiet -o "images/${STL%.*}.png" --colorscheme=VORON-dark __render.scad -D "render_color=\"$COLOR\"" -D "model=\"$STL\""
done

rm __render.scad
