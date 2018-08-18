# API

This page describes the Spacefish API for creating plugins and tweaking Spacefish's behavior.

Spacefish uses the `SPACEFISH_` prefix for variables and the `__sf_` prefix for functions to avoid namespace collisions. All sections, including custom ones, are required to use the `__sf_` prefix before their name to load correctly.

## Example section

Below is an example of a typical section for Spacefish. Pay attention to a few critical aspects:

* Variables used for configuration should start with `SPACEFISH_`.
* The section's name should start with `__sf_`.
* Only show the section as is needed (only in directories containing specific files, when a specific command is available, etc).

Take a look at [Contribution guidelines](../CONTRIBUTING.md) for further details.

```sh
#
# Foobar
#
# Foobar is a supa-dupa cool tool for making you development easier.
# Link: https://www.foobar.xyz

# __sf_ prefix before section's name is required!
# Otherwise this section won't be loaded.
function __sf_section_foobar -d "Show foobar status"
  # ------------------------------------------------------------------------------
  # Configuration
  # ------------------------------------------------------------------------------

  __sf_util_set_default SPACEFISH_FOOBAR_SHOW true
  __sf_util_set_default SPACEFISH_FOOBAR_PREFIX $SPACEFISH_PROMPT_DEFAULT_PREFIX
  __sf_util_set_default SPACEFISH_FOOBAR_SUFFIX $SPACEFISH_PROMPT_DEFAULT_SUFFIX
  __sf_util_set_default SPACEFISH_FOOBAR_SYMBOL "🍷 "
  __sf_util_set_default SPACEFISH_FOOBAR_COLOR white

  # ------------------------------------------------------------------------------
  # Section
  # ------------------------------------------------------------------------------

  # If SPACEFISH_FOOBAR_SHOW is false, don't show the foobar section
  [ $SPACEFISH_FOOBAR_SHOW = false ]; and return

  # If the foobar command doesn't exist, don't show the foobar section
  type -q foobar; or return

  # Here some of the various expressions that can be tested
  # The full list can be found here:
  # https://fishshell.com/docs/current/commands.html#test
  type -q command          # test that a command exists
  test -e /path/to/file    # test that a file exists
  test -d /path/to/dir     # test that a directory exists
  test operand1 = operand2 # that for two equal strings
  test -n "$variable"      # test that a variable exists

  # Use `set -l` to define local variables to avoid populating
  # the global namespace
  set -l foobar_status

  if test "$SOME_CONDITION" = "true"
    set foobar_status (foobar baz)
  else
    set foobar_status (foobar foo)
  end

  # Display the foobar section
  __sf_lib_section \
  $SPACEFISH_FOOBAR_COLOR \
  $SPACEFISH_FOOBAR_PREFIX \
  $SPACEFISH_FOOBAR_SYMBOL \
  $SPACEFISH_FOOBAR_SUFFIX
end
```

## `SPACEFISH_VERSION`

An environment variable that defines the version of currently running Spacefish prompt. Can be used for issue reporting or debugging purposes.

Accessible to any program or script running in a current shell session.

### Example

```sh
echo $SPACEFISH_VERSION
#> 0.1.0
```

## `__sf_lib_section <color> [prefix] <content> [suffix]`

This function prints out the prompt section prefixed with `prefix`, suffixed with `suffix` and `content` formatted to display in `color`. The **Bold** style is applied by default.

`prefix`, `suffix` and `content` can contain `set_color` to set an additional foreground color, background color or other formatting styles. Read more about `set_color` in the [set_color - set the terminal color](https://fishshell.com/docs/current/commands.html#set_color) section of the Fish Shell documentation.

If `SPACEFISH_PROMPT_PREFIXES_SHOW` is `false` or if the section is the first to appear in the prompt, then `prefix` will be omitted.

If `SPACEFISH_PROMPT_SUFFIXES_SHOW` is `false`, then `suffix` will be omitted.

Both `prefix` and `suffix` are optional. They are equal to empty strings by default.

### Arguments

1. `color` _Required_ — The color used when displaying the `content`. Can be any of the valid [basic colors](https://fishshell.com/docs/current/commands.html#set_color) or can be any valid RGB hex code.
2. `prefix` _Optional_ — The prefix shown before `content`. Usually, it's the value of `SPACEFISH_*_PREFIX`.
3. `content` _Required_ — The content of the section. Can be any valid value or the result of command execution.
4. `suffix` _Optional_ — The suffix shown after `content`. Usually, it's the value of `SPACEFISH_*_SUFFIX`.

### Example

```sh
# Display the prompt section with a prefix and suffix
# Backslash is used to escape the line endings
__sf_lib_section \
$SPACEFISH_SECTION_COLOR \
$SPACEFISH_SECTION_PREFIX \
$SPACEFISH_SECTION_SYMBOL$section_content \
$SPACEFISH_SECTION_SUFFIX

# Display prompt section without prefix and suffix
__sf_lib_section $color $SPACEFISH_CHAR_SYMBOL
```

## `__sf_util_set_default <variable_name> <value>`

This utility function is used to define a default value for a variable while allowing it to be overwritten by a user's personal configuration files (e.g. setting it in their `config.fish`)

### Arguments

1. `variable_name` _Required_ — the name of the configuration variable.
2. `value` _Required_ — the value to be assigned by default.

### Example

```sh
# Preassign a value to `SPACEFISH_CHAR_SYMBOL`
set -g SPACEFISH_CHAR_SYMBOL ❯

# Assign a value if one doesn't already exist
__sf_util_set_default SPACEFISH_CHAR_SYMBOL ■
__sf_util_set_default SPACEFISH_RUBY_SYMBOL 💎

# The original value assigned is used
echo $SPACEFISH_CHAR_SYMBOL
#> ❯

echo $SPACEFISH_RUBY_SYMBOL
#> 💎
```

## `__sf_util_git_branch`

This utility returns the current branch name if the current working directory is a Git repository, and will return nothing if it's not.

### Example

```sh
# Return if the current working directory is not a Git repository
[ -z (__sf_util_git_branch) ]; and return

# Print the Git branch name of the current working directory
echo (__sf_util_git_branch)
#> master
```
