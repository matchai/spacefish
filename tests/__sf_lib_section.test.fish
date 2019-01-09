source $DIRNAME/spacefish_test_setup.fish

function setup
	spacefish_test_setup
end

test "Displays only the colored content when 2 arguments are passed"
	(
		set_color --bold
		echo -n ""
		set_color normal
		set_color --bold red
		echo -n "test content"
		set_color normal
		set_color --bold
		echo -n ""
		set_color normal
	) = (__sf_lib_section red "test content")
end

test "Displays the prefix, colored content and suffix when 4 arguments are passed"
	(
		set_color --bold
		echo -n "prefix"
		set_color normal
		set_color --bold red
		echo -n "test content"
		set_color normal
		set_color --bold
		echo -n "suffix"
		set_color normal
	) = (__sf_lib_section red prefix "test content" suffix)
end

test "Displays the prefix if prefixes are enabled"
	(
		set SPACEFISH_PROMPT_PREFIXES_SHOW true

		set_color --bold
		echo -n "prefix"
		set_color normal
		set_color --bold red
		echo -n "test content"
		set_color normal
		set_color --bold
		echo -n "suffix"
		set_color normal
	) = (__sf_lib_section red prefix "test content" suffix)
end

test "Doesn't display the prefix if prefixes are disabled"
	(
		set SPACEFISH_PROMPT_PREFIXES_SHOW false

		set_color --bold red
		echo -n "test content"
		set_color normal
		set_color --bold
		echo -n "suffix"
		set_color normal
	) = (__sf_lib_section red prefix "test content" suffix)
end

test "Displays the suffix if suffixes are enabled"
	(
		set SPACEFISH_PROMPT_SUFFIXES_SHOW true

		set_color --bold
		echo -n "prefix"
		set_color normal
		set_color --bold red
		echo -n "test content"
		set_color normal
		set_color --bold
		echo -n "suffix"
		set_color normal
	) = (__sf_lib_section red prefix "test content" suffix)
end

test "Doesn't display the suffix if suffixes are disabled"
	(
		set SPACEFISH_PROMPT_SUFFIXES_SHOW false

		set_color --bold
		echo -n "prefix"
		set_color normal
		set_color --bold red
		echo -n "test content"
		set_color normal
	) = (__sf_lib_section red prefix "test content" suffix)
end

test "Only prints the prefix for the second consecutive section"
	(
		set sf_prompt_opened false

		set_color --bold red
		echo -n "test content 1"
		set_color normal
		set_color --bold
		echo -n "suffix 1"
		set_color normal

		set_color --bold
		echo -n "prefix 2"
		set_color normal
		set_color --bold red
		echo -n "test content 2"
		set_color normal
		set_color --bold
		echo -n "suffix 2"
		set_color normal
	) = (
		__sf_lib_section red "prefix 1" "test content 1" "suffix 1"
		__sf_lib_section red "prefix 2" "test content 2" "suffix 2"
	)
end
