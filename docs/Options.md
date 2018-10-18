## Options

You have ability to customize or disable specific elements of Spacefish. All options must be overridden in your `config.fish`.

Colors for sections can be [basic colors](https://fishshell.com/docs/current/commands.html#set_color) or [color codes](https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg).

**Note:** the symbol `·` in this document represents a regular space character ` `, it is used to clearly indicate when an option default value starts or ends with a space.

### Order

You can specify the order of prompt section using `SPACEFISH_PROMPT_ORDER` option. Use Zsh array syntax to define your own prompt order.

The order also defines which sections that Spacefish loads. If you're struggling with slow prompt, you can just omit the sections that you don't use, and they won't be loaded.

The default order is:

```fish
    set SPACEFISH_PROMPT_ORDER time user dir host git package node ruby golang php rust haskell conda pyenv kubecontext exec_time line_sep battery jobs exit_code char
```

### Prompt

This group of options defines a behavior of prompt and standard parameters for sections displaying.

| Variable | Default | Meaning |
| :--- | :---: | --- |
| `SPACEFISH_PROMPT_ADD_NEWLINE` | `true` | Adds a newline character before each prompt line |
| `SPACEFISH_PROMPT_SEPARATE_LINE` | `true` | Make the prompt span across two lines |
| `SPACEFISH_PROMPT_FIRST_PREFIX_SHOW` | `false` | Shows a prefix of the first section in prompt |
| `SPACEFISH_PROMPT_PREFIXES_SHOW` | `true` | Show prefixes before prompt sections |
| `SPACEFISH_PROMPT_SUFFIXES_SHOW` | `true` | Show suffixes before prompt sections |
| `SPACEFISH_PROMPT_DEFAULT_PREFIX` | `via` | Default prefix for prompt sections |
| `SPACEFISH_PROMPT_DEFAULT_SUFFIX` | ` ` | Default suffix for prompt section |

### Time \(`time`\)

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACEFISH_TIME_SHOW` | `false` | Show current time |
| `SPACEFISH_DATE_SHOW` | `false·` | Show today's date |
| `SPACEFISH_TIME_PREFIX` | `at·` | Prefix before time section |
| `SPACEFISH_TIME_SUFFIX` | `$SPACEFISH_PROMPT_DEFAULT_SUFFIX` | Suffix after time section |
| `SPACEFISH_TIME_FORMAT` | `false` | Custom time/date formatting, set as a string to enable (`man date` for help)  |
| `SPACEFISH_TIME_12HR` | `false` | Use 12 hour clock AM/PM |
| `SPACEFISH_TIME_COLOR` | `yellow` | Color of time section |

### Username \(`user`\)

By default, a username is shown only when it's not the same as `$LOGNAME`, when you're connected via SSH or when you're root. Root user is highlighted in `SPACEFISH_USER_COLOR_ROOT` color (red as default).

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACEFISH_USER_SHOW` | `true` | Show user section (`true`, `false`, `always` or `needed`) |
| `SPACEFISH_USER_PREFIX` | `with·` | Prefix before user section |
| `SPACEFISH_USER_SUFFIX` | `$SPACEFISH_PROMPT_DEFAULT_SUFFIX` | Suffix after user section |
| `SPACEFISH_USER_COLOR` | `yellow` | Color of user section |
| `SPACEFISH_USER_COLOR_ROOT` | `red` | Color of user section when it's root |

`SPACEFISH_USER_SHOW` defines when to show username section. Here are possible values:

| `SPACEFISH_USER_SHOW` | Show on local  | Show on remote  |
| :-------------------: | :------------- | :-------------- |
| `false`               | Never          | Never           |
| `always`              | Always         | Always          |
| `true`                | If needed      | Always          |
| `needed`              | If needed      | If needed       |


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

### Hostname \(`host`\)

Hostname should only be shown while you are connected to another machine using SSH, unless you change it using SPACEFISH_HOST_SHOW.

| Variable | Default | Meaning |
| :--- | :---: | --- |
| `SPACEFISH_HOST_SHOW` | `true` | Show host section (true/false) |
| `SPACEFISH_HOST_SHOW_FULL` | `false` | Show full hostname section (true/false) |
| `SPACEFISH_HOST_PREFIX` | `at·` | Prefix before the hostname |
| `SPACEFISH_HOST_SUFFIX` | `$SPACEFISH_PROMPT_DEFAULT_SUFFIX` | Suffix after the hostname |
| `SPACEFISH_HOST_COLOR` | `blue` | Color of the hostname |
| `SPACEFISH_HOST_COLOR_SSH` | `green` | Color of the hostname during SSH |

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

### Package version \(`package`\)

> Works only for [npm](https://www.npmjs.com/) at the moment. Please, help [spaceship](https://github.com/denysdovhan/spaceship-prompt) improve this section!

Package version is shown when repository is a package (e.g. contains a `package.json` file). If no version information is found in `package.json`, the `⚠` symbol will be shown.

> **Note:** This is the version of the package you are working on, not the version of package manager itself.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACEFISH_PACKAGE_SHOW` | `true` | Show package version |
| `SPACEFISH_PACKAGE_PREFIX` | `is·` | Prefix before package version section |
| `SPACEFISH_PACKAGE_SUFFIX` | `$SPACEFISH_PROMPT_DEFAULT_SUFFIX` | Suffix after package version section |
| `SPACEFISH_PACKAGE_SYMBOL` | `📦·` | Character to be shown before package version |
| `SPACEFISH_PACKAGE_COLOR` | `red` | Color of package version section |

### Node.js \(`node`\)

Node.js section is shown only in directories that contain `package.json` file, or `node_modules` folder, or any other file with `.js` extension.

If you set `SPACEFISH_NODE_DEFAULT_VERSION` to the default Node.js version and your current version is the same as `SPACEFISH_NODE_DEFAULT_VERSION`, then Node.js section will be hidden.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACEFISH_NODE_SHOW` | `true` | Current Node.js section |
| `SPACEFISH_NODE_PREFIX` | `$SPACEFISH_PROMPT_DEFAULT_PREFIX` | Prefix before Node.js section |
| `SPACEFISH_NODE_SUFFIX` | `$SPACEFISH_PROMPT_DEFAULT_SUFFIX` | Suffix after Node.js section |
| `SPACEFISH_NODE_SYMBOL` | `⬢·` | Character to be shown before Node.js version |
| `SPACEFISH_NODE_DEFAULT_VERSION` | ` ` | Node.js version to be treated as default |
| `SPACEFISH_NODE_COLOR` | `green` | Color of Node.js section |

### Ruby \(`ruby`\)

Ruby section is shown only in directories that contain `Gemfile`, or `Rakefile`, or any other file with `.rb` extension.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACEFISH_RUBY_SHOW` | `true` | Show Ruby section |
| `SPACEFISH_RUBY_PREFIX` | `$SPACEFISH_PROMPT_DEFAULT_PREFIX` | Prefix before Ruby section |
| `SPACEFISH_RUBY_SUFFIX` | `$SPACEFISH_PROMPT_DEFAULT_SUFFIX` | Suffix after Ruby section |
| `SPACEFISH_RUBY_SYMBOL` | `💎·` | Character to be shown before Ruby version |
| `SPACEFISH_RUBY_COLOR` | `red` | Color of Ruby section |

### Haskell \(`haskell`\)

Ruby section is shown only in directories that contain `stack.yaml`.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACEFISH_HASKELL_SHOW` | `true` | Show Haskell section |
| `SPACEFISH_HASKELL_PREFIX` | `$SPACEFISH_PROMPT_DEFAULT_PREFIX` | Prefix before Haskell section |
| `SPACEFISH_HASKELL_SUFFIX` | `$SPACEFISH_PROMPT_DEFAULT_SUFFIX` | Suffix after Haskell section |
| `SPACEFISH_HASKELL_SYMBOL` | `λ·` | Character to be shown before Haskell version |
| `SPACEFISH_HASKELL_COLOR` | `red` | Color of Haskell section |

### Conda \(`conda`\)

Conda section is shown when ```conda``` is installed and $CONDA_DEFAULT_ENV is set.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACEFISH_CONDA_SHOW` | `true` | Show current Conda version |
| `SPACEFISH_CONDA_PREFIX` | `$SPACEFISH_PROMPT_DEFAULT_PREFIX` | Prefix before the conda section |
| `SPACEFISH_CONDA_SUFFIX` | `$SPACEFISH_PROMPT_DEFAULT_SUFFIX` | Suffix after the conda section |
| `SPACEFISH_CONDA_SYMBOL` | `🅒·` | Character to be shown before Conda version |
| `SPACEFISH_CONDA_COLOR` | `blue` | Color of Conda section |

### Pyenv \(`pyenv`\)

pyenv section is shown only in directories that contain `requirements.txt` or any other file with `.py` extension.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACEFISH_PYENV_SHOW` | `true` | Show current Pyenv version |
| `SPACEFISH_PYENV_PREFIX` | `$SPACEFISH_PROMPT_DEFAULT_PREFIX` | Prefix before the pyenv section |
| `SPACEFISH_PYENV_SUFFIX` | `$SPACEFISH_PROMPT_DEFAULT_SUFFIX` | Suffix after the pyenv section |
| `SPACEFISH_PYENV_SYMBOL` | `🐍·` | Character to be shown before Pyenv version |
| `SPACEFISH_PYENV_COLOR` | `yellow` | Color of Pyenv section |

### Go \(`golang`\)

Go section is shown only in directories that contain `Godeps`, `glide.yaml`, any other file with `.go` extension, or when current directory is in the Go workspace defined in `$GOPATH`.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACEFISH_GOLANG_SHOW` | `true` | Show current Go version |
| `SPACEFISH_GOLANG_PREFIX` | `$SPACEFISH_PROMPT_DEFAULT_PREFIX` | Prefix before the Go section |
| `SPACEFISH_GOLANG_SUFFIX` | `$SPACEFISH_PROMPT_DEFAULT_SUFFIX` | Suffix after the Go section |
| `SPACEFISH_GOLANG_SYMBOL` | `🐹·` | Character to be shown before Go version |
| `SPACEFISH_GOLANG_COLOR` | `cyan` | Color of Go section |

### PHP (`php`)

PHP section is shown only in directories that contain `composer.json` file, or any other file with `.php` extension.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACEFISH_PHP_SHOW` | true | Show PHP section |
| `SPACEFISH_PHP_PREFIX` | `$SPACEFISH_PROMPT_DEFAULT_PREFIX` | Prefix before the PHP section |
| `SPACEFISH_PHP_SUFFIX` | `$SPACEFISH_PROMPT_DEFAULT_SUFFIX` | Suffix after the PHP section |
| `SPACEFISH_PHP_SYMBOL` | `🐘·` | Character to be shown before PHP version |
| `SPACEFISH_PHP_COLOR` | `blue` | Color of PHP section |

### Rust (`rust`)

Rust section is shown only in directories that contain `Cargo.toml` or any other file with `.rs` extension.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACEFISH_RUST_SHOW` | `true` | Show current Rust version |
| `SPACEFISH_RUST_PREFIX` | `$SPACEFISH_PROMPT_DEFAULT_PREFIX` | Prefix before the Rust section |
| `SPACEFISH_RUST_SUFFIX` | `$SPACEFISH_PROMPT_DEFAULT_SUFFIX` | Suffix after the Rust section |
| `SPACEFISH_RUST_SYMBOL` | `𝗥·` | Character to be shown before Rust version |
| `SPACEFISH_RUST_COLOR` | `red` | Color of Rust section |
| `SPACEFISH_RUST_VERBOSE_VERSION` | `false` | Show what branch is being used, if any. (Beta, Nightly) |

### Kubectl context \(`kubecontext`\)

Kubernetes context is shown everywhere if `kubectl` binary is found.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACEFISH_KUBECONTEXT_SHOW` | `true` | Show current kubectl context |
| `SPACEFISH_KUBECONTEXT_PREFIX` | `at ` | Prefix before the kubectl section |
| `SPACEFISH_KUBECONTEXT_SUFFIX` | `$SPACEFISH_PROMPT_DEFAULT_SUFFIX` | Suffix after the kubectl section |
| `SPACEFISH_KUBECONTEXT_SYMBOL` | `☸️ ` | Character to be shown before kubectl context |
| `SPACEFISH_KUBECONTEXT_COLOR` | `cyan` | Color of kubectl section |

### Exec Time \(`exec_time`\)

Execution time of the last command. Will be displayed if it exceeds the set threshold of time.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACEFISH_EXEC_TIME_SHOW` | `true` | Show execution time |
| `SPACEFISH_EXEC_TIME_PREFIX` | `took·` |  Prefix before exec time section |
| `SPACEFISH_EXEC_TIME_SUFFIX` | `$SPACEFISH_PROMPT_DEFAULT_SUFFIX` | Suffix after exec time section |
| `SPACEFISH_EXEC_TIME_COLOR` | `yellow` | Color of exec time section |
| `SPACEFISH_EXEC_TIME_ELAPSED` | `5` | The threshold in seconds for showing exec time section |

### Line Separator \(`line_sep`\)

This is where the prompt will split into two lines, if enabled.

### Battery \(`battery`\)

By default, Battery section is shown only if battery level is below `SPACEFISH_BATTERY_THRESHOLD` \(default: 10%\).

| Variable | Default | Meaning |
| :--- | :---: | --- |
| `SPACEFISH_BATTERY_SHOW` | `true` | Show battery section \(`true`, `false`, `always` or `charged`\) |
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


### Jobs \(`jobs`\)

This section only shows when there are backgrounded jobs.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACEFISH_JOBS_SHOW` | `true` | Show background jobs indicator  |
| `SPACEFISH_JOBS_PREFIX` | ` ` | Prefix before the jobs indicator |
| `SPACEFISH_JOBS_SUFFIX` | ` ` | Suffix after the jobs indicator |
| `SPACEFISH_JOBS_SYMBOL` | `✦` | Character to be shown when jobs are hiding |
| `SPACEFISH_JOBS_COLOR` | `blue` | Color of background jobs section |
| `SPACEFISH_JOBS_AMOUNT_PREFIX` | ` ` | Prefix before the number of jobs |
| `SPACEFISH_JOBS_AMOUNT_SUFFIX` | ` ` | Suffix after the number of jobs |
| `SPACEFISH_JOBS_AMOUNT_THRESHOLD` | `1` | Number of jobs after which job count will be shown |

### Exit Code \(`exit_code`\)
Disabled by default. Set `SPACEFISH_EXIT_CODE_SHOW` to `true` to enable.

| Variable | Default | Meaning |
| :--- | :---: | --- |
| `SPACEFISH_EXIT_CODE_SHOW` | `false` | Show the exit code of the previous command |
| `SPACEFISH_EXIT_CODE_PREFIX` | ` ` | Prefix of exit code |
| `SPACEFISH_EXIT_CODE_SUFFIX` | ` ` | Suffix of exit code |
| `SPACEFISH_EXIT_CODE_SYMBOL` | `✘` | Symbol before the exit code, upon failure |
| `SPACEFISH_EXIT_CODE_COLOR` | `red` | Color of exit code section |

### Char  \(`char`\)

| Variable | Default | Meaning |
| :--- | :---: | --- |
| `SPACEFISH_CHAR_PREFIX` | ` ` | Prefix before prompt character |
| `SPACEFISH_CHAR_SUFFIX` | ` ` | Suffix after prompt character |
| `SPACEFISH_CHAR_SYMBOL` | `➜` | Prompt character to be shown before any command |
| `SPACEFISH_CHAR_COLOR_SUCCESS` | `green` | Color of prompt character if last command completes successfully |
| `SPACEFISH_CHAR_COLOR_FAILURE` | `red` | Color of prompt character if last command returns non-zero exit-code |
