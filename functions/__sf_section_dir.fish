function __sf_section_dir -a dir_color -a separator_color -a branch_color -a status_color
	__sf_util_set_default SPACEFISH_GIT_PREFIX "on "
	__sf_util_set_default SPACEFISH_GIT_SYMBOL 
	__sf_util_set_default SPACEFISH_GIT_SUFFIX ""

	if [ (__sf_util_git_branch) ]
		set -l git_root (git rev-parse --show-toplevel)

		# Treat the repo root as a top-level directory
		echo -s -n (set_color -o $dir_color) (string replace $git_root (basename $git_root) $PWD)
		echo -s -n (set_color -o $separator_color) " $SPACEFISH_GIT_PREFIX"
		echo -s -n (set_color -o $branch_color) "$SPACEFISH_GIT_SYMBOL$SPACEFISH_GIT_SUFFIX" (__sf_util_git_branch) (__sf_section_git $status_color)
	else
		__sf_util_set_default fish_prompt_pwd_dir_length 0
		echo -s -n (set_color -o $dir_color) (prompt_pwd)
	end
end
