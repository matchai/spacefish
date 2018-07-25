source $DIRNAME/spacefish_test_setup.fish
source $DIRNAME/mock.fish

function setup
	spacefish_test_setup
	mock node 0 "echo \"v9.8.0\""
end

test "Prints section when node_modules is present"
	(
		mkdir -p /tmp/tmp-spacefish/node_modules
		cd /tmp/tmp-spacefish

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
		mkdir -p /tmp/tmp-spacefish
		touch /tmp/tmp-spacefish/package.json
		cd /tmp/tmp-spacefish

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

test "Print nothing when using the \"system\" version of node with nvm"
	(
		mock nvm 0 "echo \"system\""
	) = (__sf_section_node)
end

test "Print nothing when using the \"system\" version of node with nodenv"
	(
		mock nodenv 0 "echo \"system\""
	) = (__sf_section_node)
end

test "Prints nodenv version when nodenv is installed"
	(
		mock nodenv 0 "echo \"node\""
	) = (__sf_section_node)
end
