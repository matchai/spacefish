# pyenv
#

function __sf_section_nix -d "Show in nix-shell indicator"
	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__sf_util_set_default SPACEFISH_NIX_SHOW true
	__sf_util_set_default SPACEFISH_NIX_PREFIX $SPACEFISH_PROMPT_DEFAULT_PREFIX
	__sf_util_set_default SPACEFISH_NIX_SUFFIX $SPACEFISH_PROMPT_DEFAULT_SUFFIX
	__sf_util_set_default SPACEFISH_NIX_SYMBOL "🅽 "
	__sf_util_set_default SPACEFISH_NIX_COLOR blue

	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	# Show nix-shell python version
	[ $SPACEFISH_NIX_SHOW = false ]; and return

	# Show nix-shell python version only for Python-specific folders
	if not test -n "$IN_NIX_SHELL"
		return
	end

	__sf_lib_section \
		$SPACEFISH_NIX_COLOR \
		$SPACEFISH_NIX_PREFIX \
		"$SPACEFISH_NIX_SYMBOL" \
		$SPACEFISH_NIX_SUFFIX
end
