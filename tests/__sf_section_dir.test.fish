function setup
	fish_prompt>/dev/null
	mkdir -p ~/.tmp-spacefish/dir1/dir2
	mkdir -p /tmp/tmp-spacefish/dir1/dir2
end

function teardown
	rm -rf ~/.tmp-spacefish
	rm -rf /tmp/tmp-spacefish
end

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

test "Correctly truncates home subdirectory"
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

test "Correctly truncates deeply nested home subdirectory"
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

test "Correctly truncates root subdirectory"
	(
		cd /private/tmp

		set_color --bold fff
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "/private/tmp"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_dir)
end

test "Correctly truncates deeply nested root subdirectory"
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

