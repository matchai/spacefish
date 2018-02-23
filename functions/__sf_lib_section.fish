function __sf_lib_section -a color prefix content suffix
	# Internal variable for checking if prompt is opened
	set -g sf_prompt_opened true
	
	if test (count $argv) -eq 2
		set content $argv[2]
		set prefix
	end

	if test $sf_prompt_opened = true -a $SPACEFISH_PROMPT_PREFIXES_SHOW = true
		set_color --bold fff
		echo -e -n -s $prefix
		set_color normal
	end
	set -g sf_prompt_opened true

	set_color --bold $color
	echo -e -n $content
	set_color normal

	if test $SPACEFISH_PROMPT_SUFFIXES_SHOW = true
		set_color --bold fff
		echo -e -n -s $suffix
		set_color normal
	end
end
