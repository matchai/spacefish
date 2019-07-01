## [2.6.1](https://github.com/matchai/spacefish/compare/v2.6.0...v2.6.1) (2019-07-01)


### Bug Fixes

* correct incorrectly named config options ([#198](https://github.com/matchai/spacefish/issues/198)) ([85f9ef5](https://github.com/matchai/spacefish/commit/85f9ef5))

# [2.6.0](https://github.com/matchai/spacefish/compare/v2.5.0...v2.6.0) (2019-06-19)


### Features

* Add elixir section ([#190](https://github.com/matchai/spacefish/issues/190)) ([9cb48ea](https://github.com/matchai/spacefish/commit/9cb48ea))

# [2.5.0](https://github.com/matchai/spacefish/compare/v2.4.0...v2.5.0) (2019-05-23)


### Features

* bump version ([13865c6](https://github.com/matchai/spacefish/commit/13865c6))

# [2.4.0](https://github.com/matchai/spacefish/compare/v2.3.1...v2.4.0) (2019-03-08)


### Features

* add cargo package manager and refactor existing package section ([#171](https://github.com/matchai/spacefish/issues/171)) ([0064d2d](https://github.com/matchai/spacefish/commit/0064d2d))

## [2.3.1](https://github.com/matchai/spacefish/compare/v2.3.0...v2.3.1) (2019-03-02)


### Bug Fixes

* correct typo in venv configuration variables ([#167](https://github.com/matchai/spacefish/issues/167)) ([8a3585c](https://github.com/matchai/spacefish/commit/8a3585c))

# [2.3.0](https://github.com/matchai/spacefish/compare/v2.2.4...v2.3.0) (2019-02-24)


### Features

* add Python venv section ([#164](https://github.com/matchai/spacefish/issues/164)) ([3d777fc](https://github.com/matchai/spacefish/commit/3d777fc)), closes [#146](https://github.com/matchai/spacefish/issues/146)

## [2.2.4](https://github.com/matchai/spacefish/compare/v2.2.3...v2.2.4) (2019-02-17)


### Bug Fixes

* don't throw errors when there are multiple GOPATHs ([#158](https://github.com/matchai/spacefish/issues/158)) ([653f1c8](https://github.com/matchai/spacefish/commit/653f1c8))

## [2.2.3](https://github.com/matchai/spacefish/compare/v2.2.2...v2.2.3) (2019-02-17)


### Bug Fixes

* git status section shows the correct symbol for unmerged ([#159](https://github.com/matchai/spacefish/issues/159)) ([7c2a1d5](https://github.com/matchai/spacefish/commit/7c2a1d5))

## [2.2.2](https://github.com/matchai/spacefish/compare/v2.2.1...v2.2.2) (2019-02-14)


### Bug Fixes

* show git status based on SPACEFISH_GIT_STATUS_SHOW ([#155](https://github.com/matchai/spacefish/issues/155)) ([1d34eb9](https://github.com/matchai/spacefish/commit/1d34eb9))

## [2.2.1](https://github.com/matchai/spacefish/compare/v2.2.0...v2.2.1) (2019-02-14)


### Bug Fixes

* use SPACEFISH_TIME_FORMAT when formatting time section ([#156](https://github.com/matchai/spacefish/issues/156)) ([6ab4ecc](https://github.com/matchai/spacefish/commit/6ab4ecc))

# [2.2.0](https://github.com/matchai/spacefish/compare/v2.1.0...v2.2.0) (2019-02-02)


### Features

* add support for F# project detection in the dotnet section ([c104b04](https://github.com/matchai/spacefish/commit/c104b04))

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
