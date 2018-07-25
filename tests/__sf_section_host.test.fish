source $DIRNAME/spacefish_test_setup.fish

function setup
	spacefish_test_setup
end


test "Correctly shows hostname upon SSH connection"
	(
		ssh localhost
		# How to add a check here?
		
	) = (__sf_section_host)
end