#
# Go
#
# Go is an open source programming language that makes it easy
# to build efficient software.
# Link: https://golang.org/

function __sf_section_golang -d "Display the current go version if you're inside GOPATH"
	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__sf_util_set_default SPACEFISH_GOLANG_SHOW true
	__sf_util_set_default SPACEFISH_GOLANG_PREFIX $SPACEFISH_PROMPT_DEFAULT_PREFIX
	__sf_util_set_default SPACEFISH_GOLANG_SUFFIX $SPACEFISH_PROMPT_DEFAULT_SUFFIX
	__sf_util_set_default SPACEFISH_GOLANG_SYMBOL "🐹 "
	__sf_util_set_default SPACEFISH_GOLANG_COLOR cyan

	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	[ $SPACEFISH_GOLANG_SHOW = false ]; and return

	if not test -d Godeps \
		-o -f glide.yaml \
		-o (count *.go) -gt 0 \
		-o ([ -n $GOPATH ]; and string match $GOPATH $PWD)
		return
	end

	if not type -q go
		return
	end

	set -l sf_go_version (go version | awk '{ print substr($3, 3) }')

	__sf_lib_section \
		$SPACEFISH_GOLANG_COLOR \
		$SPACEFISH_GOLANG_PREFIX \
		"$SPACEFISH_GOLANG_SYMBOL"v"$sf_go_version" \
		$SPACEFISH_GOLANG_SUFFIX
end
