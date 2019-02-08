set root (dirname (status -f))
source $root/tests/spacefish_test_setup.fish

function setup
	spacefish_test_setup
	mkdir -p /tmp/$filename
	cd /tmp/$filename
	command git init >/dev/null
	command git config --local user.email "test@example.com"
	command git config --local user.name "Test User"
end

function teardown
	rm -rf /tmp/$filename
end

@test "Identifies HEAD before initial commit" (
		echo "HEAD"
) = (__sf_util_git_branch)

@test "Identifies master branch" (
		command git commit --allow-empty -m "initial commit" --quiet

		echo "master"
) = (__sf_util_git_branch)

@test "Identifies an alternate branch name" (
		command git checkout -b "testBranch" 2>/dev/null
		command git commit --allow-empty -m "initial commit" --quiet

		echo "testBranch"
) = (__sf_util_git_branch)

@test "No result provided for non-git directory" (
		cd ~

		echo ""
) = (__sf_util_git_branch)
