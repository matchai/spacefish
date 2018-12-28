#!/usr/bin/env fish

set -l new_version $argv[1]
set -l filename $PWD/fish_prompt.fish

sed -e "s/set -g SPACEFISH_VERSION .*/set -g SPACEFISH_VERSION $new_version/g" $filename > $filename.bak
mv -- $filename.bak $filename

git add fish_prompt.fish
