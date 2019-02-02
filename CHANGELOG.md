# [2.1.0](https://github.com/matchai/spacefish/compare/v2.0.1...v2.1.0) (2019-01-23)


### Bug Fixes

* correct go development version format ([e678ac2](https://github.com/matchai/spacefish/commit/e678ac2)), closes [#137](https://github.com/matchai/spacefish/issues/137)


### Features

* improve pyenv version detection ([22b9e20](https://github.com/matchai/spacefish/commit/22b9e20)), closes [#140](https://github.com/matchai/spacefish/issues/140)
* provide docker version if in a docker container ([62891b4](https://github.com/matchai/spacefish/commit/62891b4)), closes [#138](https://github.com/matchai/spacefish/issues/138)

## [2.0.1](https://github.com/matchai/spacefish/compare/v2.0.0...v2.0.1) (2019-01-09)


### Bug Fixes

* have ACPI use only the first battery value ([#126](https://github.com/matchai/spacefish/issues/126)) ([8fa713b](https://github.com/matchai/spacefish/commit/8fa713b))

# [2.0.0](https://github.com/matchai/spacefish/compare/v1.12.4...v2.0.0) (2019-01-09)


### Bug Fixes

* remove color from prefix/suffix ([#133](https://github.com/matchai/spacefish/issues/133)) ([319f0b0](https://github.com/matchai/spacefish/commit/319f0b0))


### BREAKING CHANGES

* Because prefix and suffix colors are no longer set to #fff, the color of prefix and suffix will be set to the default foreground color of your shell.
