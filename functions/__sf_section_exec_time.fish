function __sf_section_exec_time -a prefix_color -a duration_color
	set -l command_duration

	if test -n $CMD_DURATION -a $CMD_DURATION -gt 5000
		set command_duration (echo $CMD_DURATION | __sf_util_human_time)
		echo -s -n (set_color $prefix_color) "took " (set_color $duration_color) $command_duration
	end
end
