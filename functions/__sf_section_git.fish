#
# Git
#

function __sf_section_git -d "Display the git branch and status"
	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__sf_util_set_default SPACEFISH_GIT_SHOW true
	__sf_util_set_default SPACEFISH_GIT_PREFIX "on "
	__sf_util_set_default SPACEFISH_GIT_SUFFIX $SPACEFISH_PROMPT_DEFAULT_SUFFIX
	__sf_util_set_default SPACEFISH_GIT_SYMBOL " "

	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	# Show both git branch and git status:
	#   spacefish_git_branch
	#   spacefish_git_status

	if test $SPACEFISH_GIT_SHOW = false -o -z (__sf_util_git_branch)
		return
	end

	echo -e -n -s \
	(set_color ffffff) \
	$SPACEFISH_GIT_PREFIX \
	(__sf_section_git_branch) \
	(__sf_section_git_status) \
	$SPACEFISH_GIT_SUFFIX
end
