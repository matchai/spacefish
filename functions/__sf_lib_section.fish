function __sf_lib_section -a color prefix content suffix
	# If there are only 2 args, they are $content and $prefix
	if test (count $argv) -eq 2
		set content $argv[2]
		set prefix
	end

	if test "$sf_prompt_opened" = "true" -a "$SPACEFISH_PROMPT_PREFIXES_SHOW" = "true"
		if test "$SPACEFISH_PROMPT_BOLD" = "true"
			# Echo prefixes in bold white
			set_color --bold
		end

		echo -e -n -s $prefix

		set_color normal
	end

	# Set the prompt as having been opened
	set -g sf_prompt_opened true

	if test "$SPACEFISH_PROMPT_BOLD" = "true"
		set_color --bold $color
	else
		set_color $color
	end

	echo -e -n $content

	set_color normal

	if test "$SPACEFISH_PROMPT_SUFFIXES_SHOW" = "true"
		if test "$SPACEFISH_PROMPT_BOLD" = "true"
			# Echo suffixes in bold white
			set_color --bold
		end

		echo -e -n -s $suffix

		set_color normal
	end
end
