<h1 align="center">
  <a href="https://github.com/starship/starship">
    <img alt="Focus has shifted to the development of Starship, the successor to Spacefish. If you are interested in contributing or using it, come take a look!" src="./images/starship-notice.svg" width="100%">
  </a><br><br>
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
  <img src="https://badgen.net/badge/fish/v3.0.2"
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
* Current Amazon Web Services (AWS) profile (`☁️`) ([Using named profiles](http://docs.aws.amazon.com/cli/latest/userguide/cli-multiple-profiles.html)).
* Current Python virtualenv.
* Current Conda version (`🅒`).
* Current Elixir Version (`💧`).
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
<table><tr><td align="center"><a href="https://twitter.com/matchai"><img src="https://avatars0.githubusercontent.com/u/4658208?v=4" width="100px;" alt="Matan Kushner"/><br /><sub><b>Matan Kushner</b></sub></a><br /><a href="https://github.com/matchai/spacefish/issues?q=author%3Amatchai" title="Bug reports">🐛</a> <a href="https://github.com/matchai/spacefish/commits?author=matchai" title="Code">💻</a> <a href="https://github.com/matchai/spacefish/commits?author=matchai" title="Documentation">📖</a> <a href="#review-matchai" title="Reviewed Pull Requests">👀</a> <a href="https://github.com/matchai/spacefish/commits?author=matchai" title="Tests">⚠️</a> <a href="#tool-matchai" title="Tools">🔧</a> <a href="#design-matchai" title="Design">🎨</a></td><td align="center"><a href="https://github.com/sirMerr"><img src="https://avatars2.githubusercontent.com/u/11183523?v=4" width="100px;" alt="Tiffany Le-Nguyen"/><br /><sub><b>Tiffany Le-Nguyen</b></sub></a><br /><a href="https://github.com/matchai/spacefish/issues?q=author%3AsirMerr" title="Bug reports">🐛</a> <a href="https://github.com/matchai/spacefish/commits?author=sirMerr" title="Code">💻</a> <a href="https://github.com/matchai/spacefish/commits?author=sirMerr" title="Documentation">📖</a> <a href="#review-sirMerr" title="Reviewed Pull Requests">👀</a> <a href="https://github.com/matchai/spacefish/commits?author=sirMerr" title="Tests">⚠️</a></td><td align="center"><a href="https://github.com/Snuggle"><img src="https://avatars0.githubusercontent.com/u/26250962?v=4" width="100px;" alt="Snuggle"/><br /><sub><b>Snuggle</b></sub></a><br /><a href="https://github.com/matchai/spacefish/issues?q=author%3ASnuggle" title="Bug reports">🐛</a> <a href="https://github.com/matchai/spacefish/commits?author=Snuggle" title="Code">💻</a> <a href="https://github.com/matchai/spacefish/commits?author=Snuggle" title="Documentation">📖</a> <a href="#review-Snuggle" title="Reviewed Pull Requests">👀</a> <a href="https://github.com/matchai/spacefish/commits?author=Snuggle" title="Tests">⚠️</a></td><td align="center"><a href="https://github.com/jskrnbindra"><img src="https://avatars2.githubusercontent.com/u/11844760?v=4" width="100px;" alt="Jaskaran Bindra"/><br /><sub><b>Jaskaran Bindra</b></sub></a><br /><a href="https://github.com/matchai/spacefish/commits?author=jskrnbindra" title="Code">💻</a> <a href="https://github.com/matchai/spacefish/commits?author=jskrnbindra" title="Documentation">📖</a> <a href="https://github.com/matchai/spacefish/commits?author=jskrnbindra" title="Tests">⚠️</a></td><td align="center"><a href="https://labun.me"><img src="https://avatars3.githubusercontent.com/u/6306918?v=4" width="100px;" alt="Konstantin Labun"/><br /><sub><b>Konstantin Labun</b></sub></a><br /><a href="https://github.com/matchai/spacefish/commits?author=kulabun" title="Code">💻</a> <a href="https://github.com/matchai/spacefish/commits?author=kulabun" title="Documentation">📖</a> <a href="https://github.com/matchai/spacefish/commits?author=kulabun" title="Tests">⚠️</a></td><td align="center"><a href="https://medium.com/@kyleholzinger"><img src="https://avatars0.githubusercontent.com/u/2652762?v=4" width="100px;" alt="Kyle Holzinger"/><br /><sub><b>Kyle Holzinger</b></sub></a><br /><a href="https://github.com/matchai/spacefish/commits?author=kyleholzinger" title="Code">💻</a> <a href="https://github.com/matchai/spacefish/commits?author=kyleholzinger" title="Documentation">📖</a></td><td align="center"><a href="https://github.com/salmanulfarzy"><img src="https://avatars0.githubusercontent.com/u/10276208?v=4" width="100px;" alt="Salmanul Farzy"/><br /><sub><b>Salmanul Farzy</b></sub></a><br /><a href="https://github.com/matchai/spacefish/commits?author=salmanulfarzy" title="Code">💻</a> <a href="#review-salmanulfarzy" title="Reviewed Pull Requests">👀</a></td></tr><tr><td align="center"><a href="https://owais.lone.pw"><img src="https://avatars0.githubusercontent.com/u/46186?v=4" width="100px;" alt="owais"/><br /><sub><b>owais</b></sub></a><br /><a href="https://github.com/matchai/spacefish/commits?author=owais" title="Code">💻</a> <a href="https://github.com/matchai/spacefish/commits?author=owais" title="Documentation">📖</a> <a href="https://github.com/matchai/spacefish/commits?author=owais" title="Tests">⚠️</a></td><td align="center"><a href="https://github.com/ladysamantha"><img src="https://avatars3.githubusercontent.com/u/35412203?v=4" width="100px;" alt="Samantha Enders"/><br /><sub><b>Samantha Enders</b></sub></a><br /><a href="https://github.com/matchai/spacefish/commits?author=ladysamantha" title="Code">💻</a> <a href="https://github.com/matchai/spacefish/commits?author=ladysamantha" title="Documentation">📖</a> <a href="https://github.com/matchai/spacefish/commits?author=ladysamantha" title="Tests">⚠️</a></td><td align="center"><a href="https://evanrelf.com"><img src="https://avatars2.githubusercontent.com/u/887196?v=4" width="100px;" alt="Evan Relf"/><br /><sub><b>Evan Relf</b></sub></a><br /><a href="https://github.com/matchai/spacefish/commits?author=evanrelf" title="Code">💻</a> <a href="https://github.com/matchai/spacefish/commits?author=evanrelf" title="Documentation">📖</a></td><td align="center"><a href="https://jasonet.co"><img src="https://avatars1.githubusercontent.com/u/10660468?v=4" width="100px;" alt="Jason Etcovitch"/><br /><sub><b>Jason Etcovitch</b></sub></a><br /><a href="https://github.com/matchai/spacefish/commits?author=JasonEtco" title="Code">💻</a> <a href="https://github.com/matchai/spacefish/commits?author=JasonEtco" title="Documentation">📖</a></td><td align="center"><a href="https://github.com/hrvoj3e"><img src="https://avatars0.githubusercontent.com/u/4988133?v=4" width="100px;" alt="hrvoj3e"/><br /><sub><b>hrvoj3e</b></sub></a><br /><a href="https://github.com/matchai/spacefish/issues?q=author%3Ahrvoj3e" title="Bug reports">🐛</a> <a href="https://github.com/matchai/spacefish/commits?author=hrvoj3e" title="Code">💻</a></td><td align="center"><a href="http://newmaniese.com"><img src="https://avatars1.githubusercontent.com/u/64894?v=4" width="100px;" alt="Michael Newman"/><br /><sub><b>Michael Newman</b></sub></a><br /><a href="https://github.com/matchai/spacefish/issues?q=author%3Anewmaniese" title="Bug reports">🐛</a> <a href="https://github.com/matchai/spacefish/commits?author=newmaniese" title="Code">💻</a> <a href="https://github.com/matchai/spacefish/commits?author=newmaniese" title="Documentation">📖</a> <a href="https://github.com/matchai/spacefish/commits?author=newmaniese" title="Tests">⚠️</a></td><td align="center"><a href="https://github.com/k-lyda"><img src="https://avatars0.githubusercontent.com/u/6491400?v=4" width="100px;" alt="Konrad"/><br /><sub><b>Konrad</b></sub></a><br /><a href="https://github.com/matchai/spacefish/issues?q=author%3Ak-lyda" title="Bug reports">🐛</a></td></tr><tr><td align="center"><a href="https://github.com/dubnev"><img src="https://avatars1.githubusercontent.com/u/3227558?v=4" width="100px;" alt="Will Neville"/><br /><sub><b>Will Neville</b></sub></a><br /><a href="https://github.com/matchai/spacefish/issues?q=author%3Adubnev" title="Bug reports">🐛</a></td><td align="center"><a href="https://github.com/danieltrautmann"><img src="https://avatars1.githubusercontent.com/u/4022138?v=4" width="100px;" alt="Daniel Trautmann"/><br /><sub><b>Daniel Trautmann</b></sub></a><br /><a href="https://github.com/matchai/spacefish/commits?author=danieltrautmann" title="Code">💻</a></td><td align="center"><a href="https://github.com/Menturan"><img src="https://avatars0.githubusercontent.com/u/16061385?v=4" width="100px;" alt="Jonas Öhlander"/><br /><sub><b>Jonas Öhlander</b></sub></a><br /><a href="https://github.com/matchai/spacefish/issues?q=author%3AMenturan" title="Bug reports">🐛</a></td><td align="center"><a href="https://twitter.com/lynzt"><img src="https://avatars1.githubusercontent.com/u/3099491?v=4" width="100px;" alt="lindsay"/><br /><sub><b>lindsay</b></sub></a><br /><a href="https://github.com/matchai/spacefish/commits?author=lynzt" title="Documentation">📖</a></td><td align="center"><a href="http://www.bradcypert.com"><img src="https://avatars0.githubusercontent.com/u/1455979?v=4" width="100px;" alt="Brad"/><br /><sub><b>Brad</b></sub></a><br /><a href="https://github.com/matchai/spacefish/commits?author=bradcypert" title="Code">💻</a></td><td align="center"><a href="https://github.com/nammn"><img src="https://avatars3.githubusercontent.com/u/23652004?v=4" width="100px;" alt="Nam Nguyen"/><br /><sub><b>Nam Nguyen</b></sub></a><br /><a href="https://github.com/matchai/spacefish/commits?author=nammn" title="Code">💻</a></td><td align="center"><a href="http://www.halostatue.ca/"><img src="https://avatars3.githubusercontent.com/u/11361?v=4" width="100px;" alt="Austin Ziegler"/><br /><sub><b>Austin Ziegler</b></sub></a><br /><a href="#review-halostatue" title="Reviewed Pull Requests">👀</a></td></tr></table>

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/kentcdodds/all-contributors) specification. Contributions of any kind welcome!

## License

MIT © [Matan Kushner](http://matchai.me)

<!-- Links -->

[spaceship]: https://github.com/denysdovhan/spaceship-prompt
[fish]: https://fishshell.com
[zsh]: http://zsh.org
