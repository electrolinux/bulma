#!/bin/sh

sc=$(which sass-convert)
[ -z "$sc" ] && { echo "# Error: sass-convert not installed or not in PATH."; exit 1; }

sed=$(which sed)
[ -z "$sed" ] && { echo "# Errror: sed not installed or not in PATH."; exit 1; }

[ -d scss ] && rm -rf scss

sass-convert -F sass -T scss bulma.sass bulma.scss && 
sed -i 's#sass/#scss/#g' bulma.scss &&
sass-convert -R -F sass -T scss sass scss &&
find scss -name '_all.scss' -print0|xargs -0 sed -i 's/\.sass/.scss/g'
