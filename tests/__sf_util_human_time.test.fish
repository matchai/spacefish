test "Shows milliseconds"
	'1ms' = (
		echo 1 | __sf_util_human_time my_var
	)
end

test "Shows seconds"
	'1s' = (
		echo 1000 | __sf_util_human_time my_var
	)
end

test "Shows seconds and milliseconds"
	'1s 1ms' = (
		echo 1001 | __sf_util_human_time my_var
	)
end

test "Shows minutes"
	'1m' = (
		echo 60000 | __sf_util_human_time my_var
	)
end

test "Shows minutes and milliseconds"
	'1m 1ms' = (
		echo 60001 | __sf_util_human_time my_var
	)
end

test "Shows minutes and seconds"
	'1m 1s' = (
		echo 61000 | __sf_util_human_time my_var
	)
end

test "Shows minutes, seconds, and milliseconds"
	'1m 1s 1ms' = (
		echo 61001 | __sf_util_human_time my_var
	)
end

test "Shows hours"
	'1h' = (
		echo 3600000 | __sf_util_human_time my_var
	)
end

test "Shows hours and milliseconds"
	'1h 1ms' = (
		echo 3600001 | __sf_util_human_time my_var
	)
end

test "Shows hours and seconds"
	'1h 1s' = (
		echo 3601000 | __sf_util_human_time my_var
	)
end

test "Shows hours, seconds, and milliseconds"
	'1h 1s 1ms' = (
		echo 3601001 | __sf_util_human_time my_var
	)
end

test "Shows hours and minutes"
	'1h 1m' = (
		echo 3660000 | __sf_util_human_time my_var
	)
end

test "Shows hours, minutes, and milliseconds"
	'1h 1m 1ms' = (
		echo 3660001 | __sf_util_human_time my_var
	)
end

test "Shows hours, minutes, and seconds"
	'1h 1m 1s' = (
		echo 3661000 | __sf_util_human_time my_var
	)
end

test "Shows hours, minutes, seconds, and milliseconds"
	'1h 1m 1s 1ms' = (
		echo 3661001 | __sf_util_human_time my_var
	)
end
