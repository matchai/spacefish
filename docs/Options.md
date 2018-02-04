## Options

You have ability to customize or disable specific elements of Spacefish. All options must be overridden in your `config.fish`.

Colors for sections can be [basic colors](https://fishshell.com/docs/current/commands.html#set_color) or [color codes](https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg).

**Note:** the symbol `·` in this document represents a regular space character ` `, it is used to clearly indicate when an option default value starts or ends with a space.

### Char

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACEFISH_CHAR_PREFIX` | ` ` | Prefix before prompt character |
| `SPACEFISH_CHAR_SUFFIX` | `.` | Suffix after prompt character |
| `SPACEFISH_CHAR_SYMBOL` | `➜ ` | Prompt character to be shown before any command |

### Git (`git`)

Git section is consists with `git_branch` and `git_status` subsections. It is shown only in Git repositories.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACEFISH_GIT_PREFIX` | `on·` | Prefix before Git section |
| `SPACEFISH_GIT_SUFFIX` | `` | Suffix after Git section |
| `SPACEFISH_GIT_SYMBOL` | ![·](https://user-images.githubusercontent.com/3459374/34947621-4f324a92-fa13-11e7-9b99-cdba2cdda6b9.png) | Character to be shown before Git section (requires [powerline patched font](https://github.com/powerline/fonts) |

