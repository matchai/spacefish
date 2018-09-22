#!/usr/bin/env fish

# Set the global "SPACEFISH_VERSION" variable to have the same version as is in package.json
set -l new_version (grep -E '"version": "v?([0-9]+\.){1,}' package.json | cut -d\" -f4 2> /dev/null)
set -l filename $PWD/fish_prompt.fish

sed -e "s/set -g SPACEFISH_VERSION .*/set -g SPACEFISH_VERSION $new_version/g" $filename > $filename.bak
mv -- $filename.bak $filename

git add fish_prompt.fish
git add package.json
