#!/usr/bin/env fish

set -l gitRoot (git rev-parse --show-toplevel)
set -l testDir (dirname (status --current-filename))
set -l tmpDir /tmp/spacefish
set -gx HOME $tmpDir

# Install fisher if not installed in temporary fish env
if not test -d $tmpDir/.config/omf
	mkdir -p $tmpDir
	curl -L https://get.oh-my.fish > $tmpDir/install
	chmod 777 $tmpDir/install
	fish -c "$tmpDir/install --noninteractive"
end

# Install fishtape and local spacefish into temp env
fish -c "rsync -ru $gitRoot \$OMF_PATH/themes --exclude node_modules"
fish -c "omf theme spacefish"
fish -c "omf install https://github.com/fisherman/fishtape"
fish -c "source \$OMF_PATH/pkg/fishtape/*.fish; and fishtape $testDir/*.test.fish"
