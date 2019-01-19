source $DIRNAME/spacefish_test_setup.fish

function setup
    spacefish_test_setup
    mock julia --version 0 "echo \"julia version 1.0.1\""
    mkdir -p /tmp/tmp-spacefish
    cd /tmp/tmp-spacefish
end

function teardown
    rm -rf /tmp/tmp-spacefish
end

test "Prints section when julia is installed and pwd has *.jl file(s)"
	(
		touch some-julia-file.jl

		set_color --bold
		echo -n "is "
		set_color normal
		set_color --bold green
		echo -n "ஃ v1.0.1"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_julia)
end

test "Changing SPACEFISH_JULIA_SYMBOL changes the displayed character"
	(
		set SPACEFISH_JULIA_SYMBOL "· "
		touch some-julia-file.jl

		set_color --bold
		echo -n "is "
		set_color normal
		set_color --bold green
		echo -n "· v1.0.1"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_julia)
end

test "Changing SPACEFISH_JULIA_PREFIX changes the character prefix"
	(
		set SPACEFISH_JULIA_PREFIX ·
		touch some-julia-file.jl

		set_color --bold
		echo -n "·"
		set_color normal
		set_color --bold green
		echo -n "ஃ v1.0.1"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_julia)
end

test "Changing SPACEFISH_JULIA_SUFFIX changes the character suffix"
	(
		set SPACEFISH_JULIA_SUFFIX ·
		touch some-julia-file.jl

		set_color --bold
		echo -n "is "
		set_color normal
		set_color --bold green
		echo -n "ஃ v1.0.1"
		set_color normal
		set_color --bold
		echo -n "·"
		set_color normal
	) = (__sf_section_julia)
end


# Negative
test "Doesn't display section when SPACEFISH_JULIA_SHOW is set to 'false'"
	(
		set -g SPACEFISH_JULIA_SHOW false
		touch some-julia-file.jl

	) = (__sf_section_julia)
end

test "Doesn't display section when pwd has no *.jl file"
	() = (__sf_section_julia)
end
