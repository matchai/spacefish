#!/usr/bin/env fish

set -l gitRoot (git rev-parse --show-toplevel)
set -l testDir (dirname (status --current-filename))
set -l tmpDir /tmp/spacefish

# Install fisher if not installed in temporary fish env
if test ! -f $tmpDir/.config/fish/functions/fisher.fish
	curl https://git.io/fisher --create-dirs -sLo $tmpDir/.config/fish/functions/fisher.fish
end

# Install fishtape and local spacefish into temp env
env HOME=$tmpDir fish -c "fisher add fisherman/fishtape $gitRoot"
env HOME=$tmpDir fish -c "fish_prompt"
env HOME=$tmpDir fish -c "fishtape $testDir/*.test.fish"
