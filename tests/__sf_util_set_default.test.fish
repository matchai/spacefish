source $DIRNAME/../functions/__sf_util_set_default.fish

test "set variable"
	'default_value' = (
		__sf_util_set_default my_var 'default_value'
		echo $my_var
	)
end

test "skip setting variable if already set"
	'default_value' = (
		__sf_util_set_default my_var 'default_value'
		__sf_util_set_default my_var 'another_value'
		echo $my_var
	)
end
