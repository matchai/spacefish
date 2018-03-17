function fish_prompt
	# Store the exit code of the last command
	set -g sf_exit_code $status

	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__sf_util_set_default SPACEFISH_PROMPT_ADD_NEWLINE true
	__sf_util_set_default SPACEFISH_PROMPT_FIRST_PREFIX_SHOW false
	__sf_util_set_default SPACEFISH_PROMPT_PREFIXES_SHOW true
	__sf_util_set_default SPACEFISH_PROMPT_SUFFIXES_SHOW true
	__sf_util_set_default SPACEFISH_PROMPT_DEFAULT_PREFIX "via "
	__sf_util_set_default SPACEFISH_PROMPT_DEFAULT_SUFFIX " "
	__sf_util_set_default SPACEFISH_PROMPT_ORDER user dir git package node exec_time line_sep battery char

	# ------------------------------------------------------------------------------
	# Sections
	# ------------------------------------------------------------------------------

	# Keep track of whether the prompt has already been opened
	set -g sf_prompt_opened $SPACEFISH_PROMPT_FIRST_PREFIX_SHOW

	if test "$SPACEFISH_PROMPT_ADD_NEWLINE" = "true"
		echo
	end

	set -g sf_prompt_opened $SPACEFISH_PROMPT_FIRST_PREFIX_SHOW
	for i in $SPACEFISH_PROMPT_ORDER
		eval __sf_section_$i
	end
	set_color normal
end
