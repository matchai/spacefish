# TODO: Test me
# Jobs
#

function __sf_section_jobs -d "Show icon, if there's a working jobs in the background."
    # ------------------------------------------------------------------------------
    # Configuration
    # ------------------------------------------------------------------------------

    # --------------------------------------------------------------------------
    # | SPACEFISH_HOST_SHOW | show hostname on local | show hostname on remote |
    # |---------------------+------------------------+-------------------------|
    # | false               | test_me                | test_me                 |
    # | always              | test_me                | test_me                 |
    # | true                | test_me                | test_me                 |
    # | needed              | test_me                | test_me                 |
    # --------------------------------------------------------------------------

    __sf_util_set_default SPACEFISH_JOBS_SHOW SPACEFISH_JOBS_SHOW true
    __sf_util_set_default SPACEFISH_JOBS_PREFIX SPACEFISH_JOBS_PREFIX ""
    __sf_util_set_default SPACEFISH_JOBS_SUFFIX SPACEFISH_JOBS_SUFFIX " "
    __sf_util_set_default SPACEFISH_JOBS_SYMBOL SPACEFISH_JOBS_SYMBOL "✦"
    __sf_util_set_default SPACEFISH_JOBS_COLOR SPACEFISH_JOBS_COLOR "blue"
    __sf_util_set_default SPACEFISH_JOBS_AMOUNT_PREFIX SPACEFISH_JOBS_AMOUNT_PREFIX ""
    __sf_util_set_default SPACEFISH_JOBS_AMOUNT_SUFFIX SPACEFISH_JOBS_AMOUNT_SUFFIX ""

    # ------------------------------------------------------------------------------
    # Section
    # ------------------------------------------------------------------------------

    [ $SPACEFISH_JOBS_SHOW = false ]; and return

    set jobs_amount (jobs | awk '!/pwd/' | wc -l | tr -d)" " # Zsh had jobs -d, but -d was apparently an invalid flag. Zsh only?

    [ $jobs_amount -gt 0 ]; or return

    if $jobs_amount -eq 1
        jobs_amount=''
        SPACEFISH_JOBS_AMOUNT_PREFIX=''
        SPACEFISH_JOBS_AMOUNT_SUFFIX=''
    end

    set SPACEFISH_JOBS_SECTION $SPACEFISH_JOBS_SYMBOL$SPACEFISH_JOBS_AMOUNT_PREFIX$jobs_amount$SPACEFISH_JOBS_AMOUNT_SUFFIX

    __sf_lib_section \
        $SPACEFISH_JOBS_COLOR \
        $SPACEFISH_JOBS_PREFIX \
        $SPACESHIP_JOBS_SECTION \
        $SPACEFISH_JOBS_SUFFIX

end