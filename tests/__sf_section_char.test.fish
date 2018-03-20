source $DIRNAME/../functions/__sf_section_char.fish

# Default functionality

function setup
	fish_prompt>/dev/null
end

test "Display default char with status code 0"
	(
		set sf_exit_code 0

		set_color --bold fff
		echo -n ""
		set_color normal
		set_color --bold green
		echo -n "➜"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_char)
end

test "Display default char with status code 1"
	(
		set sf_exit_code 1

		set_color --bold fff
		echo -n ""
		set_color normal
		set_color --bold red
		echo -n "➜"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_char)
end

# Configuration

set -g SPACEFISH_CHAR_PREFIX A
test "Change the SPACEFISH_CHAR_PREFIX"
	(
		set sf_exit_code 0

		set_color --bold fff
		echo -n "A"
		set_color normal
		set_color --bold green
		echo -n "➜"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (
		__sf_section_char
	)
end

test "Change the SPACEFISH_CHAR_SUFFIX"
	(
		set SPACEFISH_CHAR_SUFFIX A
		set sf_exit_code 0

		set_color --bold fff
		echo -n ""
		set_color normal
		set_color --bold green
		echo -n "➜"
		set_color normal
		set_color --bold fff
		echo -n "A"
		set_color normal

		set -e SPACEFISH_CHAR_SUFFIX
	) = (
		set SPACEFISH_CHAR_SUFFIX A
		__sf_section_char
	)
end

set SPACEFISH_CHAR_SYMBOL A
test "Change the SPACEFISH_CHAR_SYMBOL"
	(
		set sf_exit_code 0
		set SPACEFISH_CHAR_SYMBOL A

		set_color --bold fff
		echo -n ""
		set_color normal
		set_color --bold green
		echo -n "A"
		set_color normal
		set_color --bold fff
		echo -n "A"
		set_color normal

		set -e SPACEFISH_CHAR_SYMBOL
	) = (__sf_section_char)
end
set -e SPACEFISH_CHAR_SYMBOL

set SPACEFISH_CHAR_SUCCESS blue
test "Change the SPACEFISH_CHAR_SUCCESS"
	(
		set sf_exit_code 0

		set_color --bold fff
		echo -n ""
		set_color normal
		set_color --bold blue
		echo -n "A"
		set_color normal
		set_color --bold fff
		echo -n "A"
		set_color normal
	) = (__sf_section_char)
end
set -e SPACEFISH_CHAR_SUCCESS

set SPACEFISH_CHAR_FAILURE yellow
test "Change the SPACEFISH_CHAR_FAILURE"
	(
		set sf_exit_code 1

		set_color --bold fff
		echo -n ""
		set_color normal
		set_color --bold yellow
		echo -n "A"
		set_color normal
		set_color --bold fff
		echo -n "A"
		set_color normal
	) = (__sf_section_char)
end
set -e SPACEFISH_CHAR_FAILURE
