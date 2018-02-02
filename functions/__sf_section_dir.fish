function __sf_section_dir -a dir_color -a separator_color -a branch_color -a status_color
	if [ (__sf_util_git_branch) ]
		echo -s -n $dir_color (basename "$PWD")
		echo -s -n $separator_color " on "
		echo -s $branch_color " " (__sf_util_git_branch) (__sf_section_git $status_color)
	else
		echo -s $dir_color (string replace $HOME '~' $PWD)
	end
end
