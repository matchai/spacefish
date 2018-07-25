source $DIRNAME/spacefish_test_setup.fish

function setup
	spacefish_test_setup
end


test "Correctly shows hostname upon SSH connection"
	(
		echo "yes" | ssh localhost
		# How to add a check here?

		# Check hostname is correct

		exit
		# Check hostname doesn't work outside of terminal, test variables
	) = (__sf_section_host)
end