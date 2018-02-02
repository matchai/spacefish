function fish_prompt
	set -l cyan (set_color cyan)
	set -l yellow (set_color yellow)
	set -l red (set_color red)
	set -l blue (set_color blue)
	set -l green (set_color green)
	set -l magenta (set_color magenta)
	set -l white (set_color white)
	set -l brwhite (set_color ffffff)
	set -l normal (set_color normal)
	set -l exit_code $status

	set -l arrow_color
	if test $exit_code -eq 0
		set arrow_color $green
	else
		set arrow_color $red
	end

	echo -e ''
	set_color -o cyan
	__sf_section_dir $cyan $brwhite $magenta $red
	echo -e -n -s $arrow_color "➜ "
	set_color normal
end
