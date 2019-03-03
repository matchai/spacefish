#
# Package
#
# Current package version.
# These package managers supported:
#   * NPM
#   * Cargo

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

	# Exit if there is no package.json or Cargo.toml
  if not test -e ./package.json; and not test -e ./Cargo.toml
    return
  end

  set -l package_version

  # Check if package.json exists AND npm exists locally while supressing output to just exit code (-q)
  if test -f ./package.json; and type -q npm
    # Check if jq (json handler) exists locally. If yes, check in package.json version
    if type -q jq
      set package_version (jq -r '.version' package.json 2>/dev/null)
    # Check if python exists locally, use json to check version in package.json
    else if type -q python
      set package_version (python -c "import json; print(json.load(open('package.json'))['version'])" 2>/dev/null)
    # Check if node exists locally, use it to check version of package.json
    else if type -q node
      set package_version (node -p "require('./package.json').version" 2> /dev/null)
    end
  end

  # Check if Cargo.toml exists and cargo command exists
  # THEN use cargo.pkgid and grep to figure out the package
  if test -f ./Cargo.toml; and type -q cargo
    # Handle missing field `version` in Cargo.toml.
    # `cargo pkgid` need Cargo.lock exists too. If it does't, do not show package version
    # https://github.com/denysdovhan/spaceship-prompt/pull/617
    set -l pkgid (cargo pkgid 2>&1)
    # Early return on error
    echo $pkgid | grep -q "error:"; and return

    set package_version (string match -r '#(.*)' $pkgid)[2]
  end

  # # Show package version only when repository is a package
  # [ -f ./package.json ]; or return
  # # Show package version only if npm is installed
  # type -q npm; or return

  # set -l version_line (grep -E '"version": "v?([0-9]+\.){1,}' package.json)
  # set -l package_version (string split \" $version_line)[4]

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
