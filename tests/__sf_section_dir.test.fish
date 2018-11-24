source $DIRNAME/spacefish_test_setup.fish

function setup
	spacefish_test_setup
	mkdir -p ~/.tmp-spacefish/dir1/dir2
	mkdir -p /tmp/tmp-spacefish/dir1/dir2/dir3
	# disabling SPACEFISH_DIR_LOCK_SYMBOL to avoid breaking old tests
	set SPACEFISH_DIR_LOCK_SHOW false
	set -g IS_NOT_CYGWIN true

	set -l isCygwin (uname -s | grep -io CYGWIN)
	if test -n "$isCygwin"
	    set IS_NOT_CYGWIN false
	end
end

function teardown
	rm -rf ~/.tmp-spacefish
	rm -rf /tmp/tmp-spacefish
	set -e IS_NOT_CYGWIN
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

test "Doesn't throw an error when in a .git directory"
	(
		cd /tmp/tmp-spacefish
		command git init >/dev/null

		cd /tmp/tmp-spacefish/.git

		set_color --bold fff
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "tmp/tmp-spacefish/.git"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_dir)

#
# Configuration
#

test "Doesn't show if SPACEFISH_DIR_SHOW is false"
	(
		set SPACEFISH_DIR_SHOW false
	) = (__sf_section_dir)
end

test "Changing SPACEFISH_DIR_PREFIX changes the dir prefix"
	(
		set SPACEFISH_DIR_PREFIX ·
		cd ~

		set_color --bold fff
		echo -n "·"
		set_color normal
		set_color --bold cyan
		echo -n "~"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_dir)
end

test "Changing SPACEFISH_DIR_SUFFIX changes the dir prefix"
	(
		set SPACEFISH_DIR_SUFFIX ·
		cd ~

		set_color --bold fff
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "~"
		set_color normal
		set_color --bold fff
		echo -n "·"
		set_color normal
	) = (__sf_section_dir)
end

# SPACEFISH_DIR_TRUNC functionality is further tested in:
# __sf_util_truncate_dir.test.fish
test "Changing SPACEFISH_DIR_TRUNC changes the dir length"
	(
		set SPACEFISH_DIR_TRUNC 1
		cd /tmp/tmp-spacefish/dir1/dir2/dir3

		set_color --bold fff
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "dir3"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_dir)
end

test "Disabling SPACEFISH_DIR_TRUNC_REPO stops repo dir truncation"
	(
		set SPACEFISH_DIR_TRUNC_REPO false
		cd ~/.tmp-spacefish
		command git init >/dev/null

		set_color --bold fff
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "~/.tmp-spacefish"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_dir)
end

test "Changing SPACEFISH_DIR_COLOR changes the dir color"
	(
		set SPACEFISH_DIR_COLOR red
		cd ~

		set_color --bold fff
		echo -n "in "
		set_color normal
		set_color --bold red
		echo -n "~"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_dir)
end


#
# SPACEFISH_DIR_LOCK_SYMBOL
#

test "Shows DIR_LOCK_SYMBOL if in a dir with no write permissions and SPACEFISH_DIR_LOCK_SHOW is true"
	(
		set SPACEFISH_DIR_LOCK_SHOW $IS_NOT_CYGWIN
		cd /tmp/tmp-spacefish
		mkdir testDir
		chmod 500 testDir
		cd testDir/

		set_color --bold fff
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "tmp/tmp-spacefish/testDir"
		set_color normal
		set_color --bold fff
		if test -n "$SPACEFISH_DIR_LOCK_SHOW"
			echo -n (set_color red)" "(set_color --bold fff)
		end
		echo -n " "
		set_color normal
	) = (__sf_section_dir)
end

test "Doesn't show DIR_LOCK_SYMBOL if SPACEFISH_DIR_LOCK_SHOW is false"
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

test "Doesn't show DIR_LOCK_SYMBOL if current directory is not write protected for this user"
	(
		cd /tmp/tmp-spacefish
		mkdir -p testDir
		cd testDir/
		set SPACEFISH_DIR_LOCK_SHOW $IS_NOT_CYGWIN
		
		set_color --bold fff
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "tmp/tmp-spacefish/testDir"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_dir)
end

test "Changing SPACEFISH_DIR_LOCK_SYMBOL changes the symbol"
	(
		set SPACEFISH_DIR_LOCK_SHOW $IS_NOT_CYGWIN
		set SPACEFISH_DIR_LOCK_SYMBOL "😀"
		cd /tmp/tmp-spacefish
		mkdir -p testDir
		chmod 500 testDir/
		cd testDir/
		
		set_color --bold fff
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "tmp/tmp-spacefish/testDir"
		set_color normal
		set_color --bold fff
		if test -n "$SPACEFISH_DIR_LOCK_SHOW"
			echo -n (set_color red)" 😀"(set_color --bold fff)
		end
		echo -n " "
		set_color normal
		echo (uname)
	) = (__sf_section_dir)
end
