function fish_prompt
	__sf_util_set_default SPACEFISH_PROMPT_ADD_NEWLINE true
	__sf_util_set_default SPACEFISH_PROMPT_SEPARATE_LINE true
	__sf_util_set_default SPACEFISH_PROMPT_FIRST_PREFIX_SHOW false
	__sf_util_set_default SPACEFISH_PROMPT_PREFIXES_SHOW true
	__sf_util_set_default SPACEFISH_PROMPT_SUFFIXES_SHOW true
	__sf_util_set_default SPACEFISH_PROMPT_DEFAULT_PREFIX "via "
	__sf_util_set_default SPACEFISH_PROMPT_DEFAULT_SUFFIX " "

	echo -e ''
	__sf_section_dir
	__sf_section_git
	__sf_section_exec_time $brwhite yellow
	echo
	__sf_section_char
	set_color normal
end
