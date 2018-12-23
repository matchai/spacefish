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

	# Write Permissions lock symbol
	__sf_util_set_default SPACEFISH_DIR_LOCK_SHOW true
	__sf_util_set_default SPACEFISH_DIR_LOCK_SYMBOL ""
	__sf_util_set_default SPACEFISH_DIR_LOCK_COLOR red

	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	[ $SPACEFISH_DIR_SHOW = false ]; and return

	set -l dir
	set -l tmp
	set -l git_root (command git rev-parse --show-toplevel ^/dev/null)

	if test "$SPACEFISH_DIR_TRUNC_REPO" = "true" -a "$git_root"
		# Treat repo root as top level directory
		set tmp (string replace $git_root (basename $git_root) $PWD)
	else
	set -l realhome ~
		set tmp (string replace -r '^'"$realhome"'($|/)' '~$1' $PWD)
	end

	# Truncate the path to have a limited number of dirs
	set dir (__sf_util_truncate_dir $tmp $SPACEFISH_DIR_TRUNC)

	if [ $SPACEFISH_DIR_LOCK_SHOW = true -a ! -w . ]
		set DIR_LOCK_SYMBOL (set_color $SPACEFISH_DIR_LOCK_COLOR)" $SPACEFISH_DIR_LOCK_SYMBOL"(set_color --bold fff)
	end

	__sf_lib_section \
		$SPACEFISH_DIR_COLOR \
		$SPACEFISH_DIR_PREFIX \
		$dir \
		"$DIR_LOCK_SYMBOL""$SPACEFISH_DIR_SUFFIX"
end
