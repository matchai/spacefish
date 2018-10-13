#
# Tweaked from Markcial's excellent mock library:
# https://github.com/Markcial/mock
#

function mock -a _mock -a exit_code -a code -d "Mock library for fish shell testing"
	set -l blacklisted "builtin" "functions" "eval" "command"

	if contains $_mock $blacklisted
		echo The function '"'$_mock'"' is reserved and therefore cannot be mocked.
		return 1
	else if not contains $_mock $_mocks
		function $_mock -V _mock -V exit_code -V code
			set -l args $argv

			# add mocked function to list
			set -g mocked $_mock $mocked

			# add exit_code variable
			if test -z "$exit_code"
				set exit_code 0
			end

			if test -z "$code"
				set code ""
			end

			eval $code
			return $exit_code
		end
	end
end

function unmock -a _mock
	functions -e $_mock
end
