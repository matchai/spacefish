source $DIRNAME/spacefish_test_setup.fish

function setup
	spacefish_test_setup
end

test "Exit code not enabled by default"
	(
		set sf_exit_code 1
	) = (__sf_section_exit_code)
end

test "Enable exit-code, shows exit code upon fail"
	(
		set SPACEFISH_EXIT_CODE_SHOW true
		set sf_exit_code 1

		set_color --bold
		set_color normal
		set_color --bold red
		echo -n "✘1"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_exit_code)
end

test "Hides exit code upon success"
	(
		set SPACEFISH_EXIT_CODE_SHOW true
		set sf_exit_code 0
	) = (__sf_section_exit_code)
end

test "Color-changing exit code"
	(
		set SPACEFISH_EXIT_CODE_SHOW true
		set SPACEFISH_EXIT_CODE_COLOR "purple"
		set sf_exit_code 1

		set_color --bold
		set_color normal
		set_color --bold purple
		echo -n "✘1"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_exit_code)
end
