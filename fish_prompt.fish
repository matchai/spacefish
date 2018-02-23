function fish_prompt
	# Store the exit code of the last command
	set -g sf_exit_code $status

	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__sf_util_set_default SPACEFISH_PROMPT_ADD_NEWLINE true
	# __sf_util_set_default SPACEFISH_PROMPT_FIRST_PREFIX_SHOW false
	# __sf_util_set_default SPACEFISH_PROMPT_PREFIXES_SHOW true
	# __sf_util_set_default SPACEFISH_PROMPT_SUFFIXES_SHOW true
	# __sf_util_set_default SPACEFISH_PROMPT_DEFAULT_PREFIX "via "
	__sf_util_set_default SPACEFISH_PROMPT_DEFAULT_SUFFIX " "
	__sf_util_set_default SPACEFISH_PROMPT_ORDER dir git exec_time line_sep battery char

	# ------------------------------------------------------------------------------
	# Sections
	# ------------------------------------------------------------------------------

	if test $SPACEFISH_PROMPT_ADD_NEWLINE
		echo
	end

	for i in $SPACEFISH_PROMPT_ORDER
		eval __sf_section_$i
	end
	set_color normal
end
