function __sf_util_set_default -a var
	if not set -q $var
		# Multiple arguments will become a list
		set -g $var $argv[2..-1]
	end
end
