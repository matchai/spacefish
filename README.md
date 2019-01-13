<h1 align="center">
  <a href="https://github.com/matchai/spacefish">
    <img alt="spacefish fish shell theme" src="./images/banner.svg" width="100%">
  </a>
  <br>
  <br> Spacefish 🚀🐟 <br>
</h1>

<h4 align="center">
  <a href="https://fishshell.com" target="_blank"><code>Fish Shell</code></a> prompt for Astronauts.
</h4>

<p align="center">
  <a href="https://travis-ci.org/matchai/spacefish">
    <img src="https://badgen.net/travis/matchai/spacefish/master"
      alt="Mac OSX & Linux CI Status" />
  </a>
  <a href="https://fishshell.com/">
  <img src="https://badgen.net/badge/fish/v3.0.0"
    alt="Fish Version" />
  </a>
  <a href="https://github.com/matchai/spacefish/blob/master/LICENSE">
    <img src="https://badgen.net/github/license/matchai/spacefish" alt="GitHub License">
  </a>
</p>

<div align="center">
  <h4>
    <a href="https://spacefish.matchai.me/">Website</a> |
    <a href="#installation">Install</a> |
    <a href="#features">Features</a> |
    <a href="./docs/Options.md">Options</a> |
    <a href="./docs/API.md">API</a>
  </h4>
</div>

<div align="center">
  <sub>Built with ❤︎ by
  <a href="https://matchai.me">Matan Kushner</a> and
  <a href="#contributors">contributors </a></sub>
  <br>
  <sub>A port of <a href="https://github.com/denysdovhan/spaceship-prompt">Spaceship ZSH</a> by
  <a href="https://denysdovhan.com/">Denys Dovhan</a></sub>
</div>

<br>
Spacefish is a minimalistic, powerful and extremely customizable <a href="https://fishshell.com">Fish Shell</a> prompt. It combines everything you may need for convenient work, without unnecessary complications, like a real spacefish.

<p align="center"></p>
  <img alt="Spaceship with Hyper and One Dark" src="./images/preview.gif" width="980px">
</p>

<sub>Vist <a href="./docs/Troubleshooting.md#why-doesnt-my-prompt-look-like-the-preview">Troubleshooting</a> for instructions to recreate this terminal setup.</sub>

## Features

* Clever hostname and username displaying.
* Indicator if user is root.
* Prompt character turns red if the last command exits with non-zero code.
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
  * `⇕` — diverged changes.
* Indicator for jobs in the background (`✦`).
* Current Node.js version, through nvm/nodenv/n (`⬢`).
* Current Docker version and connected machine (`🐳`).
* Current Ruby version, through rvm/rbenv/chruby/asdf (`💎`).
* Current Go version (`🐹`).
* Current PHP version (`🐘`).
* Current Rust version (`𝗥`).
* Current version of Haskell GHC Compiler, defined in stack.yaml file (`λ`).
* Current Julia version (`ஃ`).
* Current Conda version (`🅒`).
* Current Amazon Web Services (AWS) profile (`☁️`) ([Using named profiles](http://docs.aws.amazon.com/cli/latest/userguide/cli-multiple-profiles.html)).
* Current Python pyenv (`🐍`).
* Current .NET SDK version, through dotnet-cli (`.NET`).
* Current Kubectl context (`☸️`).
* Package version, if there is a package in current directory (`📦`).
* Current battery level and status:
  * `⇡` - charging;
  * `⇣` - discharging;
  * `•` - fully charged.
* Current Vi-mode mode.
* Optional exit-code of last command.
* Optional time stamps 12/24hr in format.
* Execution time of the last command if it exceeds 5 seconds.

Want more features? Please [open an issue](https://github.com/matchai/spacefish/issues/new?template=Feature_request.md) or send pull request!

## Requirements

To get spacefish working correctly, you will need:

* [`fish`][fish] (v2.7.0 or newer)
* [Powerline Font](https://github.com/powerline/fonts) must be installed and enabled in your terminal.

## Installation

### [Fisher](https://github.com/jorgebucaran/fisher)

```fish
$ fisher add matchai/spacefish
```

### [Oh My Fish!](https://github.com/oh-my-fish/oh-my-fish)

```fish
$ omf install spacefish
```

## Customization

Spacefish works really well out of the box, but you can customize your fish to your heart's content!

* [**Options**](./docs/Options.md) — Tweak section's behavior with tons of options.

You have the ability to customize or disable specific elements of Spacefish. All options must be overridden in your `config.fish`.

## Troubleshooting

Having issues? Take a look at our [Troubleshooting](./docs/Troubleshooting.md) page.

Still struggling? Please [file an issue](https://github.com/matchai/spacefish/issues/new?template=Support_question.md), describe your problem, and we will gladly help you.

## Contributors

Thanks goes to these wonderful people ([emoji key](https://github.com/kentcdodds/all-contributors#emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore -->
| [<img src="https://avatars0.githubusercontent.com/u/4658208?v=4" width="100px;"/><br /><sub><b>Matan Kushner</b></sub>](https://twitter.com/matchai)<br />[🐛](https://github.com/matchai/spacefish/issues?q=author%3Amatchai "Bug reports") [💻](https://github.com/matchai/spacefish/commits?author=matchai "Code") [📖](https://github.com/matchai/spacefish/commits?author=matchai "Documentation") [👀](#review-matchai "Reviewed Pull Requests") [⚠️](https://github.com/matchai/spacefish/commits?author=matchai "Tests") [🔧](#tool-matchai "Tools") [🎨](#design-matchai "Design") | [<img src="https://avatars2.githubusercontent.com/u/11183523?v=4" width="100px;"/><br /><sub><b>Tiffany Le-Nguyen</b></sub>](https://github.com/sirMerr)<br />[🐛](https://github.com/matchai/spacefish/issues?q=author%3AsirMerr "Bug reports") [💻](https://github.com/matchai/spacefish/commits?author=sirMerr "Code") [📖](https://github.com/matchai/spacefish/commits?author=sirMerr "Documentation") [👀](#review-sirMerr "Reviewed Pull Requests") | [<img src="https://avatars0.githubusercontent.com/u/26250962?v=4" width="100px;"/><br /><sub><b>Snuggle</b></sub>](https://github.com/Snuggle)<br />[🐛](https://github.com/matchai/spacefish/issues?q=author%3ASnuggle "Bug reports") [💻](https://github.com/matchai/spacefish/commits?author=Snuggle "Code") [📖](https://github.com/matchai/spacefish/commits?author=Snuggle "Documentation") [👀](#review-Snuggle "Reviewed Pull Requests") [⚠️](https://github.com/matchai/spacefish/commits?author=Snuggle "Tests") | [<img src="https://avatars2.githubusercontent.com/u/11844760?v=4" width="100px;"/><br /><sub><b>Jaskaran Bindra</b></sub>](https://github.com/jskrnbindra)<br />[💻](https://github.com/matchai/spacefish/commits?author=jskrnbindra "Code") [📖](https://github.com/matchai/spacefish/commits?author=jskrnbindra "Documentation") [⚠️](https://github.com/matchai/spacefish/commits?author=jskrnbindra "Tests") | [<img src="https://avatars3.githubusercontent.com/u/6306918?v=4" width="100px;"/><br /><sub><b>Konstantin Labun</b></sub>](https://labun.me)<br />[💻](https://github.com/matchai/spacefish/commits?author=kulabun "Code") [📖](https://github.com/matchai/spacefish/commits?author=kulabun "Documentation") [⚠️](https://github.com/matchai/spacefish/commits?author=kulabun "Tests") | [<img src="https://avatars0.githubusercontent.com/u/2652762?v=4" width="100px;"/><br /><sub><b>Kyle Holzinger</b></sub>](https://medium.com/@kyleholzinger)<br />[💻](https://github.com/matchai/spacefish/commits?author=kyleholzinger "Code") [📖](https://github.com/matchai/spacefish/commits?author=kyleholzinger "Documentation") | [<img src="https://avatars0.githubusercontent.com/u/10276208?v=4" width="100px;"/><br /><sub><b>Salmanul Farzy</b></sub>](https://github.com/salmanulfarzy)<br />[💻](https://github.com/matchai/spacefish/commits?author=salmanulfarzy "Code") [👀](#review-salmanulfarzy "Reviewed Pull Requests") |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| [<img src="https://avatars0.githubusercontent.com/u/46186?v=4" width="100px;"/><br /><sub><b>owais</b></sub>](https://owais.lone.pw)<br />[💻](https://github.com/matchai/spacefish/commits?author=owais "Code") [📖](https://github.com/matchai/spacefish/commits?author=owais "Documentation") [⚠️](https://github.com/matchai/spacefish/commits?author=owais "Tests") | [<img src="https://avatars3.githubusercontent.com/u/35412203?v=4" width="100px;"/><br /><sub><b>Samantha Enders</b></sub>](https://github.com/ladysamantha)<br />[💻](https://github.com/matchai/spacefish/commits?author=ladysamantha "Code") [📖](https://github.com/matchai/spacefish/commits?author=ladysamantha "Documentation") [⚠️](https://github.com/matchai/spacefish/commits?author=ladysamantha "Tests") | [<img src="https://avatars2.githubusercontent.com/u/887196?v=4" width="100px;"/><br /><sub><b>Evan Relf</b></sub>](https://evanrelf.com)<br />[💻](https://github.com/matchai/spacefish/commits?author=evanrelf "Code") [📖](https://github.com/matchai/spacefish/commits?author=evanrelf "Documentation") | [<img src="https://avatars1.githubusercontent.com/u/10660468?v=4" width="100px;"/><br /><sub><b>Jason Etcovitch</b></sub>](https://jasonet.co)<br />[💻](https://github.com/matchai/spacefish/commits?author=JasonEtco "Code") [📖](https://github.com/matchai/spacefish/commits?author=JasonEtco "Documentation") |
<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/kentcdodds/all-contributors) specification. Contributions of any kind welcome!

## License

MIT © [Matan Kushner](http://matchai.me)

<!-- Links -->

[spaceship]: https://github.com/denysdovhan/spaceship-prompt
[fish]: https://fishshell.com
[zsh]: http://zsh.org
