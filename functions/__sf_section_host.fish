# TODO: Test me
# Hostname
#

function __sf_section_host -d "Display the current hostname if connected over SSH"

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

  __sf_util_set_default SPACEFISH_HOST_SHOW true
  __sf_util_set_default SPACEFISH_HOST_SHOW_FULL false
  __sf_util_set_default SPACEFISH_HOST_PREFIX "at "
  __sf_util_set_default SPACEFISH_HOST_SUFFIX $SPACEFISH_PROMPT_DEFAULT_SUFFIX
  __sf_util_set_default SPACEFISH_HOST_COLOR "blue"
  __sf_util_set_default SPACEFISH_HOST_COLOR_SSH "green"

  # ------------------------------------------------------------------------------
  # Section
  # ------------------------------------------------------------------------------

  [ "$SPACEFISH_HOST_SHOW" = false ]; and return

  if test $SPACEFISH_HOST_SHOW = 'always'; or set -q SSH_CONNECTION;
    set host_color host

    # Determination of what color should be used
    if set -q SSH_CONNECTION;
      set host_color $SPACEFISH_HOST_COLOR_SSH
    else
      set host_color $SPACEFISH_HOST_COLOR
    end

    set host (hostname)

    __sf_lib_section \
      $host_color \
      $SPACEFISH_HOST_PREFIX \
      $host \
      $SPACEFISH_HOST_SUFFIX
      
    end
end
