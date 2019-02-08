source ./spacefish_test_setup.fish

function setup
	spacefish_test_setup
	mkdir -p ~/.$filename/dir1/dir2
	mkdir -p /tmp/$filename/dir1/dir2/dir3
	mkdir -p /tmp/$filename/writeProtected
	chmod 500 /tmp/$filename/writeProtected
	# disabling SPACEFISH_DIR_LOCK_SYMBOL to avoid breaking old tests
	set SPACEFISH_DIR_LOCK_SHOW false
end

function teardown
	rm -rf ~/.$filename
	rm -rf /tmp/$filename
end

#
# Home directory
#

@test "Correctly truncates home directory" (
		cd ~

		set_color --bold
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "~"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
) = (__sf_section_dir)

@test "Correctly truncates a home subdirectory" (
		cd ~/.$filename/dir1/

		set_color --bold
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "~/.$filename/dir1"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
) = (__sf_section_dir)

@test "Correctly truncates a deeply nested home subdirectory" (
		cd ~/.$filename/dir1/dir2

		set_color --bold
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n ".$filename/dir1/dir2"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
) = (__sf_section_dir)

#
# Root directory
#

@test "Correctly truncates root directory" (
		cd /

		set_color --bold
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "/"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
) = (__sf_section_dir)

@test "Correctly truncates a root subdirectory" (
		cd /usr

		set_color --bold
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "/usr"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
) = (__sf_section_dir)

@test "Correctly truncates a deeply nested root subdirectory" (
		cd /tmp/$filename/dir1/dir2

		set_color --bold
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "$filename/dir1/dir2"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
) = (__sf_section_dir)

#
# Git directory
#

@test "Correctly truncates the root of a git directory" (
		cd /tmp/$filename
		command git init >/dev/null

		set_color --bold
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "$filename"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
) = (__sf_section_dir)

@test "Correctly truncates a git subdirectory" (
		cd /tmp/$filename
		command git init >/dev/null
		cd /tmp/$filename/dir1

		set_color --bold
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "$filename/dir1"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
) = (__sf_section_dir)

@test "Correctly truncates a deeply nested git subdirectory" (
		cd /tmp/$filename
		command git init >/dev/null
		cd /tmp/$filename/dir1/dir2/dir3

		set_color --bold
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "dir1/dir2/dir3"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
) = (__sf_section_dir)

@test "Correctly truncates the root of a git directory within another" (
		cd /tmp/$filename
		command git init >/dev/null

		cd /tmp/$filename/dir1
		command git init >/dev/null

		set_color --bold
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "dir1"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
) = (__sf_section_dir)

@test "Doesn't throw an error when in a .git directory" (
		cd /tmp/$filename
		command git init >/dev/null

		cd /tmp/$filename/.git

		set_color --bold
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "tmp/$filename/.git"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_dir)

#
# Configuration
#

@test "Doesn't show if SPACEFISH_DIR_SHOW is false" (
		set SPACEFISH_DIR_SHOW false
) = (__sf_section_dir)

@test "Changing SPACEFISH_DIR_PREFIX changes the dir prefix" (
		set SPACEFISH_DIR_PREFIX ·
		cd ~

		set_color --bold
		echo -n "·"
		set_color normal
		set_color --bold cyan
		echo -n "~"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
) = (__sf_section_dir)

@test "Changing SPACEFISH_DIR_SUFFIX changes the dir prefix" (
		set SPACEFISH_DIR_SUFFIX ·
		cd ~

		set_color --bold
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "~"
		set_color normal
		set_color --bold
		echo -n "·"
		set_color normal
) = (__sf_section_dir)

# SPACEFISH_DIR_TRUNC functionality is further tested in:
# __sf_util_truncate_dir.test.fish
@test "Changing SPACEFISH_DIR_TRUNC changes the dir length" (
		set SPACEFISH_DIR_TRUNC 1
		cd /tmp/$filename/dir1/dir2/dir3

		set_color --bold
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "dir3"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
) = (__sf_section_dir)

@test "Disabling SPACEFISH_DIR_TRUNC_REPO stops repo dir truncation" (
		set SPACEFISH_DIR_TRUNC_REPO false
		cd ~/.$filename
		command git init >/dev/null

		set_color --bold
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "~/.$filename"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
) = (__sf_section_dir)

@test "Changing SPACEFISH_DIR_COLOR changes the dir color" (
		set SPACEFISH_DIR_COLOR red
		cd ~

		set_color --bold
		echo -n "in "
		set_color normal
		set_color --bold red
		echo -n "~"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
) = (__sf_section_dir)


#
# SPACEFISH_DIR_LOCK_SYMBOL
#

@test "Shows DIR_LOCK_SYMBOL if in a dir with no write permissions and SPACEFISH_DIR_LOCK_SHOW is true" (
		cd /tmp/$filename/writeProtected

		set_color --bold
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "tmp/$filename/writeProtected"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
) = (__sf_section_dir)

@test "Doesn't show DIR_LOCK_SYMBOL if SPACEFISH_DIR_LOCK_SHOW is false" (
		cd /tmp/$filename/writeProtected

		set_color --bold
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "tmp/$filename/writeProtected"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
) = (__sf_section_dir)

@test "Doesn't show DIR_LOCK_SYMBOL if current directory is not write protected for this user" (
		cd ~

		set_color --bold
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "~"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
) = (__sf_section_dir)

@test "Changing SPACEFISH_DIR_LOCK_SYMBOL changes the symbol" (
		set SPACEFISH_DIR_LOCK_SYMBOL "😀"
		cd /tmp/$filename/writeProtected

		set_color --bold
		echo -n "in "
		set_color normal
		set_color --bold cyan
		echo -n "tmp/$filename/writeProtected"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
) = (__sf_section_dir)
