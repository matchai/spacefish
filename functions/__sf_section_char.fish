function __sf_section_char
	__sf_util_set_default SPACEFISH_CHAR_PREFIX ""
	__sf_util_set_default SPACEFISH_CHAR_SYMBOL "➜"
	__sf_util_set_default SPACEFISH_CHAR_SUFFIX " "

	set -l arrow_color
	set -l exit_code $status

	if test $exit_code -eq 0
		set arrow_color green
	else
		set arrow_color red
	end

	echo -e -n -s (set_color $arrow_color) "$SPACEFISH_CHAR_PREFIX$SPACEFISH_CHAR_SYMBOL$SPACEFISH_CHAR_SUFFIX"
end