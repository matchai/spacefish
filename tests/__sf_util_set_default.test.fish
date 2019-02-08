@test "Sets a variable" (
	__sf_util_set_default my_var 'default_value'
	echo $my_var
) = 'default_value'

@test "Skips setting a variable if one is already set" (
	__sf_util_set_default my_var 'default_value'
	__sf_util_set_default my_var 'another_value'
	echo $my_var
) = 'default_value'
