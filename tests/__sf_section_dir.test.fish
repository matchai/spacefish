source $DIRNAME/spacefish_test_setup.fish

function setup
	spacefish_test_setup
	mkdir -p ~/.tmp-spacefish/dir1/dir2
	mkdir -p /tmp/tmp-spacefish/dir1/dir2/dir3
end

function teardown
	rm -rf ~/.tmp-spacefish
	rm -rf /tmp/tmp-spacefish
end

#
# Home directory
#

test "Correctly truncates home directory"
	(
		cd ~

		set_color --bold fff
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "~"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_dir)
end

test "Correctly truncates a home subdirectory"
	(
		cd ~/.tmp-spacefish/dir1/

		set_color --bold fff
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "~/.tmp-spacefish/dir1"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_dir)
end

test "Correctly truncates a deeply nested home subdirectory"
	(
		cd ~/.tmp-spacefish/dir1/dir2

		set_color --bold fff
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n ".tmp-spacefish/dir1/dir2"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_dir)
end

#
# Root directory
#

test "Correctly truncates root directory"
	(
		cd /

		set_color --bold fff
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "/"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_dir)
end

test "Correctly truncates a root subdirectory"
	(
		cd /usr

		set_color --bold fff
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "/usr"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_dir)
end

test "Correctly truncates a deeply nested root subdirectory"
	(
		cd /tmp/tmp-spacefish/dir1/dir2

		set_color --bold fff
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "tmp-spacefish/dir1/dir2"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_dir)
end

#
# Git directory
#

test "Correctly truncates the root of a git directory"
	(
		cd /tmp/tmp-spacefish
		command git init >/dev/null

		set_color --bold fff
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "tmp-spacefish"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_dir)
end

test "Correctly truncates a git subdirectory"
	(
		cd /tmp/tmp-spacefish
		command git init >/dev/null
		cd /tmp/tmp-spacefish/dir1

		set_color --bold fff
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "tmp-spacefish/dir1"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_dir)
end

test "Correctly truncates a deeply nested git subdirectory"
	(
		cd /tmp/tmp-spacefish
		command git init >/dev/null
		cd /tmp/tmp-spacefish/dir1/dir2/dir3

		set_color --bold fff
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "dir1/dir2/dir3"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_dir)
end

test "Correctly truncates the root of a git directory within another"
	(
		cd /tmp/tmp-spacefish
		command git init >/dev/null

		cd /tmp/tmp-spacefish/dir1
		command git init >/dev/null

		set_color --bold fff
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "dir1"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_dir)
end
