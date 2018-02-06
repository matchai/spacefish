#
# Execution time
#

function __sf_section_exec_time -d "Display the execution time of the last command"
	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__sf_util_set_default SPACEFISH_EXEC_TIME_SHOW true
	__sf_util_set_default SPACEFISH_EXEC_TIME_PREFIX "took "
	__sf_util_set_default SPACEFISH_EXEC_TIME_SUFFIX $SPACEFISH_PROMPT_DEFAULT_SUFFIX
	__sf_util_set_default SPACEFISH_EXEC_TIME_COLOR (set_color yellow)
	__sf_util_set_default SPACEFISH_EXEC_TIME_ELAPSED 2

	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	if test $SPACEFISH_EXEC_TIME_SHOW = false
		return
	end

	if test -n $CMD_DURATION -a $CMD_DURATION -gt (math "$SPACEFISH_EXEC_TIME_ELAPSED * 1000")
		set -l command_duration (echo $CMD_DURATION | __sf_util_human_time)
		echo -e -n -s \
		(set_color ffffff) \
		$SPACEFISH_EXEC_TIME_PREFIX \
		$SPACEFISH_EXEC_TIME_COLOR \
		$command_duration \
		$SPACESHIP_EXEC_TIME_SUFFIX
	end
end
