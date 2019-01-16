#!/usr/bin/env fish

set -l gitRoot (git rev-parse --show-toplevel)
set -l testDir (dirname (status --current-filename))
set -l tmpDir /tmp/spacefish

# Install fisher if not installed in temporary fish env
if test ! -f $tmpDir/.config/fish/functions/fisher.fish
	curl https://git.io/fisher --create-dirs -sLo $tmpDir/.config/fish/functions/fisher.fish
end

# Create fish environment
env HOME=$tmpDir fish -c "mkdir -p $tmpDir/.config/fish"
# Prepare fisher
env HOME=$tmpDir fish -c "touch $tmpDir/.config/fish/fishfile"
# Install fishtape and spacefish into temp env
env HOME=$tmpDir fish -c "fisher add jorgebucaran/fishtape $gitRoot"
env HOME=$tmpDir fish -c "fish_prompt"

if test (count $argv) -gt 0
	# Run an individual test file if it is provided as an argument
	env HOME=$tmpDir fish -c "fishtape $argv[1]"
else
	# Otherwise run all test files
	env HOME=$tmpDir fish -c "fishtape $testDir/*.test.fish"
end
