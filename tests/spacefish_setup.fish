function spacefish_setup
	# Delete all lingering SPACEFISH variables
	set --name | grep SPACEFISH_ | while read -l var
		set -e $var
	end

	# Initialize spacefish theme
	fish_prompt>/dev/null
end
