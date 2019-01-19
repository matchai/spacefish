function spacefish_test_setup
	# Delete all lingering spacefish variables
	set --name | grep -E '^(SPACEFISH_|sf_)' | while read -l var
		set -e $var
	end

	# Delete lingering mocked functions
	for mock in $_mocked
		unmock $mock
	end

	# Initialize spacefish theme
	fish_prompt>/dev/null
end
