#
# Rust
#
# Rust is a systems programming language sponsored by Mozilla Research.
# Link: https://www.rust-lang.org

function __sf_section_rust -d "Display the current Rust version"
	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__sf_util_set_default SPACEFISH_RUST_SHOW true
	__sf_util_set_default SPACEFISH_RUST_PREFIX $SPACEFISH_PROMPT_DEFAULT_PREFIX
	__sf_util_set_default SPACEFISH_RUST_SUFFIX $SPACEFISH_PROMPT_DEFAULT_SUFFIX
	__sf_util_set_default SPACEFISH_RUST_SYMBOL "𝗥 "
	__sf_util_set_default SPACEFISH_RUST_COLOR red
	__sf_util_set_default SPACEFISH_RUST_VERBOSE_VERSION false

	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	[ $SPACEFISH_RUST_SHOW = false ]; and return

	if not test -f Cargo.toml \
		-o (count *.rs) -gt 0
		return
	end

	if not type -q rustc
		return
	end

	set -l rust_version (rustc --version | cut -d' ' -f2)

	if test $SPACEFISH_RUST_VERBOSE_VERSION = false
        set rust_version (echo $rust_version | cut -d'-' -f1) # Cut off -suffixes from version. "v1.30.0-beta.11" or "v1.30.0-nightly"
	end

	__sf_lib_section \
		$SPACEFISH_RUST_COLOR \
		$SPACEFISH_RUST_PREFIX \
		"$SPACEFISH_RUST_SYMBOL"v"$rust_version" \
		$SPACEFISH_RUST_SUFFIX
end
