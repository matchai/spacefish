source $DIRNAME/spacefish_test_setup.fish

function setup
	spacefish_test_setup
end

test "Test a single background job"
 	(
     sleep 10 & # Background process

     set_color --bold fff
     set_color normal
     set_color --bold blue
     echo -n "✦"
     set_color normal
 		 set_color --bold fff
 		 echo -n " "
 		 set_color normal
 	) = (__sf_section_jobs)
end

test "Test with two background jobs"
 	(
     killall sleep # Kill any previous background jobs

     sleep 10 & # Background process #1
     sleep 10 & # Background process #2

     set_color --bold fff
     set_color normal
     set_color --bold blue
     echo -n "✦2"
     set_color normal
 		 set_color --bold fff
 		 echo -n " "
 		 set_color normal
 	) = (__sf_section_jobs)
end

test "Test with five background jobs"
 	(
     killall sleep # Kill any previous background jobs

     sleep 10 & # Background process #1
     sleep 10 & # Background process #2
     sleep 10 & # Background process #3
     sleep 10 & # Background process #4
     sleep 10 & # Background process #5

     set_color --bold fff
     set_color normal
     set_color --bold blue
     echo -n "✦5"
     set_color normal
 		 set_color --bold fff
 		 echo -n " "
 		 set_color normal
 	) = (__sf_section_jobs)
end

test "Test with less than threshold of background jobs"
 	(
     killall sleep # Kill any previous background jobs

     set SPACEFISH_JOBS_AMOUNT_THRESHOLD 4

     sleep 10 & # Background process #1
     sleep 10 & # Background process #2
     sleep 10 & # Background process #3

     set_color --bold fff
     set_color normal
     set_color --bold blue
     echo -n "✦"
     set_color normal
 		 set_color --bold fff
 		 echo -n " "
 		 set_color normal
 	) = (__sf_section_jobs)
end

test "Test with equal threshold of background jobs"
 	(
     killall sleep # Kill any previous background jobs

     set SPACEFISH_JOBS_AMOUNT_THRESHOLD 4

     sleep 10 & # Background process #1
     sleep 10 & # Background process #2
     sleep 10 & # Background process #3
     sleep 10 & # Background process #4

     set_color --bold fff
     set_color normal
     set_color --bold blue
     echo -n "✦"
     set_color normal
 		 set_color --bold fff
 		 echo -n " "
 		 set_color normal
 	) = (__sf_section_jobs)
end

test "Test with more than threshold of background jobs"
 	(
     killall sleep # Kill any previous background jobs

     set SPACEFISH_JOBS_AMOUNT_THRESHOLD 4

     sleep 10 & # Background process #1
     sleep 10 & # Background process #2
     sleep 10 & # Background process #3
     sleep 10 & # Background process #4
     sleep 10 & # Background process #5
     sleep 10 & # Background process #6

     set_color --bold fff
     set_color normal
     set_color --bold blue
     echo -n "✦6"
     set_color normal
 		 set_color --bold fff
 		 echo -n " "
 		 set_color normal
 	) = (__sf_section_jobs)
end
