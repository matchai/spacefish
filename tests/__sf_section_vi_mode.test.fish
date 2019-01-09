source $DIRNAME/spacefish_test_setup.fish

function setup
	spacefish_test_setup
	fish_vi_key_bindings; or true
	# Unfortunately right after enabling vi-keys it's in 'normal' state on CI and in 'insert' locally
	set fish_bind_mode insert
end

test "Prints section when fish_vi_key_bindigs is set"
	(
		set_color --bold
		echo -n " "
		set_color normal
		set_color --bold white
		echo -n "[I]"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_vi_mode)
end

test "Prints SPACEFISH_VI_MODE_VISUAL when fish_bind_mode is visual"
	(
		set fish_bind_mode visual
		set SPACEFISH_VI_MODE_VISUAL "-V-"

		set_color --bold
		echo -n " "
		set_color normal
		set_color --bold white
		echo -n $SPACEFISH_VI_MODE_VISUAL
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_vi_mode)
end

test "Prints SPACEFISH_VI_MODE_REPLACE_ONE when fish_bind_mode is replace_one"
	(
		set fish_bind_mode replace_one
		set SPACEFISH_VI_MODE_REPLACE_ONE "-R-"

		set_color --bold
		echo -n " "
		set_color normal
		set_color --bold white
		echo -n $SPACEFISH_VI_MODE_REPLACE_ONE
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_vi_mode)
end

test "Prints SPACEFISH_VI_MODE_NORMAL when fish_bind_mode is normal"
	(
		set fish_bind_mode default
		set SPACEFISH_VI_MODE_NORMAL "-N-"

		set_color --bold
		echo -n " "
		set_color normal
		set_color --bold white
		echo -n $SPACEFISH_VI_MODE_NORMAL
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_vi_mode)
end

test "Prints SPACEFISH_VI_MODE_INSERT when fish_bind_mode is insert"
	(
		set fish_bind_mode insert
		set SPACEFISH_VI_MODE_INSERT "-I-"

		set_color --bold
		echo -n " "
		set_color normal
		set_color --bold white
		echo -n $SPACEFISH_VI_MODE_INSERT
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_vi_mode)
end

test "Prints prefix when SPACEFISH_VI_MODE_PREFIX is set"
	(
		set SPACEFISH_VI_MODE_PREFIX "VIM "

		set_color --bold
		echo -n "$SPACEFISH_VI_MODE_PREFIX"
		set_color normal
		set_color --bold white
		echo -n "[I]"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_vi_mode)
end

test "Prints suffix when SPACEFISH_VI_MODE_SUFFIX is set"
	(
		set SPACEFISH_VI_MODE_SUFFIX " VIM "

		set_color --bold
		echo -n " "
		set_color normal
		set_color --bold white
		echo -n "[I]"
		set_color normal
		set_color --bold
		echo -n $SPACEFISH_VI_MODE_SUFFIX
		set_color normal
	) = (__sf_section_vi_mode)
end

test "Use color from SPACEFISH_VI_MODE_COLOR"
	(
		set SPACEFISH_VI_MODE_COLOR red

		set_color --bold
		echo -n " "
		set_color normal
		set_color --bold red
		echo -n "[I]"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_vi_mode)
end

test "Don't print anything if SPACEFISH_VI_MODE_SHOW is false"
	(
		set SPACEFISH_VI_MODE_SHOW false
	) = (__sf_section_vi_mode)
end
