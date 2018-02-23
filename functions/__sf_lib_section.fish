function __sf_lib_section -a color prefix content suffix
	# If there are only 2 args, they're content and prefix
	if test (count $argv) -eq 2
		set content $argv[2]
		set prefix
	end

	# (sf_prompt_opened or SPACEFISH_PROMPT_FIRST_PREFIX_SHOW) and SPACEFISH_PROMPT_PREFIXES_SHOW
	if test $sf_prompt_opened = true -a $SPACEFISH_PROMPT_PREFIXES_SHOW = true
		# Echo prefixes in bold white
		set_color --bold fff
		echo -e -n -s $prefix
		set_color normal
	end
	set -g sf_prompt_opened true

	set_color --bold $color
	echo -e -n $content
	set_color normal

	if test $SPACEFISH_PROMPT_SUFFIXES_SHOW = true
		# Echo suffixes in bold white
		set_color --bold fff
		echo -e -n -s $suffix
		set_color normal
	end
end
