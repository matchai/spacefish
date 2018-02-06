#
# Git branch
#

function __sf_util_git_branch -d "Display the current branch name"
	echo (command git rev-parse --abbrev-ref HEAD ^/dev/null)
end
