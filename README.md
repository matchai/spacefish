<a href="https://github.com/matchai/spacefish">
  <img alt="spacefish fish shell theme" src="./images/banner.svg" width="100%">
</a>

# 🚀🐟 Spacefish

[![TravisCI][travis-badge]][travis-url]
[![AppVeyor][appveyor-badge]][appveyor-url]
[![Fish Shell][fish-badge]][fish-url]

> A [Fish Shell][fish] prompt for Astronauts.

Spacefish is a [Fish Shell][fish] port of [Spaceship][spaceship]; the minimalistic, powerful and extremely customizable [Zsh][zsh] prompt. It combines everything you may need for convenient work, without unnecessary complications, like a real spacefish.

## Features
* Indicator if user is root
* Prompt character turns red if the last command exits with non-zero code.
* Execution time of the last command if it exceeds 5 seconds.
* Current Node.js version, through nvm/nodenv/node (`⬢`).
* Current Ruby version, through rvm/rbenv/chruby/asdf (`💎`).
* Package version, if there's is a package in current directory (`📦`).
* Current Git branch and rich repo status:
  * `?` — untracked changes;
  * `+` — uncommitted changes in the index;
  * `!` — unstaged changes;
  * `»` — renamed files;
  * `✘` — deleted files;
  * `$` — stashed changes;
  * `=` — unmerged changes;
  * `⇡` — ahead of remote branch;
  * `⇣` — behind of remote branch;
  * `⇕` — diverged chages.
* Current battery level and status:
  * `⇡` - charging;
  * `⇣` - discharging;
  * `•` - fully charged.

### Upcoming features
* Displaying hostname/username
* Indicator for jobs in the background (`✦`).
* Current Python pyenv (`🐍`).
* Optional exit-code of last command.
* Optional time stamps 12/24hr in format.


Want more features? Please, [open an issue](https://github.com/matchai/spacefish/issues/new?template=Feature_request.md) or send pull request.

## Preview

<p align="center">
  <img alt="Spaceship with Hyper and One Dark" src="./images/preview.gif" width="980px">
</p>

## Requirements
To get spacefish working correctly you will need:

* [`fish`][fish] (v2.7.0 or newer)
* [Powerline Font](https://github.com/powerline/fonts) must be installed and enabled in your terminal.

## Installation
### [Fisherman](https://fisherman.github.io)

```fish
$ fisher matchai/spacefish
```

### [Oh My Fish!](https://github.com/oh-my-fish/oh-my-fish)

```fish
$ omf install spacefish
```

## Customization
Spacefish works well out of the box, but you can customize almost everything if you want.

* [**Options**](./docs/Options.md) — Tweak section's behavior with tons of options.

You have the ability to customize or disable specific elements of Spacefish. All options must be overridden in your `config.fish`.

## Troubleshooting

Having issues? Take a look at our [Troubleshooting](./docs/Troubleshooting.md) page.

Still struggling? Please [file an issue](https://github.com/matchai/spacefish/issues/new?template=Support_question.md), describe your problem, and we will gladly help you.

## License

MIT © [Matan Kushner](http://matchai.me)

<!-- Badges -->

[travis-url]: https://travis-ci.org/matchai/spacefish
[travis-badge]: https://img.shields.io/travis/matchai/spacefish.svg?logo=travis

[appveyor-url]: https://ci.appveyor.com/project/matchai/spacefish
[appveyor-badge]: https://img.shields.io/appveyor/ci/matchai/spacefish/master.svg?logo=appveyor

[fish-url]: https://fishshell.com/
[fish-badge]: https://img.shields.io/badge/fish-2.7.1-blue.svg

<!-- Links -->

[spaceship]: https://github.com/denysdovhan/spaceship-prompt
[fish]: https://fishshell.com/
[zsh]: http://zsh.org/
