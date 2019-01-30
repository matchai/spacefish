source $DIRNAME/spacefish_test_setup.fish

function setup
	spacefish_test_setup
	mock swift --version 0 "echo \"Apple Swift version 4.2.1 (swiftlang-1000.11.42 clang-1000.11.45.1)\""
	mkdir -p /tmp/tmp-spacefish
	cd /tmp/tmp-spacefish
end

function teardown
	rm -rf /tmp/tmp-spacefish
end

test "Prints section when swift package is present"
	(
		touch /tmp/tmp-spacefish/Package.swift

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold cyan
		echo -n "🦜 4.2.1"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_swift)
end

test "Doesn't print the section when no swift is present"
	() = (__sf_section_swift)
end

test "Changing SPACEFISH_SWIFT_SYMBOL changes the displayed character"
	(
		touch /tmp/tmp-spacefish/Package.swift
		set SPACEFISH_SWIFT_SYMBOL "· "

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold cyan
		echo -n "· 4.2.1"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_swift)
end

test "Changing SPACEFISH_SWIFT_PREFIX changes the character prefix"
	(
		touch /tmp/tmp-spacefish/Package.swift
		set sf_exit_code 0
		set SPACEFISH_SWIFT_PREFIX ·

		set_color --bold
		echo -n "·"
		set_color normal
		set_color --bold cyan
		echo -n "🦜 4.2.1"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_swift)
end

test "Changing SPACEFISH_SWIFT_SUFFIX changes the character suffix"
	(
		touch /tmp/tmp-spacefish/Package.swift
		set sf_exit_code 0
		set SPACEFISH_SWIFT_SUFFIX ·

		set_color --bold
		echo -n "via "
		set_color normal
		set_color --bold cyan
		echo -n "🦜 4.2.1"
		set_color normal
		set_color --bold
		echo -n "·"
		set_color normal
	) = (__sf_section_swift)
end

test "doesn't display the section when SPACEFISH_SWIFT_SHOW is set to \"false\""
	(
		touch /tmp/tmp-spacefish/Package.swift
		set SPACEFISH_SWIFT_SHOW false
	) = (__sf_section_swift)
end
