source $DIRNAME/spacefish_test_setup.fish

function setup
	spacefish_test_setup
	mock dotnet --version 0 "echo \"2.1.403\""
	mkdir -p /tmp/tmp-spacefish
	cd /tmp/tmp-spacefish
end

function teardown
	rm -rf /tmp/tmp-spacefish
end

test "Prints nothing when required files are missing"
	(
		rm -f /tmp/tmp-spacefish/project.json
		rm -f /tmp/tmp-spacefish/global.json
		rm -f /tmp/tmp-spacefish/paket.dependencies
		rm -f '/tmp/tmp-spacefish/*.sln'
		rm -f '/tmp/tmp-spacefish/*.csproj'
		rm -f '/tmp/tmp-spacefish/*.fsproj'
		rm -f '/tmp/tmp-spacefish/*.xproj'
	) = (__sf_section_dotnet)
end

test "Prints section if project.json is present"
	(
		touch /tmp/tmp-spacefish/project.json

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold af00d7
		echo -n ".NET 2.1.403"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_dotnet)
end

test "Prints section if global.json is present"
	(
		touch /tmp/tmp-spacefish/global.json
		set_color --bold

		echo -n "via "
		set_color normal
		set_color --bold af00d7
		echo -n ".NET 2.1.403"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_dotnet)
end

test "Prints section if paket.dependencies is present"
	(
		touch /tmp/tmp-spacefish/paket.dependencies
		set_color --bold

		echo -n "via "
		set_color normal
		set_color --bold af00d7
		echo -n ".NET 2.1.403"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_dotnet)
end

test "Prints section if a .csproj file is present"
	(
		touch /tmp/tmp-spacefish/tmp.csproj

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold af00d7
		echo -n ".NET 2.1.403"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_dotnet)
end

test "Prints section if a .fsproj file is present"
	(
		touch /tmp/tmp-spacefish/tmp.fsproj

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold af00d7
		echo -n ".NET 2.1.403"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_dotnet)
end

test "Prints section if a .xproj file is present"
	(
		touch /tmp/tmp-spacefish/tmp.xproj
		set_color --bold

		echo -n "via "
		set_color normal
		set_color --bold af00d7
		echo -n ".NET 2.1.403"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_dotnet)
end

test "Prints section if a .sln file is present"
	(
		touch /tmp/tmp-spacefish/tmp.sln

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold af00d7
		echo -n ".NET 2.1.403"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_dotnet)
end

test "Changing SPACEFISH_DOTNET_SYMBOL changes the displayed character"
	(
		touch /tmp/tmp-spacefish/tmp.sln

		set SPACEFISH_DOTNET_SYMBOL "· "
		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold af00d7
		echo -n "· 2.1.403"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_dotnet)
end

test "Changing SPACEFISH_DOTNET_PREFIX changes the character prefix"
	(
		touch /tmp/tmp-spacefish/tmp.sln
		set sf_exit_code 0
		set SPACEFISH_DOTNET_PREFIX ·

		set_color --bold
		echo -n "·"
		set_color normal
		set_color --bold af00d7
		echo -n ".NET 2.1.403"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_dotnet)
end

test "Changing SPACEFISH_DOTNET_SUFFIX changes the character prefix"
	(
		touch /tmp/tmp-spacefish/tmp.sln
		set sf_exit_code 0
		set SPACEFISH_DOTNET_SUFFIX ·

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold af00d7
		echo -n ".NET 2.1.403"
		set_color normal
		set_color --bold
		echo -n "·"
		set_color normal
	) = (__sf_section_dotnet)
end

test "Doesn't display .NET when SPACEFISH_DOTNET_SHOW is set to 'false'"
	(
		set SPACEFISH_DOTNET_SHOW false
	) = (__sf_section_dotnet)
end
