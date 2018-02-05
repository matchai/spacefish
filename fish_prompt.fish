function fish_prompt
	set -l brwhite ffffff

	echo -e ''
	__sf_section_dir cyan $brwhite magenta red
	__sf_section_exec_time $brwhite yellow
	echo
	__sf_section_battery 
	__sf_section_char
	set_color normal
end
