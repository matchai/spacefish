source $DIRNAME/spacefish_test_setup.fish

function setup
	spacefish_test_setup
end

test "Time is disabled by default?"
 	() = (__sf_section_time)
end

test "Enabling time! 24-hour by default"
 	(
  set SPACEFISH_TIME_SHOW true

  set_color --bold fff
  echo -n "at "
  set_color normal
  set_color --bold yellow
  echo -n (date '+%H:%M:%S')
  set_color normal
  set_color --bold fff
  echo -n " "
  set_color normal
  ) = (__sf_section_time)
end

test "Enabling time with 12-hour instead"
 	(
  set SPACEFISH_TIME_SHOW true
  set SPACEFISH_TIME_12HR true

  set_color --bold fff
  echo -n "at "
  set_color normal
  set_color --bold yellow
  echo -n (date '+%I:%M:%S')
  set_color normal
  set_color --bold fff
  echo -n " "
  set_color normal
  ) = (__sf_section_time)
end

test "Show the date too"
 	(
  set SPACEFISH_TIME_SHOW true
  set SPACEFISH_DATE_SHOW true

  set_color --bold fff
  echo -n "at "
  set_color normal
  set_color --bold yellow
  echo -n (date '+%Y-%m-%d')
  echo -n " "
  echo -n (date '+%H:%M:%S')
  set_color normal
  set_color --bold fff
  echo -n " "
  set_color normal
  ) = (__sf_section_time)
end

test "Custom date/time format"
 	(
  set SPACEFISH_TIME_SHOW true
  set SPACEFISH_TIME_FORMAT (date '+%H') # Unix timestamp
  set SPACEFISH_TIME_PREFIX "" # Get rid of "at " prefix.

	set_color --bold fff
  set_color normal
  set_color --bold yellow
  echo -n (date '+%H')
  set_color normal
  set_color --bold fff
  echo -n " "
  set_color normal
  ) = (__sf_section_time)
end

test "What is the time? Purple?!"
 	(
  set SPACEFISH_TIME_SHOW true
  set SPACEFISH_TIME_COLOR purple

  set_color --bold fff
  echo -n "at "
  set_color normal
  set_color --bold purple
  echo -n (date '+%H:%M:%S')
  set_color normal
  set_color --bold fff
  echo -n " "
  set_color normal
  ) = (__sf_section_time)
end
