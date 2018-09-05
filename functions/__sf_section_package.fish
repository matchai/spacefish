#
# Package
#
# Current package version.
# These package managers supported:
#   * NPM

function __sf_section_package -d "Display the local package version"
	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__sf_util_set_default SPACEFISH_PACKAGE_SHOW true
	__sf_util_set_default SPACEFISH_PACKAGE_PREFIX "is "
	__sf_util_set_default SPACEFISH_PACKAGE_SUFFIX $SPACEFISH_PROMPT_DEFAULT_SUFFIX
	__sf_util_set_default SPACEFISH_PACKAGE_SYMBOL "📦 "
	__sf_util_set_default SPACEFISH_PACKAGE_COLOR red

	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	[ $SPACEFISH_PACKAGE_SHOW = false ]; and return

	# Show package version only when repository is a package
	[ -f ./package.json ]; or return
	# Show package version only if npm is installed
	type -q npm; or return

	set -l version_line (grep -E '"version": "v?([0-9]+\.){1,}' package.json)
	set -l package_version (string split \" $version_line)[4]

	if test -z "$package_version"
		set package_version ⚠
	else
		set package_version "v$package_version"
	end

	__sf_lib_section \
		$SPACEFISH_PACKAGE_COLOR \
		$SPACEFISH_PACKAGE_PREFIX \
		"$SPACEFISH_PACKAGE_SYMBOL$package_version" \
		$SPACEFISH_PACKAGE_SUFFIX
end
