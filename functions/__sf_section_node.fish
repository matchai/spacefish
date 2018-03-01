#
# Node.js
#
# Node.js is a JavaScript runtime built on Chrome's V8 JavaScript engine.
# Link: https://nodejs.org/

function __sf_section_node -d "Display the local node version"
	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__sf_util_set_default SPACEFISH_NODE_SHOW true
	__sf_util_set_default SPACEFISH_NODE_PREFIX $SPACEFISH_PROMPT_DEFAULT_PREFIX
	__sf_util_set_default SPACEFISH_NODE_SUFFIX $SPACEFISH_PROMPT_DEFAULT_SUFFIX
	__sf_util_set_default SPACEFISH_NODE_SYMBOL "⬢ "
	__sf_util_set_default SPACEFISH_NODE_DEFAULT_VERSION $SPACEFISH_NODE_DEFAULT_VERSION
	__sf_util_set_default SPACEFISH_NODE_COLOR green

	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	[ $SPACEFISH_NODE_SHOW = false ]; and return

	if not test -f ./package.json -o -d ./node_modules
		return
	end

	set -l node_version

	if type -q nvm
		set node_version (nvm current ^/dev/null)
		if test $node_version = "system" -o $node_version = "node"
			return
		end
	else if type -q nodenv
		set node_version (nodenv version-name ^/dev/null)
		if test $node_version = "system" -o $node_version = "node"
			return
		end
	else if type -q node
		set node_version (node -v ^/dev/null)
	else
		return
	end

	if test $node_version = $SPACEFISH_NODE_DEFAULT_VERSION
		return
	end

	__sf_lib_section \
	$SPACEFISH_NODE_COLOR \
	$SPACEFISH_NODE_PREFIX \
	"$SPACEFISH_NODE_SYMBOL$node_version" \
	$SPACEFISH_NODE_SUFFIX
end
