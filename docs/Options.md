## Options

You have ability to customize or disable specific elements of Spacefish. All options must be overridden in your `config.fish`.

Colors for sections can be [basic colors](https://fishshell.com/docs/current/commands.html#set_color) or [color codes](https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg).

**Note:** the symbol `·` in this document represents a regular space character ` `, it is used to clearly indicate when an option default value starts or ends with a space.

### Order

You can specify the order of prompt section using `SPACEFISH_PROMPT_ORDER` option. Use Zsh array syntax to define your own prompt order.

The order also defines which sections that Spacefish loads. If you're struggling with slow prompt, you can just omit the sections that you don't use, and they won't be loaded.

The default order is:

```fish
    set SPACEFISH_PROMPT_ORDER dir git exec_time line_sep battery char
```

### Prompt

This group of options defines a behavior of prompt and standard parameters for sections displaying.

| Variable | Default | Meaning |
| :--- | :---: | --- |
| `SPACEFISH_PROMPT_ADD_NEWLINE` | `true` | Adds a newline character before each prompt line |
| `SPACEFISH_PROMPT_SEPARATE_LINE` | `true` | Make the prompt span across two lines |
| `SPACEFISH_PROMPT_FIRST_PREFIX_SHOW` | `false` | Shows a prefix of the first section in prompt |
| `SPACEFISH_PROMPT_PREFIXES_SHOW` | `true` | Show prefixes before prompt sections or not |
| `SPACEFISH_PROMPT_SUFFIXES_SHOW` | `true` | Show suffixes before prompt sections or not |
| `SPACEFISH_PROMPT_DEFAULT_PREFIX` | `via` | Default prefix for prompt sections |
| `SPACEFISH_PROMPT_DEFAULT_SUFFIX` | ` ` | Default suffix for prompt section |

### Char

| Variable | Default | Meaning |
| :--- | :---: | --- |
| `SPACEFISH_CHAR_PREFIX` | ` ` | Prefix before prompt character |
| `SPACEFISH_CHAR_SUFFIX` | ` ` | Suffix after prompt character |
| `SPACEFISH_CHAR_SYMBOL` | `➜` | Prompt character to be shown before any command |
| `SPACEFISH_CHAR_COLOR_SUCCESS` | `green` | Color of prompt character if last command completes successfully |
| `SPACEFISH_CHAR_COLOR_FAILURE` | `red` | Color of prompt character if last command returns non-zero exit-code |

### Directory \(`dir`\)

Directory is always shown and truncated to the value of `SPACEFISH_DIR_TRUNC`. While you are in repository, it shows only root directory and folders inside it.

| Variable | Default | Meaning |
| :--- | :---: | --- |
| `SPACEFISH_DIR_SHOW` | `true` | Show directory section |
| `SPACEFISH_DIR_SUFFIX` | `$SPACEFISH_PROMPT_DEFAULT_SUFFIX` | Suffix after current directory |
| `SPACEFISH_DIR_TRUNC` | `3` | Number of folders of cwd to show in prompt, 0 to show all |
| `SPACEFISH_DIR_TRUNC_REPO` | `true` | While in `git` repo, show only root directory and folders inside it |
| `SPACEFISH_DIR_COLOR` | `(set_color --bold cyan)` | Color of directory section |
| `SPACEFISH_DIR_PREFIX` | `in·` | Prefix before current directory |

### Git \(`git`\)

Git section is consists with `git_branch` and `git_status` subsections. It is shown only in Git repositories.

| Variable | Default | Meaning |
| :--- | :---: | --- |
| `SPACEFISH_GIT_SHOW` | `true` | Show Git section |
| `SPACEFISH_GIT_PREFIX` | `on·` | Prefix before Git section |
| `SPACEFISH_GIT_SUFFIX` | `$SPACEFISH_PROMPT_DEFAULT_SUFFIX` | Suffix after Git section |
| `SPACEFISH_GIT_SYMBOL` | ![·](https://user-images.githubusercontent.com/3459374/34947621-4f324a92-fa13-11e7-9b99-cdba2cdda6b9.png) | Character to be shown before Git section \(requires [powerline patched font](https://github.com/powerline/fonts) |

#### Git branch \(`git_branch`\)

| Variable | Default | Meaning |
| :--- | :---: | --- |
| `SPACEFISH_GIT_BRANCH_SHOW` | `true` | Show Git branch subsection |
| `SPACEFISH_GIT_BRANCH_PREFIX` | `$SPACEFISH_GIT_SYMBOL` | Prefix before Git branch subsection |
| `SPACEFISH_GIT_BRANCH_SUFFIX` | ` ` | Suffix after Git branch subsection |
| `SPACEFISH_GIT_BRANCH_COLOR` | `(set_color magenta)` | Color of Git branch subsection |

#### Git status \(`git_status`\)

Git status indicators is shown only when you have dirty repository.

| Variable | Default | Meaning |
| :--- | :---: | --- |
| `SPACEFISH_GIT_STATUS_SHOW` | `true` | Show Git status subsection |
| `SPACEFISH_GIT_STATUS_PREFIX` | `·[` | Prefix before Git status subsection |
| `SPACEFISH_GIT_STATUS_SUFFIX` | `]` | Suffix after Git status subsection |
| `SPACEFISH_GIT_STATUS_COLOR` | `red` | Color of Git status subsection |
| `SPACEFISH_GIT_STATUS_UNTRACKED` | `?` | Indicator for untracked changes |
| `SPACEFISH_GIT_STATUS_ADDED` | `+` | Indicator for added changes |
| `SPACEFISH_GIT_STATUS_MODIFIED` | `!` | Indicator for unstaged files |
| `SPACEFISH_GIT_STATUS_RENAMED` | `»` | Indicator for renamed files |
| `SPACEFISH_GIT_STATUS_DELETED` | `✘` | Indicator for deleted files |
| `SPACEFISH_GIT_STATUS_STASHED` | `$` | Indicator for stashed changes |
| `SPACEFISH_GIT_STATUS_UNMERGED` | `=` | Indicator for unmerged changes |
| `SPACEFISH_GIT_STATUS_AHEAD` | `⇡` | Indicator for unpushed changes \(ahead of remote branch\) |
| `SPACEFISH_GIT_STATUS_BEHIND` | `⇣` | Indicator for unpulled changes \(behind of remote branch\) |
| `SPACEFISH_GIT_STATUS_DIVERGED` | `⇕` | Indicator for diverged chages \(diverged with remote branch\) |

### Battery \(`battery`\)

By default, Battery section is shown only if battery level is below `SPACEFISH_BATTERY_THRESHOLD` \(default: 10%\).

| Variable | Default | Meaning |
| :--- | :---: | --- |
| `SPACEFISH_BATTERY_SHOW` | `true` | Show battery section or not \(`true`, `false`, `always` or `charged`\) |
| `SPACEFISH_BATTERY_PREFIX` | ` ` | Prefix before battery section |
| `SPACEFISH_BATTERY_SUFFIX` | `SPACEFISH_PROMPT_DEFAULT_SUFFIX` | Suffix after battery section |
| `SPACEFISH_BATTERY_SYMBOL_CHARGING` | `⇡` | Character to be shown if battery is charging |
| `SPACEFISH_BATTERY_SYMBOL_DISCHARGING` | `⇣` | Character to be shown if battery is discharging |
| `SPACEFISH_BATTERY_SYMBOL_FULL` | `•` | Character to be shown if battery is full |
| `SPACEFISH_BATTERY_THRESHOLD` | 10 | Battery level below which battery section will be shown |

`SPACEFISH_BATTERY_SHOW` defines when to show battery section. Here are possible values:

| `SPACEFISH_BATTERY_SHOW` | Below threshold | Above threshold | Fully charged |
| :---: | :--- | :--- | :--- |
| `false` | Hidden | Hidden | Hidden |
| `always` | Shown | Shown | Shown |
| `true` | Shown | Hidden | Hidden |
| `charged` | Shown | Hidden | Shown |



