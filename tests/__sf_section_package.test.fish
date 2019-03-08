source $DIRNAME/spacefish_test_setup.fish

function setup
	spacefish_test_setup
	mock cargo pkgid 0 "echo \"file:///Users/sirMerr/Development/test-rust#0.1.0\""
	mkdir -p /tmp/tmp-spacefish
	cd /tmp/tmp-spacefish
end

function teardown
	rm -rf /tmp/tmp-spacefish
end

test "Prints section when Cargo.toml is present"
	(
		touch /tmp/tmp-spacefish/Cargo.toml

		set_color --bold
		echo -n "is "
		set_color normal
		set_color --bold red
		echo -n "📦 v0.1.0"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_package)
end

test "Prints section when package.json is present"
	(
		echo "{\"version\": \"1.0\"}" > /tmp/tmp-spacefish/package.json

		set_color --bold
		echo -n "is "
		set_color normal
		set_color --bold red
		echo -n "📦 v1.0"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_package)
end

test "Changing SPACEFISH_PACKAGE_SUFFIX changes the character suffix"
	(
		touch /tmp/tmp-spacefish/Cargo.toml
		set SPACEFISH_PACKAGE_SUFFIX ·

		set_color --bold
		echo -n "is "
		set_color normal
		set_color --bold red
		echo -n "📦 v0.1.0"
		set_color normal
		set_color --bold
		echo -n "·"
		set_color normal
	) = (__sf_section_package)
end

test "Does not print section when Cargo.toml or package.json is not present"
	() = (__sf_section_package)
end

test "Doesn't display the section when SPACEFISH_PACKAGE_SHOW is set to \"false\""
	(
		touch /tmp/tmp-spacefish/Cargo.toml
		set SPACEFISH_PACKAGE_SHOW false
	) = (__sf_section_package)
end
