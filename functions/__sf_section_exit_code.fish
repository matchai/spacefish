# TODO: Test me
# Exit-code
#

function __sf_section_exit_code -d "Shows the exit code from the previous command."
    # ------------------------------------------------------------------------------
    # Configuration
    # ------------------------------------------------------------------------------

    __sf_util_set_default SPACEFISH_EXIT_CODE_SHOW SPACEFISH_EXIT_CODE_SHOW false
    __sf_util_set_default SPACEFISH_EXIT_CODE_PREFIX SPACEFISH_EXIT_CODE_PREFIX ""
    __sf_util_set_default SPACEFISH_EXIT_CODE_SUFFIX SPACEFISH_EXIT_CODE_SUFFIX " "
    __sf_util_set_default SPACEFISH_EXIT_CODE_SYMBOL SPACEFISH_EXIT_CODE_SYMBOL "✘"
    __sf_util_set_default SPACEFISH_EXIT_CODE_COLOR SPACEFISH_EXIT_CODE_COLOR "red"

    # ------------------------------------------------------------------------------
    # Section
    # ------------------------------------------------------------------------------

    [ $SPACEFISH_EXIT_CODE_SHOW = false; or $sf_exit_code -eq 0 ]; and return # I hope this works. Todo: Please test this funky line. Fish uses $status instead of $RETVAL.

    __sf_lib_section \
      $SPACEFISH_EXIT_CODE_COLOR \
      $SPACEFISH_EXIT_CODE_PREFIX \
      (SPACEFISH_EXIT_CODE_SYMBOL)$status \
      $SPACEFISH_EXIT_CODE_SUFFIX
end