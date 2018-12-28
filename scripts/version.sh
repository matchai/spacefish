#!/bin/sh

new_version=$1
filename=$(pwd)/fish_prompt.fish

sed -e "s/set -g SPACEFISH_VERSION .*/set -g SPACEFISH_VERSION $new_version/g" $filename > $filename.bak
mv -- $filename.bak $filename

