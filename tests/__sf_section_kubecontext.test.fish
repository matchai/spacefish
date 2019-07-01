source $DIRNAME/spacefish_test_setup.fish

function setup
	spacefish_test_setup
	mock kubectl config 0 "echo \"testkube\""
end

test "Prints section"
	(
		set_color --bold
		echo -n "at "
		set_color normal
		set_color --bold cyan
		echo -n "☸️  testkube (testkube)"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_kubecontext)
end

test "Kubecontext symbol does not appear outside of a Kubernetes project"
	(
		mock kubectl config 1
	) = (__sf_section_kubecontext)
end

test "Changing SPACEFISH_KUBECONTEXT_SYMBOL changes the displayed character"
	(
		set SPACEFISH_KUBECONTEXT_SYMBOL "· "

		set_color --bold
		echo -n "at "
		set_color normal
		set_color --bold cyan
		echo -n "· testkube (testkube)"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_kubecontext)
end

test "Changing SPACEFISH_KUBECONTEXT_PREFIX changes the character prefix"
	(
		set sf_exit_code 0
		set SPACEFISH_KUBECONTEXT_PREFIX ·

		set_color --bold
		echo -n "·"
		set_color normal
		set_color --bold cyan
		echo -n "☸️  testkube (testkube)"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_kubecontext)
end

test "Changing SPACEFISH_KUBECONTEXT_SUFFIX changes the character suffix"
	(
		set sf_exit_code 0
		set SPACEFISH_KUBECONTEXT_SUFFIX ·

		set_color --bold
		echo -n "at "
		set_color normal
		set_color --bold cyan
		echo -n "☸️  testkube (testkube)"
		set_color normal
		set_color --bold
		echo -n "·"
		set_color normal
	) = (__sf_section_kubecontext)
end

test "Doesn't display the section when SPACEFISH_KUBECONTEXT_SHOW is set to \"false\""
	(
		set SPACEFISH_KUBECONTEXT_SHOW false
	) = (__sf_section_kubecontext)
end

test "Doesn't display the namespace section when SPACEFISH_KUBECONTEXT_NAMESPACE_SHOW is set to \"false\""
	(
		set SPACEFISH_KUBECONTEXT_NAMESPACE_SHOW false
		set sf_exit_code 0
		set SPACEFISH_KUBECONTEXT_SUFFIX ·

		set_color --bold
		echo -n "at "
		set_color normal
		set_color --bold cyan
		echo -n "☸️  testkube"
		set_color normal
		set_color --bold
		echo -n "·"
		set_color normal
	) = (__sf_section_kubecontext)
end

test "Doesn't display the namespace section when kube_context is set to \"default\""
	(
		mock kubectl config 0 "echo \"default\""

		set sf_exit_code 0
		set SPACEFISH_KUBECONTEXT_SUFFIX ·

		set_color --bold
		echo -n "at "
		set_color normal
		set_color --bold cyan
		echo -n "☸️  default"
		set_color normal
		set_color --bold
		echo -n "·"
		set_color normal
	) = (__sf_section_kubecontext)
end
