source $DIRNAME/spacefish_test_setup.fish
source $DIRNAME/mock.fish

function setup
	spacefish_test_setup
	mock go 0 "echo \"go version go1.10.3 darwin/amd64\""
	mkdir -p /tmp/tmp-spacefish/Godeps
	cd /tmp/tmp-spacefish
end

function teardown
	rm -rf /tmp/tmp-spacefish
end

test "Prints section when Godeps is present"
	(
		set_color --bold fff
		echo -n "via "
		set_color normal
		set_color --bold cyan
		echo -n "🐹 v1.10.3"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_golang)
end

test "Prints section when glide.yaml is present"
	(
		rm -rf /tmp/tmp-spacefish/Godeps
		touch /tmp/tmp-spacefish/glide.yaml

		set_color --bold fff
		echo -n "via "
		set_color normal
		set_color --bold cyan
		echo -n "🐹 v1.10.3"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_golang)
end

test "Prints section when Gopkg.yml is present"
	(
		rm -rf /tmp/tmp-spacefish/Godeps
		touch /tmp/tmp-spacefish/Gopkg.yml

		set_color --bold fff
		echo -n "via "
		set_color normal
		set_color --bold cyan
		echo -n "🐹 v1.10.3"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_golang)
end

test "Prints section when Gopkg.lock is present"
	(
		rm -rf /tmp/tmp-spacefish/Godeps
		touch /tmp/tmp-spacefish/Gopkg.lock

		set_color --bold fff
		echo -n "via "
		set_color normal
		set_color --bold cyan
		echo -n "🐹 v1.10.3"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_golang)
end

test "Doesn't print the section when golang files aren't present"
	(
		rm -rf /tmp/tmp-spacefish/Godeps
	) = (__sf_section_golang)
end

test "Changing SPACEFISH_GOLANG_SYMBOL changes the displayed character"
	(
		set SPACEFISH_GOLANG_SYMBOL "· "

		set_color --bold fff
		echo -n "via "
		set_color normal
		set_color --bold cyan
		echo -n "· v1.10.3"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_golang)
end

test "Changing SPACEFISH_GOLANG_PREFIX changes the character prefix"
	(
		set sf_exit_code 0
		set SPACEFISH_GOLANG_PREFIX ·

		set_color --bold fff
		echo -n "·"
		set_color normal
		set_color --bold cyan
		echo -n "🐹 v1.10.3"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_golang)
end

test "Changing SPACEFISH_GOLANG_SUFFIX changes the character prefix"
	(
		set sf_exit_code 0
		set SPACEFISH_GOLANG_SUFFIX ·

		set_color --bold fff
		echo -n "via "
		set_color normal
		set_color --bold cyan
		echo -n "🐹 v1.10.3"
		set_color normal
		set_color --bold fff
		echo -n "·"
		set_color normal
	) = (__sf_section_golang)
end

test "Doesn't display node when SPACEFISH_GOLANG_SHOW is set to 'false'"
	(
		set SPACEFISH_GOLANG_SHOW false
	) = (__sf_section_golang)
end

