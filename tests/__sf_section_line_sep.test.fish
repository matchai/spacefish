source $DIRNAME/spacefish_test_setup.fish

function setup
	spacefish_test_setup
end

test "Echoes a line break"
	(
		echo -n -e \n
	) = (__sf_section_line_sep)
end
