source ./spacefish_test_setup.fish

function setup
	spacefish_test_setup
	mock dotnet --version 0 "echo \"2.1.403\""
	mkdir -p /tmp/$filename
	cd /tmp/$filename
end

function teardown
	rm -rf /tmp/$filename
end

@test "Prints nothing when required files are missing" (
		rm -f /tmp/$filename/project.json
		rm -f /tmp/$filename/global.json
		rm -f /tmp/$filename/paket.dependencies
		rm -f '/tmp/$filename/*.sln'
		rm -f '/tmp/$filename/*.csproj'
		rm -f '/tmp/$filename/*.fsproj'
		rm -f '/tmp/$filename/*.xproj'
) = (__sf_section_dotnet)

@test "Prints section if project.json is present" (
		touch /tmp/$filename/project.json

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

@test "Prints section if global.json is present" (
		touch /tmp/$filename/global.json
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

@test "Prints section if paket.dependencies is present" (
		touch /tmp/$filename/paket.dependencies
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

@test "Prints section if a .csproj file is present" (
		touch /tmp/$filename/tmp.csproj

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

@test "Prints section if a .fsproj file is present" (
		touch /tmp/$filename/tmp.fsproj

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

@test "Prints section if a .xproj file is present" (
		touch /tmp/$filename/tmp.xproj
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

@test "Prints section if a .sln file is present" (
		touch /tmp/$filename/tmp.sln

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

@test "Changing SPACEFISH_DOTNET_SYMBOL changes the displayed character" (
		touch /tmp/$filename/tmp.sln

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

@test "Changing SPACEFISH_DOTNET_PREFIX changes the character prefix" (
		touch /tmp/$filename/tmp.sln
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

@test "Changing SPACEFISH_DOTNET_SUFFIX changes the character prefix" (
		touch /tmp/$filename/tmp.sln
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

@test "Doesn't display .NET when SPACEFISH_DOTNET_SHOW is set to 'false'" (
		set SPACEFISH_DOTNET_SHOW false
) = (__sf_section_dotnet)
