#!/usr/bin/env fish

set -l gitRoot (git rev-parse --show-toplevel)
set -l testDir (dirname (status --current-filename))
set -l tmpDir /tmp/spacefish

# Install fisher if not installed in temporary fish env
if test ! -f $tmpDir/.config/fish/functions/fisher.fish
	curl -Lo $tmpDir/.config/fish/functions/fisher.fish --create-dirs git.io/fisherman
end

# Install fishtape and local spacefish into temp env
env HOME=$tmpDir fish -c "fisher fishtape $gitRoot"
env HOME=$tmpDir fish -c "fisher update $gitRoot"
env HOME=$tmpDir fish -c "fish_prompt"
env HOME=$tmpDir fish -c "fishtape $testDir/*.test.fish"
