# TODO: Test me
# Time
#

function __sf_section_time -d "Display the current time!"
    # ------------------------------------------------------------------------------
    # Configuration
    # ------------------------------------------------------------------------------

    __sf_util_set_default SPACEFISH_TIME_SHOW false
    __sf_util_set_default SPACEFISH_TIME_PREFIX "at "
    __sf_util_set_default SPACEFISH_TIME_SUFFIX $SPACEFISH_PROMPT_DEFAULT_SUFFIX
    __sf_util_set_default SPACEFISH_TIME_FORMAT false
    __sf_util_set_default SPACEFISH_TIME_12HR false
    __sf_util_set_default SPACEFISH_TIME_COLOR "yellow"

    # ------------------------------------------------------------------------------
    # Section
    # ------------------------------------------------------------------------------

    [ $SPACEFISH_TIME_SHOW = true ]; and return

    if test $SPACEFISH_TIME_FORMAT not = false;
      time_str $SPACEFISH_TIME_FORMAT
    elif $SPACEFISH_TIME_12HR = true;
      set time_str "%D{%r}"
    else
      set time_str "%D{%T}"
    end

    __sf_lib_section \
      $SPACEFISH_TIME_COLOR \
      $SPACEFISH_TIME_PREFIX \
      $time_str \
      $SPACEFISH_TIME_SUFFIX

end