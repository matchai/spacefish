source $DIRNAME/spacefish_test_setup.fish
source $DIRNAME/mock.fish

function setup
	spacefish_test_setup
	mock rustc 0 "echo \"rustc 1.28.0-nightly (9634041f0 2018-07-30)\""
	mkdir -p /tmp/tmp-spacefish
	touch /tmp/tmp-spacefish/Cargo.toml
	cd /tmp/tmp-spacefish
end

function teardown
	rm -rf /tmp/tmp-spacefish
end

test "Prints section when Cargo.toml is present"
	(
		set_color --bold fff
		echo -n "via "
		set_color normal
		set_color --bold red
		echo -n "𝗥 v1.28.0"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_rust)
end

test "Prints section when a *.rs file is present"
	(
		rm -rf /tmp/tmp-spacefish/Cargo.toml
		touch /tmp/tmp-spacefish/testfile.rs

		set_color --bold fff
		echo -n "via "
		set_color normal
		set_color --bold red
		echo -n "𝗥 v1.28.0"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_rust)
end

test "Doesn't print the section when Cargo.toml and *.rs aren't present"
	(
		rm -rf /tmp/tmp-spacefish/Cargo.toml
	) = (__sf_section_rust)
end

test "Changing SPACEFISH_RUST_SYMBOL changes the displayed character"
	(
		set SPACEFISH_RUST_SYMBOL "· "

		set_color --bold fff
		echo -n "via "
		set_color normal
		set_color --bold red
		echo -n "· v1.28.0"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_rust)
end

test "Changing SPACEFISH_RUST_PREFIX changes the character prefix"
	(
		set sf_exit_code 0
		set SPACEFISH_RUST_PREFIX ·

		set_color --bold fff
		echo -n "·"
		set_color normal
		set_color --bold red
		echo -n "𝗥 v1.28.0"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_rust)
end

test "Changing SPACEFISH_RUST_SUFFIX changes the character prefix"
	(
		set sf_exit_code 0
		set SPACEFISH_RUST_SUFFIX ·

		set_color --bold fff
		echo -n "via "
		set_color normal
		set_color --bold red
		echo -n "𝗥 v1.28.0"
		set_color normal
		set_color --bold fff
		echo -n "·"
		set_color normal
	) = (__sf_section_rust)
end

test "Prints verbose version when configured to do so"
	(
		touch /tmp/tmp-spacefish/testfile.rs
        set SPACEFISH_RUST_VERBOSE_VERSION true

		set_color --bold fff
		echo -n "via "
		set_color normal
		set_color --bold red
		echo -n "𝗥 v1.28.0-nightly"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_rust)
end

test "Doesn't display node when SPACEFISH_RUST_SHOW is set to 'false'"
	(
		set SPACEFISH_RUST_SHOW false
	) = (__sf_section_rust)
end

