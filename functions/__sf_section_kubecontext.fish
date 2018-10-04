#
#  Kubernetes (kubectl)
#
# Kubernetes is an open-source system for deployment, scaling,
# and management of containerized applications.
# Link: https://kubernetes.io/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------
function __sf_section_kubecontext -d "Display the kubernetes context"
	__sf_util_set_default SPACEFISH_KUBECONTEXT_SHOW true
	__sf_util_set_default SPACEFISH_KUBECONTEXT_PREFIX "at "
  __sf_util_set_default SPACEFISH_KUBECONTEXT_SUFFIX $SPACEFISH_PROMPT_DEFAULT_SUFFIX
	# Additional space is added because ☸️ is wider than other symbols
	# See: https://github.com/denysdovhan/spaceship-prompt/pull/432
	__sf_util_set_default SPACEFISH_KUBECONTEXT_SYMBOL "☸️  "
	__sf_util_set_default SPACEFISH_KUBECONTEXT_COLOR cyan

	[ $SPACEFISH_KUBECONTEXT_SHOW = false ]; and return

	if not type -q kubectl
		return
	end

	set -l kube_context (kubectl config current-context ^/dev/null)

	__sf_lib_section \
		$SPACEFISH_KUBECONTEXT_COLOR \
		$SPACEFISH_KUBECONTEXT_PREFIX \
		"$SPACEFISH_KUBECONTEXT_SYMBOL$kube_context" \
		$SPACEFISH_KUBECONTEXT_SUFFIX

end
