function fish_prompt
	echo
	set_color --bold blue
	string replace $HOME '~' $PWD
	set_color green
	echo -e "➜ "(set_color normal)
end
