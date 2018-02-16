#
# Git status
#

function __sf_section_git_status -d "Display the current git status"
	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__sf_util_set_default SPACEFISH_GIT_STATUS_SHOW true
	__sf_util_set_default SPACEFISH_GIT_STATUS_PREFIX " ["
	__sf_util_set_default SPACEFISH_GIT_STATUS_SUFFIX ]
	__sf_util_set_default SPACEFISH_GIT_STATUS_COLOR (set_color red)
	__sf_util_set_default SPACEFISH_GIT_STATUS_UNTRACKED \?
	__sf_util_set_default SPACEFISH_GIT_STATUS_ADDED +
	__sf_util_set_default SPACEFISH_GIT_STATUS_MODIFIED !
	__sf_util_set_default SPACEFISH_GIT_STATUS_RENAMED »
	__sf_util_set_default SPACEFISH_GIT_STATUS_DELETED ✘
	__sf_util_set_default SPACEFISH_GIT_STATUS_STASHED \$
	__sf_util_set_default SPACEFISH_GIT_STATUS_UNMERGED =
	__sf_util_set_default SPACEFISH_GIT_STATUS_AHEAD ⇡
	__sf_util_set_default SPACEFISH_GIT_STATUS_BEHIND ⇣
	__sf_util_set_default SPACEFISH_GIT_STATUS_DIVERGED ⇕

	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	set -l git_status
	set -l is_ahead
	set -l is_behind

	set -l index (command git status --porcelain ^/dev/null -b)
	set -l trimmed_index (string split \n $index|cut -c 1-2|sort -u)

	for i in $trimmed_index
		switch $i
			case '\?\?'
				set git_status $SPACEFISH_GIT_STATUS_UNTRACKED $git_status
			case 'A '
				set git_status $SPACEFISH_GIT_STATUS_ADDED $git_status 
			case 'M ' ' M'
				set git_status $SPACEFISH_GIT_STATUS_MODIFIED $git_status
			case 'R '
				set git_status $SPACEFISH_GIT_STATUS_RENAMED $git_status
			case 'D ' ' D'
				set git_status $SPACEFISH_GIT_STATUS_DELETED $git_status
			case 'U*' '*U' 'DD' 'AA'
				set git_status $SPACEFISH_GIT_STATUS_UNMERGED $git_status
		end
	end

	# Check for stashes
	if test (command git rev-parse --verify refs/stash ^/dev/null)
		set git_status $SPACEFISH_GIT_STATUS_STASHED $git_status
	end

	# Check whether the branch is ahead
	if [ (echo $index | command grep '^## [^ ]\+ .*ahead' ^/dev/null) ]
		set is_ahead true
	end

	# Check whether the branch is behind
	if [ (echo $index | command grep '^## [^ ]\+ .*behind' ^/dev/null) ]
		set is_behind true
	end

	# Check whether the branch has diverged
	if [ "$is_ahead" = true -a "$is_behind" = true ]
		set git_status $SPACEFISH_GIT_STATUS_DIVERGED $git_status
	else if [ "$is_ahead" = true ]
		set git_status $SPACEFISH_GIT_STATUS_AHEAD $git_status
	else if [ "$is_behind" = true ]
		set git_status $SPACEFISH_GIT_STATUS_BEHIND $git_status
	end

	# Check if git status
	if test -n "$git_status"
		echo -e -n -s \
		$SPACEFISH_GIT_STATUS_COLOR \
		$SPACEFISH_GIT_STATUS_PREFIX \
		$git_status \
		$SPACEFISH_GIT_STATUS_SUFFIX
	end
end
