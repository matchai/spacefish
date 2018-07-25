# TODO: Test me (Help needed)
# pyenv
#

function __sf_section_pyenv -d "Show current version of pyenv Python, including system."
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

    __sf_util_set_default SPACESHIP_PYENV_SHOW true
    __sf_util_set_default SPACESHIP_PYENV_PREFIX $SPACESHIP_PROMPT_DEFAULT_PREFIX
    __sf_util_set_default SPACESHIP_PYENV_SUFFIX $SPACESHIP_PROMPT_DEFAULT_SUFFIX
    __sf_util_set_default SPACESHIP_PYENV_SYMBOL "🐍 "
    __sf_util_set_default SPACESHIP_PYENV_COLOR "yellow"

    # ------------------------------------------------------------------------------
    # Section
    # ------------------------------------------------------------------------------


    [ $SPACEFISH_PYENV_SHOW = false ]; and return

    # Show pyenv python version only for Python-specific folders
    [ -f requirements.txt ]; or [ -n *.py(#qN^/) ]; or return # This glitches out my fish syntax highlighting because of the hashtag.

    if not type -sq pyenv;
        return
    end

    set pyenv_status $(pyenv version-name 2>/dev/null)//:/ # This line needs explicit testing in an enviroment that has pyenv. I don't know what the trailing //:/ does in spaceship.

    __sf_lib_section \
        $SPACEFISH_PYENV_COLOR \
        $SPACEFISH_PYENV_PREFIX \
        $SPACEFISH_PYENV_SYMBOL$pyenv_status \
        $SPACEFISH_PYENV_SUFFIX
end

