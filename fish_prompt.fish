# Set defaults
set -q SPACESHIP_CHAR_SUFFIX " "
set -q SPACESHIP_CHAR_PREFIX ""
set -q SPACESHIP_CHAR_SYMBOL ➜

function fish_prompt
	set -l brwhite ffffff
	set -l exit_code $status
	set -l arrow_color
	if test $exit_code -eq 0
		set arrow_color green
	else
		set arrow_color red
	end

	echo -e ''
	__sf_section_dir cyan $brwhite magenta red
	__sf_section_exec_time $brwhite yellow
	echo
	echo -e -n -s (set_color $arrow_color) "$SPACESHIP_CHAR_PREFIX$SPACESHIP_CHAR_SYMBOL$SPACESHIP_CHAR_SUFFIX"
	set_color normal
end
