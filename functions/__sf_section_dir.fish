#
# Working directory
#

function __sf_section_dir -d "Display the current truncated directory"
	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__sf_util_set_default SPACEFISH_DIR_SHOW true
	__sf_util_set_default SPACEFISH_DIR_PREFIX "in "
	__sf_util_set_default SPACEFISH_DIR_SUFFIX $SPACEFISH_PROMPT_DEFAULT_SUFFIX
	__sf_util_set_default SPACEFISH_DIR_TRUNC 3
	__sf_util_set_default SPACEFISH_DIR_TRUNC_REPO true
	__sf_util_set_default SPACEFISH_DIR_COLOR cyan

	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	if test $SPACEFISH_DIR_SHOW = false
		return
	end

	set -l dir

	if test (__sf_util_git_branch)
		set -l git_root (git rev-parse --show-toplevel)
		# Treat repo root as top level directory
		set dir (string replace $git_root (basename $git_root) $PWD)
	else
	set -l realhome ~
		set -l tmp (string replace -r '^'"$realhome"'($|/)' '~$1' $PWD)
		set dir (__sf_util_truncate_dir $tmp $SPACEFISH_DIR_TRUNC)
	end

	__sf_lib_section \
	$SPACEFISH_DIR_COLOR \
	$SPACEFISH_DIR_PREFIX \
	$dir \
	$SPACEFISH_DIR_SUFFIX
end
