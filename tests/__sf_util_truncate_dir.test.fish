set path /tmp/$DIRNAME/$TESTNAME

function setup
	mkdir -p $path/temp1/temp2/temp3
	cd $path/temp1/temp2/temp3
end

function teardown
	rm -rf $path
end

test "Truncate path to 1 directory"
	'temp3' = (
		__sf_util_truncate_dir (pwd) 1
	)
end

test "Truncate path to 3 directories"
	'temp1/temp2/temp3' = (
		__sf_util_truncate_dir (pwd) 3
	)
end

test "Don't truncate path"
	(pwd) = (
		__sf_util_truncate_dir (pwd) 0
	)
end
