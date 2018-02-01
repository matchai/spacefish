set -g prompt_color blue --bold

function fish_prompt
	set -l last_status $status
	set -l cyan (set_color cyan)
	set -l yellow (set_color yellow)
	set -l red (set_color red)
	set -l blue (set_color blue)
	set -l green (set_color green)
	set -l normal (set_color normal)

	if test $last_status = 0
		set arrow "$green➜ "
	else
		set arrow "$red➜ "
	end

	echo -e ''
	echo -e -s (set_color $prompt_color) (string replace $HOME '~' $PWD)
	echo -e -s $arrow $normal
end
