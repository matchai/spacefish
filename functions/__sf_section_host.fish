#
# Hostname
#

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

set SPACEFISH_HOST_SHOW true
set SPACEFISH_HOST_SHOW_FULL false
set SPACEFISH_HOST_PREFIX "at "
set SPACEFISH_HOST_SUFFIX $SPACEFISH_PROMPT_DEFAULT_SUFFIX
set SPACEFISH_HOST_COLOR "blue"
set SPACEFISH_HOST_COLOR_SSH "green"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# If there is an ssh connections, current machine name.
function spacefish_host
  if test "$SPACEFISH_HOST_SHOW" = 1;
    return
  end
  if test $SPACEFISH_HOST_SHOW = 'always'; or set -q SSH_CONNECTION;
    set host_color host

    # Determination of what color should be used
    if set -q SSH_CONNECTION;
      set host_color $SPACEFISH_HOST_COLOR_SSH
    else
      set host_color $SPACEFISH_HOST_COLOR
    end

    set host (hostname)

    spacefish::section \
      "(host_color)" \
      "(SPACEFISH_HOST_PREFIX)" \
      "(host)" \
      "(SPACEFISH_HOST_SUFFIX)"
      
    end
end
