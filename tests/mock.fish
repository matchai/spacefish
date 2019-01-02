#
#   Usage
#     mock <command> <argument> <exit code> [executed code]
#
#   Arguments
#     command        The command you would like to have mocked
#     argument       The argument the mock should apply to ('*' defines a fallback for all arguments)
#     exit code      The exit code returned when the command executes
#     executed code  Code to be executed when the command is called with the given argument
#
#   Examples
#     mock git pull 0 "echo This command successfully echoes"
#     mock git push 1 "echo This command fails with status 1"
#     mock git \* 0 "echo This command acts as a fallback to all git commands"
#
#   Many mocks can be applied to the same command at the same time, with different arguments.
#   Be sure to escape the asterisk symbol when using it as a fallback (\*)
#

function mock -a cmd -a argument -a exit_code -a executed_code -d "Mock library for fish shell testing"
	set -l cmd_blacklist "builtin" "functions" "eval" "command" "argparse" "read" "set" "status" "test"

	if contains $cmd $cmd_blacklist
		echo The function '"'$cmd'"' is reserved and therefore cannot be mocked.
		return 1
	end

	if not contains $cmd $_mocked
		# Generate variable with all mocked functions
		set -g _mocked $cmd $_mocked
	end

	set -l mocked_args "_mocked_"$cmd"_args"
	if not contains -- $argument $$mocked_args
		# Generate variable with all mocked arguments
		set -g $mocked_args $argument $$mocked_args
	end

	# Create a function for that command and argument combination
	set -l mocked_fn
	if test $argument = '*'
		set mocked_fn "mocked_"$cmd"_fn"
	else
		set mocked_fn "mocked_"$cmd"_fn_"$argument
	end
	function $mocked_fn -V exit_code -V executed_code
		eval $executed_code
		return $exit_code
	end

	function $cmd -V cmd -V mocked_args
		# Call the mocked function created above
		if contains -- $argv[1] $$mocked_args
			set -l fn_name "mocked_"$cmd"_fn_"$argv[1]
			eval $fn_name
			return $status
		end

		# Fallback on runnning the original command
		set -l mocked_fn "mocked_"$cmd"_fn"
		if type -q $mocked_fn
			eval $mocked_fn
		else
			eval command $cmd $argv
		end
	end

	function unmock -a cmd
		functions -e $cmd
		set -l mocked_args "_mocked_"$cmd"_args"
		functions -e "mocked_"$cmd"_fn_"{$$mocked_args}
		set -e $mocked_args
		set _mocked (string match -v $cmd $_mocked)
		return 0
	end
end
