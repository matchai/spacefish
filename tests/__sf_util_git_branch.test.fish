source $DIRNAME/spacefish_test_setup.fish

function setup
	spacefish_test_setup
	mkdir -p /tmp/tmp-spacefish
	cd /tmp/tmp-spacefish
	command git init >/dev/null
	command git config --local user.email "test@example.com"
	command git config --local user.name "Test User"
end

function teardown
	rm -rf /tmp/tmp-spacefish
end

test "Identifies HEAD before initial commit"
	(
		echo "HEAD"
	) = (__sf_util_git_branch)
end

test "Identifies master branch"
	(
		command git commit --allow-empty -m "initial commit" --quiet

		echo "master"
	) = (__sf_util_git_branch)
end

test "Identifies an alternate branch name"
	(
		command git checkout -b "testBranch" 2>/dev/null
		command git commit --allow-empty -m "initial commit" --quiet

		echo "testBranch"
	) = (__sf_util_git_branch)
end

test "No result provided for non-git directory"
	(
		cd ~

		echo ""
	) = (__sf_util_git_branch)
end
