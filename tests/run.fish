#!/usr/bin/env fish
set -l testDir (dirname (status --current-filename))
set -l gitRoot (git rev-parse --show-toplevel)

# Install fisher if not installed in temporary fish env
if test ! -f $testDir/.config/fish/functions/fisher.fish
	curl -Lo $testDir/.config/fish/functions/fisher.fish --create-dirs git.io/fisherman
end

# Install fishtape and local spacefish into temp env
env HOME=$testDir fish -c "fisher fishtape $gitRoot"
env HOME=$testDir fish -c "fisher update $gitRoot"
env HOME=$testDir fish -c "fishtape $testDir/*.test.fish"
