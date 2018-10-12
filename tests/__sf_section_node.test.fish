source $DIRNAME/spacefish_test_setup.fish
source $DIRNAME/mock.fish

function setup
	spacefish_test_setup
	mock node 0 "echo \"v9.8.0\""
	mkdir -p /tmp/tmp-spacefish/node_modules
	cd /tmp/tmp-spacefish
end

function teardown
	rm -rf /tmp/tmp-spacefish
end

test "Prints section when node_modules is present"
	(
		set_color --bold fff
		echo -n "via "
		set_color normal
		set_color --bold green
		echo -n "⬢ v9.8.0"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_node)
end

test "Prints section when package.json is present"
	(
		rm -rf /tmp/tmp-spacefish/node_modules
		touch /tmp/tmp-spacefish/package.json

		set_color --bold fff
		echo -n "via "
		set_color normal
		set_color --bold green
		echo -n "⬢ v9.8.0"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_node)
end

test "Doesn't print section when not in a directory with node_modules or package.json"
	(
		rm -rf /tmp/tmp-spacefish/node_modules
	) = (__sf_section_node)
end

test "Prints nvm version when nvm is installed"
	(
		set -e sf_node_version
		mock nvm 0 "echo \"v9.8.0\""

		set_color --bold fff
		echo -n "via "
		set_color normal
		set_color --bold green
		echo -n "⬢ v9.8.0"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_node)
end

test "Prints cached nvm version if previously used"
	(
		set sf_node_version "v1.2.3"
		set sf_last_nvm_bin "path_to_bin"
		set NVM_BIN "path_to_bin"
		mock nvm 0

		set_color --bold fff
		echo -n "via "
		set_color normal
		set_color --bold green
		echo -n "⬢ v1.2.3"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_node)
end

test "Prints nodenv version when nodenv is installed"
	(
		mock nodenv 0 "echo \"v9.8.0\""

		set_color --bold fff
		echo -n "via "
		set_color normal
		set_color --bold green
		echo -n "⬢ v9.8.0"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_node)

test "Prints nothing when using the \"system\" version of node with nvm"
	(
		mock nvm 0 "echo \"system\""
	) = (__sf_section_node)
end

test "Prints nothing when using the \"system\" version of node with nodenv"
	(
		mock nodenv 0 "echo \"system\""
	) = (__sf_section_node)
end

test "Prints nodenv version when nodenv is installed"
	(
		mock nodenv 0 "echo \"node\""
	) = (__sf_section_node)
end

test "Changing SPACEFISH_NODE_SYMBOL changes the displayed character"
	(
		mock nvm 0 "echo \"v9.8.0\""
		set SPACEFISH_NODE_SYMBOL "· "

		set_color --bold fff
		echo -n "via "
		set_color normal
		set_color --bold green
		echo -n "· v9.8.0"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_node)
end

test "Changing SPACEFISH_NODE_PREFIX changes the character prefix"
	(
		set sf_exit_code 0
		set SPACEFISH_NODE_PREFIX ·

		set_color --bold fff
		echo -n "·"
		set_color normal
		set_color --bold green
		echo -n "⬢ v9.8.0"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_node)
end

test "Changing SPACEFISH_NODE_PREFIX changes the character prefix"
	(
		set sf_exit_code 0
		set SPACEFISH_NODE_SUFFIX ·

		set_color --bold fff
		echo -n "via "
		set_color normal
		set_color --bold green
		echo -n "⬢ v9.8.0"
		set_color normal
		set_color --bold fff
		echo -n "·"
		set_color normal
	) = (__sf_section_node)
end

test "Setting SPACEFISH_NODE_DEFAULT_VERSION to the current version disables the section"
	(
		set sf_exit_code 0
		set SPACEFISH_NODE_DEFAULT_VERSION v9.8.0
	) = (__sf_section_node)
end

test "Doesn't display node when SPACEFISH_NODE_SHOW is set to 'false'"
	(
		set SPACEFISH_NODE_SHOW false
	) = (__sf_section_node)
end
