set path /tmp/$filename

function setup
	mkdir -p $path/temp1/temp2/temp3
	cd $path/temp1/temp2/temp3
end

function teardown
	rm -rf $path
end

@test "Truncate path to 1 directory" (
	__sf_util_truncate_dir (pwd) 1
) = 'temp3'

@test "Truncate path to 3 directories" (
	__sf_util_truncate_dir (pwd) 3
) = 'temp1/temp2/temp3'

@test "Don't truncate path" (
	__sf_util_truncate_dir (pwd) 0
) = (pwd)
