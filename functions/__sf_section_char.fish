function __sf_section_char
	set -l arrow_color
	if test $exit_code -eq 0
		set arrow_color green
	else
		set arrow_color red
	end

	echo -e -n -s (set_color $arrow_color) "➜ "
end