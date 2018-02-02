function __sf_section_dir -a dir_color -a separator_color -a branch_color -a status_color
	if [ (__sf_util_git_branch) ]
		set -l git_root (git rev-parse --show-toplevel)

		# Treat the repo root as a top-level directory
		echo -s -n (set_color -o $dir_color) (string replace $git_root (basename $git_root) $PWD)
		echo -s -n (set_color -o $separator_color) " on "
		echo -s -n (set_color -o $branch_color) " " (__sf_util_git_branch) (__sf_section_git $status_color)
	else
		set -g fish_prompt_pwd_dir_length 0
		echo -s -n (set_color -o $dir_color) (prompt_pwd)
	end
end
