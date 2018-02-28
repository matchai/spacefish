#
# Username
#

function __sf_section_user -d "Display the username"
	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	# --------------------------------------------------------------------------
	# | SPACEFISH_USER_SHOW | show username on local | show username on remote |
	# |---------------------+------------------------+-------------------------|
	# | false               | never                  | never                   |
	# | always              | always                 | always                  |
	# | true                | if needed              | always                  |
	# | needed              | if needed              | if needed               |
	# --------------------------------------------------------------------------

	__sf_util_set_default SPACEFISH_USER_SHOW true
	__sf_util_set_default SPACEFISH_USER_PREFIX "with "
	__sf_util_set_default SPACEFISH_USER_SUFFIX $SPACEFISH_PROMPT_DEFAULT_SUFFIX
	__sf_util_set_default SPACEFISH_USER_COLOR yellow
	__sf_util_set_default SPACEFISH_USER_COLOR_ROOT red

	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	if test $SPACEFISH_USER_SHOW = false
		return
	end

	if test $SPACEFISH_USER_SHOW = always \
	-o $LOGNAME != $USER

		set -l user_color
		if test $USER = root
			set user_color $SPACEFISH_USER_COLOR_ROOT
		else
			set user_color $SPACEFISH_USER_COLOR
		end

		__sf_lib_section \
		$user_color \
		$SPACEFISH_USER_PREFIX \
		$USER \
		$SPACEFISH_USER_SUFFIX
	end
end
