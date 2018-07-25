source $DIRNAME/spacefish_test_setup.fish

function setup
	spacefish_test_setup
end


test "Correctly shows hostname upon SSH connection"
	(
		echo "yes" | ssh localhost 'echo "Insert Tests Here" && exit'
		# How to add a check here?


		# Check hostname doesn't show outside of terminal, test variables
	) = (__sf_section_host)
end