source ./spacefish_test_setup.fish

function setup
	spacefish_test_setup
	mock go version 0 "echo \"go version go1.10.3 darwin/amd64\""
	mkdir -p /tmp/$filename
	cd /tmp/$filename
end

function teardown
	rm -rf /tmp/$filename
end

@test "Prints section when Godeps is present" (
		mkdir /tmp/$filename/Godeps

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

@test "Prints section when glide.yaml is present" (
		touch /tmp/$filename/glide.yaml

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

@test "Prints section when Gopkg.yml is present" (
		touch /tmp/$filename/Gopkg.yml

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

@test "Prints section when Gopkg.lock is present" (
		touch /tmp/$filename/Gopkg.lock

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

@test "Prints section when go.mod is present" (
		touch /tmp/$filename/go.mod

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

@test "Print section when using development version of golang" (
		mock go version 0 "echo go version devel +5efe9a8f11 Wed Jan 9 07:21:16 2019 +0000 darwin/amd64"
		touch /tmp/$filename/Gopkg.lock

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

@test "Doesn't print the section when golang files aren't present" () = (__sf_section_golang)

@test "Changing SPACEFISH_GOLANG_SYMBOL changes the displayed character" (
		touch /tmp/$filename/Gopkg.lock
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

@test "Changing SPACEFISH_GOLANG_PREFIX changes the character prefix" (
		touch /tmp/$filename/Gopkg.lock
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

@test "Changing SPACEFISH_GOLANG_SUFFIX changes the character suffix" (
		touch /tmp/$filename/Gopkg.lock
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

@test "doesn't display the section when SPACEFISH_GOLANG_SHOW is set to \"false\"" (
		touch /tmp/$filename/Gopkg.lock
		set SPACEFISH_GOLANG_SHOW false
) = (__sf_section_golang)
