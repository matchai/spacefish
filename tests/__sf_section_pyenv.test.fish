source $DIRNAME/spacefish_test_setup.fish
source $DIRNAME/mock.fish

function setup
	spacefish_test_setup
	mock pyenv 0 "echo \"3.7.0\""
	mkdir -p /tmp/tmp-spacefish
	touch /tmp/tmp-spacefish/requirements.txt
	cd /tmp/tmp-spacefish
end

function teardown
	rm -rf /tmp/tmp-spacefish
end

test "Prints section when requirements.txt is present"
	(
		set_color --bold fff
		echo -n "via "
		set_color normal
		set_color --bold yellow
		echo -n "🐍 3.7.0"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_pyenv)
end

test "Prints section when a *.py file is present"
	(
		rm -rf /tmp/tmp-spacefish/requirements.txt
		touch /tmp/tmp-spacefish/testfile.py

		set_color --bold fff
		echo -n "via "
		set_color normal
		set_color --bold yellow
		echo -n "🐍 3.7.0"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_pyenv)
end

test "Doesn't print the section when requirements.txt and *.py aren't present"
	(
		rm -rf /tmp/tmp-spacefish/requirements.txt
	) = (__sf_section_pyenv)
end

test "Changing SPACEFISH_PYENV_SYMBOL changes the displayed character"
	(
		set SPACEFISH_PYENV_SYMBOL "· "

		set_color --bold fff
		echo -n "via "
		set_color normal
		set_color --bold yellow
		echo -n "· 3.7.0"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_pyenv)
end

test "Changing SPACEFISH_PHP_PREFIX changes the character prefix"
	(
		set sf_exit_code 0
		set SPACEFISH_PYENV_PREFIX ·

		set_color --bold fff
		echo -n "·"
		set_color normal
		set_color --bold yellow
		echo -n "🐍 3.7.0"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_pyenv)
end

test "Changing SPACEFISH_PYENV_SUFFIX changes the character prefix"
	(
		set sf_exit_code 0
		set SPACEFISH_PYENV_SUFFIX ·

		set_color --bold fff
		echo -n "via "
		set_color normal
		set_color --bold yellow
		echo -n "🐍 3.7.0"
		set_color normal
		set_color --bold fff
		echo -n "·"
		set_color normal
	) = (__sf_section_pyenv)
end

test "Doesn't display node when SPACEFISH_PYENV_SHOW is set to 'false'"
	(
		set SPACEFISH_PYENV_SHOW false
	) = (__sf_section_pyenv)
end

