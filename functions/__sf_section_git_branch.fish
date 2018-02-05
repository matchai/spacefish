function __sf_section_git_branch
	#
	# Git branch
	#
	# Show current git branch

	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__sf_util_set_default SPACEFISH_GIT_BRANCH_SHOW true
	__sf_util_set_default SPACEFISH_GIT_BRANCH_PREFIX $SPACEFISH_GIT_SYMBOL
	__sf_util_set_default SPACEFISH_GIT_BRANCH_SUFFIX ""
	__sf_util_set_default SPACEFISH_GIT_BRANCH_COLOR (set_color magenta)

	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	if test $SPACEFISH_GIT_BRANCH_SHOW = false
		return
	end

	echo -e -n -s \
	$SPACEFISH_GIT_BRANCH_COLOR \
	$SPACEFISH_GIT_BRANCH_PREFIX \
	(__sf_util_git_branch) \
	$SPACEFISH_GIT_BRANCH_SUFFIX
end
