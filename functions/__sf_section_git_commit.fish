#
# Git branch
#

function __sf_section_git_commit -d "Format the displayed commit id"
	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__sf_util_set_default SPACEFISH_GIT_COMMIT_SHOW false
	__sf_util_set_default SPACEFISH_GIT_COMMIT_PREFIX @
	__sf_util_set_default SPACEFISH_GIT_COMMIT_SUFFIX ""
	__sf_util_set_default SPACEFISH_GIT_COMMIT_COLOR '#008800'

	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	[ $SPACEFISH_GIT_COMMIT_SHOW = false ]; and return

	set -l git_commit (__sf_util_git_commit)

	[ -z $git_commit ]; and return

	__sf_lib_section \
		$SPACEFISH_GIT_COMMIT_COLOR \
		$SPACEFISH_GIT_COMMIT_PREFIX$git_commit$SPACEFISH_GIT_COMMIT_SUFFIX
end
