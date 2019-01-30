#
# Swift
#
# Swift Swift makes it easy to write software that is incredibly fast and safe by design.
# Link: https://swift.org

function __sf_section_swift -d "Display the current swift version if you are inside a path that contains a swift package"
	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__sf_util_set_default SPACEFISH_SWIFT_SHOW true
	__sf_util_set_default SPACEFISH_SWIFT_PREFIX $SPACEFISH_PROMPT_DEFAULT_PREFIX
	__sf_util_set_default SPACEFISH_SWIFT_SUFFIX $SPACEFISH_PROMPT_DEFAULT_SUFFIX
	__sf_util_set_default SPACEFISH_SWIFT_SYMBOL "🦜 "
	__sf_util_set_default SPACEFISH_SWIFT_COLOR cyan

	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	# Show the current version?
	[ $SPACEFISH_SWIFT_SHOW = false ]; and return

	# Ensure the swift command is available
	type -q swift; or return

	if not test -f Package.swift
		return
	end

	set swift_version (string sub -s 1 (swift --version | string split ' ')[4])

	__sf_lib_section \
		$SPACEFISH_SWIFT_COLOR \
		$SPACEFISH_SWIFT_PREFIX \
		"$SPACEFISH_SWIFT_SYMBOL""$swift_version" \
		$SPACEFISH_SWIFT_SUFFIX
end
