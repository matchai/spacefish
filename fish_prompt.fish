function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function fish_prompt
	set -l cyan (set_color cyan)
	set -l yellow (set_color yellow)
	set -l red (set_color red)
	set -l blue (set_color blue)
	set -l green (set_color green)
	set -l magenta (set_color magenta)
	set -l white (set_color white)
	set -l normal (set_color normal)

	set -l last_status $status
	set -l git_branch (_git_branch_name)
	set -l dir_path (string replace $HOME '~' $PWD)
	set -l dir_name (basename "$PWD")

	if test $last_status -eq 0
		set arrow_color $green
	else
		set arrow_color $red
	end

	if [ (_git_branch_name) ]
		set directory $dir_name $white " on " $magenta $git_branch
	else
		set directory $dir_path
	end

	echo -e ''
	set_color -o blue
	echo -e -s $directory
	echo -e -n -s $arrow_color "➜ "
	set_color normal
end
