function fish_prompt
	set -l brwhite ffffff
	set -l exit_code $status

	echo -e ''
	__sf_section_dir cyan $brwhite magenta red
	__sf_section_exec_time $brwhite yellow
	echo
	__sf_section_char $brwhite yellow
	set_color normal
end
