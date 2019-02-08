@test "Shows milliseconds" (echo 1 | __sf_util_human_time my_var) = '1ms'

@test "Shows seconds" (echo 1000 | __sf_util_human_time my_var) = '1s'

@test "Shows seconds and milliseconds" (echo 1001 | __sf_util_human_time my_var) = '1s 1ms'

@test "Shows minutes" (echo 60000 | __sf_util_human_time my_var) = '1m'

@test "Shows minutes and milliseconds" (echo 60001 | __sf_util_human_time my_var) = '1m 1ms'

@test "Shows minutes and seconds" (echo 61000 | __sf_util_human_time my_var) = '1m 1s'

@test "Shows minutes, seconds, and milliseconds" (echo 61001 | __sf_util_human_time my_var) = '1m 1s 1ms'

@test "Shows hours" (echo 3600000 | __sf_util_human_time my_var) = '1h'

@test "Shows hours and milliseconds" (echo 3600001 | __sf_util_human_time my_var) = '1h 1ms'

@test "Shows hours and seconds" (echo 3601000 | __sf_util_human_time my_var) = "1h 1s"

@test "Shows hours, seconds, and milliseconds" (echo 3601001 | __sf_util_human_time my_var) = '1h 1s 1ms'

@test "Shows hours and minutes" (echo 3660000 | __sf_util_human_time my_var) = '1h 1m'

@test "Shows hours, minutes, and milliseconds" (echo 3660001 | __sf_util_human_time my_var) = '1h 1m 1ms'

@test "Shows hours, minutes, and seconds" (echo 3661000 | __sf_util_human_time my_var) = '1h 1m 1s'

@test "Shows hours, minutes, seconds, and milliseconds" (echo 3661001 | __sf_util_human_time my_var) = '1h 1m 1s 1ms'
