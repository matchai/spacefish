test "Echoes a line break"
	(
		echo -n -e \n
	) = (__sf_section_line_sep)
end
