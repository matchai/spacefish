source $DIRNAME/spacefish_test_setup.fish

function setup
	spacefish_test_setup
end

function teardown
	if set -q SSH_CONNECTION;
		set --erase SSH_CONNECTION
	end
end

test "Correctly shows hostname upon SSH connection"
	(
		set SSH_CONNECTION "192.168.0.100 12345 192.168.0.101 22"

		set_color --bold fff
		echo -n "at "
		set_color normal
		set_color --bold green
		echo -n (hostname)
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_host)
end

test "Display user when SPACEFISH_HOST_SHOW is set to 'always'"
	(
		set SPACEFISH_HOST_SHOW always

		set_color --bold fff
		echo -n "at "
		set_color normal
		set_color --bold blue
		echo -n (hostname)
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_host)
end

test "Display user when SPACEFISH_HOST_SHOW is set to 'always', over SSH"
	(
		set SPACEFISH_HOST_SHOW always
		set SSH_CONNECTION "192.168.0.100 12345 192.168.0.101 22"

		set_color --bold fff
		echo -n "at "
		set_color normal
		set_color --bold green
		echo -n (hostname)
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_host)
end

test "Don't display user when SPACEFISH_HOST_SHOW is set to 'false'"
	(
		set SPACEFISH_HOST_SHOW false
	) = (__sf_section_host)
end

test "Display hostname when set different from machine name, over SSH"
	(
		function hostname;
			echo "spacefish"
		end
		set SSH_CONNECTION "192.168.0.100 12345 192.168.0.101 22"

		set_color --bold fff
		echo -n "at "
		set_color normal
		set_color --bold green
		echo -n "spacefish"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_host)

	functions --erase hostname # Clean up temp. function, just in case.
end

test "Don't display hostname by default, without SSH"
	() = (__sf_section_host)
end

# Color testing; magenta = pass, red = failure.

test "Test color, no SSH."
	(
		set SPACEFISH_HOST_COLOR  "magenta" # No SSH connection. This should display.
		set SPACEFISH_HOST_COLOR_SSH  "red" # If red shows, test failed.
		set SPACEFISH_HOST_SHOW always

		set_color --bold fff
		echo -n "at "
		set_color normal
		set_color --bold "magenta"
		echo -n (hostname)
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_host)
end

test "Test color, with SSH."
	(
		set SPACEFISH_HOST_COLOR  "red" # If red shows, test failed.
		set SPACEFISH_HOST_COLOR_SSH  "magenta" # SSH connection exists. This should take precedence.
		set SSH_CONNECTION "192.168.0.100 12345 192.168.0.101 22"

		set_color --bold fff
		echo -n "at "
		set_color normal
		set_color --bold "magenta"
		echo -n (hostname)
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_host)
end