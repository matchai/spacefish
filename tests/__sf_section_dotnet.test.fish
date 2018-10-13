source $DIRNAME/spacefish_test_setup.fish
source $DIRNAME/mock.fish

function setup
	spacefish_test_setup
	mock dotnet 0 "echo \"2.1.403\""
	mkdir -p /tmp/tmp-spacefish
	touch /tmp/tmp-spacefish/project.json
	cd /tmp/tmp-spacefish
end

function teardown
	rm -rf /tmp/tmp-spacefish
end

test "Prints section"
	(
		touch
		set_color --bold fff
		echo -n "via "
		set_color normal
		set_color --bold 128
		echo -n ".NET 2.1.403"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_dotnet)
end

test "Changing SPACEFISH_DOTNET_SYMBOL changes the displayed character"
	(
		set SPACEFISH_DOTNET_SYMBOL "· "

		set_color --bold fff
		echo -n "via "
		set_color normal
		set_color --bold 128
		echo -n "· 2.1.403"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_dotnet)
end

test "Changing SPACEFISH_DOTNET_PREFIX changes the character prefix"
	(
		set sf_exit_code 0
		set SPACEFISH_DOTNET_PREFIX ·

		set_color --bold fff
		echo -n "·"
		set_color normal
		set_color --bold 128
		echo -n ".NET 2.1.403"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_dotnet)
end

test "Changing SPACEFISH_DOTNET_SUFFIX changes the character prefix"
	(
		set sf_exit_code 0
		set SPACEFISH_DOTNET_SUFFIX ·

		set_color --bold fff
		echo -n "via "
		set_color normal
		set_color --bold 128
		echo -n ".NET 2.1.403"
		set_color normal
		set_color --bold fff
		echo -n "·"
		set_color normal
	) = (__sf_section_dotnet)
end

test "Doesn't display .NET when SPACEFISH_DOTNET_SHOW is set to 'false'"
	(
		set SPACEFISH_DOTNET_SHOW false
	) = (__sf_section_dotnet)
end

