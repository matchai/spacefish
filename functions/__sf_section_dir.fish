function __sf_section_dir -a dir_color -a separator_color -a branch_color -a status_color
	if [ (__sf_util_git_branch) ]
		echo -s -n (set_color -o $dir_color) (basename "$PWD")
		echo -s -n (set_color -o $separator_color) " on "
		echo -s -n (set_color -o $branch_color) " " (__sf_util_git_branch) (__sf_section_git $status_color)
	else
		echo -s -n (set_color -o $dir_color) (string replace $HOME '~' $PWD)
	end
end
