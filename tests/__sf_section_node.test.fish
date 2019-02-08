set root (dirname (status -f))
source $root/tests/spacefish_test_setup.fish

function setup
	spacefish_test_setup
	mock node -v 0 "echo \"v9.8.0\""
	mkdir -p /tmp/$filename/
	cd /tmp/$filename
end

function teardown
	rm -rf /tmp/$filename
end

@test "Prints section when node_modules is present" (
		mkdir /tmp/$filename/node_modules

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold green
		echo -n "⬢ v9.8.0"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
) = (__sf_section_node)

@test "Prints section when package.json is present" (
		touch /tmp/$filename/package.json

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold green
		echo -n "⬢ v9.8.0"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
) = (__sf_section_node)

@test "Doesn't print section when not in a directory with node_modules or package.json" () = (__sf_section_node)

@test "Prints nvm version when nvm is installed" (
		mkdir /tmp/$filename/node_modules
		set -e sf_node_version
		mock nvm current 0 "echo \"v9.8.0\""

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold green
		echo -n "⬢ v9.8.0"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
) = (__sf_section_node)

@test "Prints cached nvm version if previously used" (
		mkdir /tmp/$filename/node_modules
		set sf_node_version "v1.2.3"
		set sf_last_nvm_bin "path_to_bin"
		set NVM_BIN "path_to_bin"
		mock nvm current 0

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold green
		echo -n "⬢ v1.2.3"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
) = (__sf_section_node)

@test "Prints nodenv version when nodenv is installed" (
		mkdir /tmp/$filename/node_modules
		mock nodenv version-name 0 "echo \"v9.8.0\""

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold green
		echo -n "⬢ v9.8.0"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_node)

@test "Prints nothing when using the \"system\" version of node with nvm" (
		mkdir /tmp/$filename/node_modules
		mock nvm current 0 "echo \"system\""
) = (__sf_section_node)

@test "Prints nothing when using the \"system\" version of node with nodenv" (
		mkdir /tmp/$filename/node_modules
		mock nodenv version-name 0 "echo \"system\""
) = (__sf_section_node)

@test "Prints nodenv version when nodenv is installed" (
		mkdir /tmp/$filename/node_modules
		mock nodenv version-name 0 "echo \"node\""
) = (__sf_section_node)

@test "Changing SPACEFISH_NODE_SYMBOL changes the displayed character" (
		mkdir /tmp/$filename/node_modules
		mock nvm current 0 "echo \"v9.8.0\""
		set SPACEFISH_NODE_SYMBOL "· "

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold green
		echo -n "· v9.8.0"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
) = (__sf_section_node)

@test "Changing SPACEFISH_NODE_PREFIX changes the character prefix" (
		mkdir /tmp/$filename/node_modules
		set sf_exit_code 0
		set SPACEFISH_NODE_PREFIX ·

		set_color --bold
		echo -n "·"
		set_color normal
		set_color --bold green
		echo -n "⬢ v9.8.0"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
) = (__sf_section_node)

@test "Changing SPACEFISH_NODE_PREFIX changes the character prefix" (
		mkdir /tmp/$filename/node_modules
		set sf_exit_code 0
		set SPACEFISH_NODE_SUFFIX ·

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold green
		echo -n "⬢ v9.8.0"
		set_color normal
		set_color --bold
		echo -n "·"
		set_color normal
) = (__sf_section_node)

@test "Setting SPACEFISH_NODE_DEFAULT_VERSION to the current version disables the section" (
		mkdir /tmp/$filename/node_modules
		set sf_exit_code 0
		set SPACEFISH_NODE_DEFAULT_VERSION v9.8.0
) = (__sf_section_node)

@test "doesn't display the section when SPACEFISH_NODE_SHOW is set to \"false\"" (
		mkdir /tmp/$filename/node_modules
		set SPACEFISH_NODE_SHOW false
) = (__sf_section_node)
