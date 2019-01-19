source $DIRNAME/spacefish_test_setup.fish

function setup
	spacefish_test_setup
	mock pyenv version-name 0 "echo \"3.7.0\""
	mkdir -p /tmp/tmp-spacefish
	cd /tmp/tmp-spacefish
end

function teardown
	rm -rf /tmp/tmp-spacefish
	if test "$PYENV_VERSION"
		set -e PYENV_VERSION
	end
end

test "Prints section when \$PYENV_VERSION is defined"
	(
		set PYENV_VERSION 3.7.0

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold yellow
		echo -n "🐍 3.7.0"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_pyenv)
end

test "Prints section when .python-version is present"
	(
		touch /tmp/tmp-spacefish/.python-version

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold yellow
		echo -n "🐍 3.7.0"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_pyenv)
end

test "Prints section when requirements.txt is present"
	(
		touch /tmp/tmp-spacefish/requirements.txt

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold yellow
		echo -n "🐍 3.7.0"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_pyenv)
end

test "Prints section when pyproject.toml is present"
	(
		touch /tmp/tmp-spacefish/pyproject.toml

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold yellow
		echo -n "🐍 3.7.0"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_pyenv)
end

test "Prints section when a *.py file is present"
	(
		touch /tmp/tmp-spacefish/testfile.py

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold yellow
		echo -n "🐍 3.7.0"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_pyenv)
end

test "Doesn't print the section when requirements.txt and *.py aren't present"
	() = (__sf_section_pyenv)
end

test "Changing SPACEFISH_PYENV_SYMBOL changes the displayed character"
	(
		touch /tmp/tmp-spacefish/requirements.txt
		set SPACEFISH_PYENV_SYMBOL "· "

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold yellow
		echo -n "· 3.7.0"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_pyenv)
end

test "Changing SPACEFISH_PYENV_PREFIX changes the character prefix"
	(
		touch /tmp/tmp-spacefish/requirements.txt
		set sf_exit_code 0
		set SPACEFISH_PYENV_PREFIX ·

		set_color --bold
		echo -n "·"
		set_color normal
		set_color --bold yellow
		echo -n "🐍 3.7.0"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_pyenv)
end

test "Changing SPACEFISH_PYENV_SUFFIX changes the character suffix"
	(
		touch /tmp/tmp-spacefish/requirements.txt
		set sf_exit_code 0
		set SPACEFISH_PYENV_SUFFIX ·

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold yellow
		echo -n "🐍 3.7.0"
		set_color normal
		set_color --bold
		echo -n "·"
		set_color normal
	) = (__sf_section_pyenv)
end

test "doesn't display the section when SPACEFISH_PYENV_SHOW is set to \"false\""
	(
		touch /tmp/tmp-spacefish/requirements.txt
		set SPACEFISH_PYENV_SHOW false
	) = (__sf_section_pyenv)
end
