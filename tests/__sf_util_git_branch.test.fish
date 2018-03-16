source $DIRNAME/../functions/__sf_util_git_branch.fish
set path /var/tmp/$DIRNAME/$TESTNAME

function setup
	mkdir -p $path/tempGit
	cd $path/tempGit
end

function teardown
	rm -rf $path
end

function git_init
	command git init
	command git config --local user.email "test@example.com"
	command git config --local user.name "Test User"
end

test "identify HEAD before initial commit"
	'HEAD' = (
		command git init
		__sf_util_git_branch
	)
end

test "identify master branch"
	'master' = (
		git_init
		command git commit --allow-empty -m "initial commit"
		__sf_util_git_branch
	)
end

test "indentify an alternate branch name"
	'testBranch' = (
		git_init
		command git checkout -b "testBranch"
		command git commit --allow-empty -m "initial commit"
		__sf_util_git_branch
	)
end

test "no result for non-git directory"
    '' = (
		__sf_util_git_branch
	)
end
