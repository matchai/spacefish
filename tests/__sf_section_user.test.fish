function setup
	fish_prompt>/dev/null
end

test "Display user when different from logname"
	(
		set USER spacefishUser

		set_color --bold fff
		echo -n "with "
		set_color normal
		set_color --bold yellow
		echo -n "spacefishUser"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_user)
end

test "Display user when UID = 0"
	(
		set UID 0

		set_color --bold fff
		echo -n "with "
		set_color normal
		set_color --bold yellow
		echo -n $USER
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_user)
end

test "Display user when UID = 0"
	(
		set UID 0

		set_color --bold fff
		echo -n "with "
		set_color normal
		set_color --bold yellow
		echo -n $USER
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_user)
end

test "Display user when there's an SSH connection"
	(
		set SSH_CONNECTION "192.168.0.100 12345 192.168.0.101 22"

		set_color --bold fff
		echo -n "with "
		set_color normal
		set_color --bold yellow
		echo -n $USER
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_user)
end

test "Change user color when logged in as root"
	(
		set USER root

		set_color --bold fff
		echo -n "with "
		set_color normal
		set_color --bold red
		echo -n root
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_user)
end

test "Display user when SPACEFISH_USER_SHOW is set to 'always'"
	(
		set SPACEFISH_USER_SHOW always

		set_color --bold fff
		echo -n "with "
		set_color normal
		set_color --bold yellow
		echo -n $USER
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_user)
end

test "Don't display user when SPACEFISH_USER_SHOW is set to 'false'"
	(
		set SPACEFISH_USER_SHOW false
	) = (__sf_section_user)
end
