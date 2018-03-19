source $DIRNAME/../functions/__sf_section_char.fish

test "Display default char with status code 0"
	(
		set -g sf_exit_code 0

		set_color --bold green
		echo -n ➜
		set_color normal
	) = (__sf_section_char)
end

test "Display default char with status code 1"
	(
		set -g sf_exit_code 1

		set_color --bold red
		echo -n ➜
		set_color normal
	) = (__sf_section_char)
end
