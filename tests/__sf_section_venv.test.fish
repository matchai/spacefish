source $DIRNAME/spacefish_test_setup.fish

function setup
	spacefish_test_setup
end

function teardown
	if test "$VIRTUAL_ENV"
		set -e VIRTUAL_ENV
	end
end

test "Prints section when \$VIRTUAL_ENV is defined"
	(
		set VIRTUAL_ENV "/Users/JaneDoe/.venv/coolenviron"

		set_color --bold
		echo -n $SPACEFISH_PROMPT_DEFAULT_PREFIX
		set_color normal
		set_color --bold blue
		echo -n "·coolenviron"
		set_color normal
		set_color --bold
		echo -n $SPACEFISH_PROMPT_DEFAULT_SUFFIX
		set_color normal
	) = (__sf_section_venv)
end

test "Prints section when \$VIRTUAL_ENV is defined with venv as the directory name"
	(
		set VIRTUAL_ENV "/Users/JaneDoe/.venv/coolenviron/virtualenv"

		set_color --bold
		echo -n $SPACEFISH_PROMPT_DEFAULT_PREFIX
		set_color normal
		set_color --bold blue
		echo -n "·coolenviron"
		set_color normal
		set_color --bold
		echo -n $SPACEFISH_PROMPT_DEFAULT_SUFFIX
		set_color normal
	) = (__sf_section_venv)
end

test "doesn't display the section when SPACEFISH_VENV_SHOW is set to \"false\""
	(
		set VIRTUAL_ENV "/Users/JaneDoe/.venv/coolenviron"
		set SPACEFISH_VENV_SHOW false
	) = (__sf_section_venv)
end
