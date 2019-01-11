#
# Git commit
#

function __sf_util_git_commit -d "Display the current commit id"
	echo (command git rev-parse --short=7 HEAD 2>/dev/null)
end
