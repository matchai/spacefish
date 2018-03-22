function spacefish_test_setup
	# Delete all lingering spacefish variables
	set --name | grep SPACEFISH_ | while read -l var
		set -e $var
	end

	# Initialize spacefish theme
	fish_prompt>/dev/null
end
