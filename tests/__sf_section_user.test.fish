source $DIRNAME/spacefish_test_setup.fish

function setup
	spacefish_test_setup
end

function teardown
	set USER $LOGNAME
end

test "Displays user when different from logname"
	(
		set USER spacefishUser

		set_color --bold
		echo -n "with "
		set_color normal
		set_color --bold yellow
		echo -n "spacefishUser"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_user)
end

test "Displays user when UID = 0"
	(
		set UID 0

		set_color --bold
		echo -n "with "
		set_color normal
		set_color --bold yellow
		echo -n $USER
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_user)
end

test "Displays user when there's an SSH connection"
	(
		set SSH_CONNECTION "192.168.0.100 12345 192.168.0.101 22"

		set_color --bold
		echo -n "with "
		set_color normal
		set_color --bold yellow
		echo -n $USER
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_user)
end

test "Changes user color when logged in as root"
	(
		set USER root

		set_color --bold
		echo -n "with "
		set_color normal
		set_color --bold red
		echo -n root
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_user)
end

test "Displays user when SPACEFISH_USER_SHOW is set to \"always\""
	(
		set SPACEFISH_USER_SHOW always

		set_color --bold
		echo -n "with "
		set_color normal
		set_color --bold yellow
		echo -n $USER
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_user)
end

test "Doesn't display user when SPACEFISH_USER_SHOW is set to \"false\""
	(
		set SPACEFISH_USER_SHOW false
	) = (__sf_section_user)
end
