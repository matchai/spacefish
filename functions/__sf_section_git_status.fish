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

	set -l IFS # Clear IFS to allow for multi-line variables
	set -l index (command git status --porcelain -b ^/dev/null)

	if test $SPACEFISH_GIT_STATUS_SHOW = false
		return
	end

	# Check for untracked files
	if [ (echo $index | command grep -E '^\?\? ' ^/dev/null) ]
		set git_status $SPACEFISH_GIT_STATUS_UNTRACKED $git_status
	end

	# Check for staged files
	if [ (echo $index | command grep '^A[ MDAU] ' ^/dev/null) ]
		set git_status $SPACEFISH_GIT_STATUS_ADDED $git_status
	else if [ (echo $index | command grep '^UA' ^/dev/null) ]
		set git_status $SPACEFISH_GIT_STATUS_ADDED $git_status
	end

	# Check for modified files
	if [ (echo $index | command grep '^M[ MD] ' ^/dev/null) ]
		set git_status $SPACEFISH_GIT_STATUS_MODIFIED $git_status
	else if [ (echo $index | command grep '^[ MARC]M ' ^/dev/null) ]
		set git_status $SPACEFISH_GIT_STATUS_MODIFIED $git_status
	end

	# Check for renamed files
	if [ (echo $index | command grep '^R[ MD] ' ^/dev/null) ]
		set git_status $SPACEFISH_GIT_STATUS_RENAMED $git_status
	end

	# Check for deleted files
	if [ (echo $index | command grep '^[MARCDU ]D ' ^/dev/null) ]
		set git_status $SPACEFISH_GIT_STATUS_DELETED $git_status
	else if [ (echo $index | command grep '^D[ UM] ' ^/dev/null) ]
		set git_status $SPACEFISH_GIT_STATUS_DELETED $git_status
	end

	# Check for stashed files
	if [ (command git rev-parse --verify refs/stash ^/dev/null) ]
		set git_status $SPACEFISH_GIT_STATUS_STASHED $git_status
	end

	# Check for unmerged files
	if [ (echo $index | command grep '^U[UDA] ' ^/dev/null) ]
		set git_status $SPACEFISH_GIT_STATUS_UNMERGED $git_status
	else if [ (echo $index | command grep '^AA ' ^/dev/null) ]
		set git_status $SPACEFISH_GIT_STATUS_UNMERGED $git_status
	else if [ (echo $index | command grep '^DD ' ^/dev/null) ]
		set git_status $SPACEFISH_GIT_STATUS_UNMERGED $git_status
	else if [ (echo $index | command grep '^[DA]U ' ^/dev/null) ]
		set git_status $SPACEFISH_GIT_STATUS_UNMERGED $git_status
	end

	if [ (echo $index | command grep '^## [^ ]\+ .*ahead' ^/dev/null) ]
		set is_ahead true
	end

	if [ (echo $index | command grep '^## [^ ]\+ .*behind' ^/dev/null) ]
		set is_behind true
	end

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
