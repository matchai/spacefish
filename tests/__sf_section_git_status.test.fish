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

test "Displays no status symbols in a clean repo"
	() = (__sf_section_git_status)
end

test "Displays the correct symbol for untracked file"
	(
		touch testfile

		set_color --bold
		set_color normal
		set_color --bold red
		echo -n " [?]"
		set_color normal
		set_color --bold
		set_color normal
	) = (__sf_section_git_status)
end

test "Displays the correct symbol for added file"
	(
		touch testfile
		command git add testfile

		set_color --bold
		set_color normal
		set_color --bold red
		echo -n " [+]"
		set_color normal
		set_color --bold
		set_color normal
	) = (__sf_section_git_status)
end

test "Displays the correct symbol for modified file"
	(
		touch testfile
		command git add testfile
		command git commit -m "Initial commit" --quiet
		echo "modification" > testfile

		set_color --bold
		set_color normal
		set_color --bold red
		echo -n " [!]"
		set_color normal
		set_color --bold
		set_color normal
	) = (__sf_section_git_status)
end

test "Displays the correct symbol for renamed file"
	(
		touch testfile
		command git add testfile
		command git commit -m "Initial commit" --quiet
		mv testfile newtestfile
		command git add testfile newtestfile

		set_color --bold
		set_color normal
		set_color --bold red
		echo -n " [»]"
		set_color normal
		set_color --bold
		set_color normal
	) = (__sf_section_git_status)
end

test "Displays the correct symbol for deleted file"
	(
		touch testfile
		command git add testfile
		command git commit -m "Initial commit" --quiet
		rm testfile
		command git add testfile

		set_color --bold
		set_color normal
		set_color --bold red
		echo -n " [✘]"
		set_color normal
		set_color --bold
		set_color normal
	) = (__sf_section_git_status)
end

test "Displays the correct symbol for stashed file"
	(
		touch testfile
		command git add testfile
		command git commit -m "Initial commit" --quiet
		echo "modification" > testfile
		command git stash --quiet

		set_color --bold
		set_color normal
		set_color --bold red
		echo -n " [\$]"
		set_color normal
		set_color --bold
		set_color normal
	) = (__sf_section_git_status)
end

test "Test config option SPACEFISH_GIT_STATUS_SHOW"
	(
		set -g SPACEFISH_GIT_STATUS_SHOW false
	) = (__sf_section_git_status)
end

# TODO: Get test dir into status *U*
# TODO: Add test for ahead
# TODO: Add test for behind
# TODO: Add test for diverged
