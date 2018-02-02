function __sf_section_git_status -a status_color
	set -l status_untracked "?"
	set -l status_added "+"
	set -l status_modified "!"
	set -l status_renamed "»"
	set -l status_deleted "✘"
	set -l status_stashed "\$"
	set -l status_unmerged "="
	set -l status_ahead "⇡"
	set -l status_behind "⇣"
	set -l status_diverged "⇕"

	set -l git_status
	set -l is_ahead
	set -l is_behind

	set -l IFS # Clear IFS to allow for multi-line variables
	set -l index (command git status --porcelain -b ^/dev/null)

	# Check for untracked files
	if [ (echo $index | command grep -E '^\?\? ' ^/dev/null) ]
		set git_status $status_untracked $git_status
	end

	# Check for staged files
	if [ (echo $index | command grep '^A[ MDAU] ' ^/dev/null) ]
		set git_status $status_added $git_status
	else if [ (echo $index | command grep '^UA' ^/dev/null) ]
		set git_status $status_added $git_status
	end

	# Check for modified files
	if [ (echo $index | command grep '^M[ MD] ' ^/dev/null) ]
		set git_status $status_modified $git_status
	else if [ (echo $index | command grep '^[ MARC]M ' ^/dev/null) ]
		set git_status $status_modified $git_status
	end

	# Check for renamed files
	if [ (echo $index | command grep '^R[ MD] ' ^/dev/null) ]
		set git_status $status_renamed $git_status
	end

	# Check for deleted files
	if [ (echo $index | command grep '^[MARCDU ]D ' ^/dev/null) ]
		set git_status $status_deleted $git_status
	else if [ (echo $index | command grep '^D[ UM] ' ^/dev/null) ]
		set git_status $status_deleted $git_status
	end

	# Check for stashed files
	if [ (command git rev-parse --verify refs/stash ^/dev/null) ]
		set git_status $status_stashed $git_status
	end

	# Check for unmerged files
	if [ (echo $index | command grep '^U[UDA] ' ^/dev/null) ]
		set git_status $status_unmerged $git_status
	else if [ (echo $index | command grep '^AA ' ^/dev/null) ]
		set git_status $status_unmerged $git_status
	else if [ (echo $index | command grep '^DD ' ^/dev/null) ]
		set git_status $status_unmerged $git_status
	else if [ (echo $index | command grep '^[DA]U ' ^/dev/null) ]
		set git_status $status_unmerged $git_status
	end

	if [ (echo $index | command grep '^## [^ ]\+ .*ahead' ^/dev/null) ]
		set is_ahead true
	end

	if [ (echo $index | command grep '^## [^ ]\+ .*behind' ^/dev/null) ]
		set is_behind true
	end

	if [ "$is_ahead" = true -a "$is_behind" = true ]
		set git_status $status_diverged $git_status
	else if [ "$is_ahead" = true ]
		set git_status $status_ahead $git_status
	else if [ "$is_behind" = true ]
		set git_status $status_behind $git_status
	end

	# Check if git status
	if [ ! -z "$git_status" ]
		echo -s $status_color " " [ $git_status ]
	end
end
