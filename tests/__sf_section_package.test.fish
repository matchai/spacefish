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
