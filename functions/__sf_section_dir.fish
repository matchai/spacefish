function __sf_section_dir
	#
	# Working directory
	#
	# Current directory. Return only three last items of path

	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__sf_util_set_default SPACEFISH_DIR_SHOW true
	# __sf_util_set_default SPACEFISH_DIR_PREFIX "in "
	__sf_util_set_default SPACEFISH_DIR_SUFFIX $SPACEFISH_PROMPT_DEFAULT_SUFFIX
	# __sf_util_set_default SPACEFISH_DIR_TRUNC 3
	__sf_util_set_default SPACEFISH_DIR_TRUNC_REPO true
	__sf_util_set_default SPACEFISH_DIR_COLOR (set_color -o cyan)

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
		# TODO: Use $SPACEFISH_DIR_TRUNC to change truncation length
		set dir (string replace -r '^.+/(.+/.+/.+)' '$1' $tmp)
	end

	echo -e -n -s \
	$SPACEFISH_DIR_COLOR \
	# TODO: Use $SPACEFISH_DIR_PREFIX if there's a section before dir
	# $SPACEFISH_DIR_PREFIX \
	$dir \
	$SPACEFISH_DIR_SUFFIX
end
