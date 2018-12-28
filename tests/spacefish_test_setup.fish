source $DIRNAME/mock.fish

function spacefish_test_setup
	# Delete all lingering spacefish variables
	set --name | grep -E '^(SPACEFISH_|sf_)' | while read -l var
		set -e $var
	end

	# Delete lingering mocked functions
	for mock in $_mocked
		unmock $mock
	end

	set -gx fish_emoji_width 2
	set -gx fish_ambiguous_width 2

	# Initialize spacefish theme
	fish_prompt>/dev/null
end
