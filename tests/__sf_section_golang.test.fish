source $DIRNAME/spacefish_test_setup.fish

function setup
	spacefish_test_setup
	mock go version 0 "echo \"go version go1.10.3 darwin/amd64\""
	mkdir -p /tmp/tmp-spacefish
	cd /tmp/tmp-spacefish
end

function teardown
	rm -rf /tmp/tmp-spacefish
end

test "Prints section when Godeps is present"
	(
		mkdir /tmp/tmp-spacefish/Godeps

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold cyan
		echo -n "🐹 v1.10.3"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_golang)
end

test "Prints section when glide.yaml is present"
	(
		touch /tmp/tmp-spacefish/glide.yaml

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold cyan
		echo -n "🐹 v1.10.3"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_golang)
end

test "Prints section when Gopkg.yml is present"
	(
		touch /tmp/tmp-spacefish/Gopkg.yml

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold cyan
		echo -n "🐹 v1.10.3"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_golang)
end

test "Prints section when Gopkg.lock is present"
	(
		touch /tmp/tmp-spacefish/Gopkg.lock

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold cyan
		echo -n "🐹 v1.10.3"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_golang)
end

test "Prints section when go.mod is present"
	(
		touch /tmp/tmp-spacefish/go.mod

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold cyan
		echo -n "🐹 v1.10.3"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_golang)
end

test "Print section when using development version of golang"
	(
		mock go version 0 "echo go version devel +5efe9a8f11 Wed Jan 9 07:21:16 2019 +0000 darwin/amd64"
		touch /tmp/tmp-spacefish/Gopkg.lock

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold cyan
		echo -n "🐹 devel:5efe9a8f11"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_golang)
end

test "Doesn't print the section when golang files aren't present"
	() = (__sf_section_golang)
end

test "Changing SPACEFISH_GOLANG_SYMBOL changes the displayed character"
	(
		touch /tmp/tmp-spacefish/Gopkg.lock
		set SPACEFISH_GOLANG_SYMBOL "· "

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold cyan
		echo -n "· v1.10.3"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_golang)
end

test "Changing SPACEFISH_GOLANG_PREFIX changes the character prefix"
	(
		touch /tmp/tmp-spacefish/Gopkg.lock
		set sf_exit_code 0
		set SPACEFISH_GOLANG_PREFIX ·

		set_color --bold
		echo -n "·"
		set_color normal
		set_color --bold cyan
		echo -n "🐹 v1.10.3"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_golang)
end

test "Changing SPACEFISH_GOLANG_SUFFIX changes the character suffix"
	(
		touch /tmp/tmp-spacefish/Gopkg.lock
		set sf_exit_code 0
		set SPACEFISH_GOLANG_SUFFIX ·

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold cyan
		echo -n "🐹 v1.10.3"
		set_color normal
		set_color --bold
		echo -n "·"
		set_color normal
	) = (__sf_section_golang)
end

test "doesn't display the section when SPACEFISH_GOLANG_SHOW is set to \"false\""
	(
		touch /tmp/tmp-spacefish/Gopkg.lock
		set SPACEFISH_GOLANG_SHOW false
	) = (__sf_section_golang)
end
