function fish_prompt
	set -l cyan (set_color cyan)
	set -l yellow (set_color yellow)
	set -l red (set_color red)
	set -l blue (set_color blue)
	set -l green (set_color green)
	set -l normal (set_color normal)

	set -l last_status $status
	set -l current_dir (string replace $HOME '~' $PWD)

	if test $last_status -eq 0
		set arrow_color $green
	else
		set arrow_color $red
	end

	echo -e ''
	set_color -o blue
	echo -e -s $current_dir
	echo -e -n -s $arrow_color "➜ "
	set_color normal
end
