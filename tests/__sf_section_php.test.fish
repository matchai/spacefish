source $DIRNAME/spacefish_test_setup.fish
source $DIRNAME/mock.fish

function setup
	spacefish_test_setup
	mock php 0 "echo \"PHP 7.1.16 (cli) (built: Mar 31 2018 02:59:59) ( NTS )
	Copyright (c) 1997-2018 The PHP Group
	Zend Engine v3.1.0, Copyright (c) 1998-2018 Zend Technologies\""
	mkdir -p /tmp/tmp-spacefish
	touch /tmp/tmp-spacefish/composer.json
	cd /tmp/tmp-spacefish
end

function teardown
	rm -rf /tmp/tmp-spacefish
end

test "Prints section when composer.json is present"
	(
		set_color --bold fff
		echo -n "via "
		set_color normal
		set_color --bold blue
		echo -n "🐘 v7.1.16"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_php)
end

test "Prints section when a *.php file is present"
	(
		rm -rf /tmp/tmp-spacefish/composer.json
		touch /tmp/tmp-spacefish/testfile.php

		set_color --bold fff
		echo -n "via "
		set_color normal
		set_color --bold blue
		echo -n "🐘 v7.1.16"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_php)
end

test "Doesn't print the section when composer.json and *.php aren't present"
	(
		rm -rf /tmp/tmp-spacefish/composer.json
	) = (__sf_section_php)
end

test "Changing SPACEFISH_PHP_SYMBOL changes the displayed character"
	(
		set SPACEFISH_PHP_SYMBOL "· "

		set_color --bold fff
		echo -n "via "
		set_color normal
		set_color --bold blue
		echo -n "· v7.1.16"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_php)
end

test "Changing SPACEFISH_PHP_PREFIX changes the character prefix"
	(
		set sf_exit_code 0
		set SPACEFISH_PHP_PREFIX ·

		set_color --bold fff
		echo -n "·"
		set_color normal
		set_color --bold blue
		echo -n "🐘 v7.1.16"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_php)
end

test "Changing SPACEFISH_PHP_SUFFIX changes the character prefix"
	(
		set sf_exit_code 0
		set SPACEFISH_PHP_SUFFIX ·

		set_color --bold fff
		echo -n "via "
		set_color normal
		set_color --bold blue
		echo -n "🐘 v7.1.16"
		set_color normal
		set_color --bold fff
		echo -n "·"
		set_color normal
	) = (__sf_section_php)
end

test "Doesn't display node when SPACEFISH_PHP_SHOW is set to 'false'"
	(
		set SPACEFISH_PHP_SHOW false
	) = (__sf_section_php)
end

