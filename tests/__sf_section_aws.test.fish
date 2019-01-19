source $DIRNAME/spacefish_test_setup.fish

function setup
	spacefish_test_setup
	mock aws \* 0
	set -g AWS_PROFILE user1
end

test "Prints section when AWS_PROFILE is set"
	(
		set_color --bold
		echo -n "using "
		set_color normal
		set_color --bold ff8700
		echo -n "☁️ user1"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_aws)
end

test "Doesn't print the section when AWS_PROFILE isn't set"
	(
		set --erase AWS_PROFILE
	) = (__sf_section_aws)
end

test "Doesn't print the section when AWS_PROFILE is set to \"default\""
	(
		set AWS_PROFILE default
	) = (__sf_section_aws)
end

test "Changing SPACEFISH_AWS_SYMBOL changes the displayed character"
	(
		set SPACEFISH_AWS_SYMBOL "· "

		set_color --bold
		echo -n "using "
		set_color normal
		set_color --bold ff8700
		echo -n "· user1"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_aws)
end

test "Changing SPACEFISH_AWS_PREFIX changes the character prefix"
	(
		set sf_exit_code 0
		set SPACEFISH_AWS_PREFIX ·

		set_color --bold
		echo -n "·"
		set_color normal
		set_color --bold ff8700
		echo -n "☁️ user1"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_aws)
end

test "Changing SPACEFISH_AWS_SUFFIX changes the character suffix"
	(
		set sf_exit_code 0
		set SPACEFISH_AWS_SUFFIX ·

		set_color --bold
		echo -n "using "
		set_color normal
		set_color --bold ff8700
		echo -n "☁️ user1"
		set_color normal
		set_color --bold
		echo -n "·"
		set_color normal
	) = (__sf_section_aws)
end

test "doesn't display the section when SPACEFISH_AWS_SHOW is set to \"false\""
	(
		set SPACEFISH_AWS_SHOW false
	) = (__sf_section_aws)
end
