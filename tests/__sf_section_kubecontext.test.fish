source $DIRNAME/spacefish_test_setup.fish
source $DIRNAME/mock.fish

function setup
	spacefish_test_setup
	mock kubectl 0 "echo \"testkube\""
end

test "Prints section"
	(
		set_color --bold fff
		echo -n "at "
		set_color normal
		set_color --bold cyan
		echo -n "☸️ testkube"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_kubecontext)
end

test "Changing SPACEFISH_KUBECONTEXT_SYMBOL changes the displayed character"
	(
		set SPACEFISH_KUBECONTEXT_SYMBOL "· "

		set_color --bold fff
		echo -n "at "
		set_color normal
		set_color --bold cyan
		echo -n "· testkube"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_kubecontext)
end

test "Changing SPACEFISH_KUBECONTEXT_PREFIX changes the character prefix"
	(
		set sf_exit_code 0
		set SPACEFISH_KUBECONTEXT_PREFIX ·

		set_color --bold fff
		echo -n "·"
		set_color normal
		set_color --bold cyan
		echo -n "☸️ testkube"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_kubecontext)
end

test "Changing SPACEFISH_KUBECONTEXT_SUFFIX changes the character prefix"
	(
		set sf_exit_code 0
		set SPACEFISH_KUBECONTEXT_SUFFIX ·

		set_color --bold fff
		echo -n "at "
		set_color normal
		set_color --bold cyan
		echo -n "☸️ testkube"
		set_color normal
		set_color --bold fff
		echo -n "·"
		set_color normal
	) = (__sf_section_kubecontext)
end

test "Doesn't display node when SPACEFISH_KUBECONTEXT_SHOW is set to 'false'"
	(
		set SPACEFISH_KUBECONTEXT_SHOW false
	) = (__sf_section_kubecontext)
end

