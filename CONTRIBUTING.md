# Contributing

First of all, thank you for contributing. Any contribution is highly appreciated and welcome.

## Philosophy

There's a simple philosophy behind Spacefish:

* **Absolute parity with spaceship-prompt.** The prompt should be identical to spaceship-prompt when it comes to visuals, functionality, and configuration.


## Setup

1. **Fork** this repo (click the _fork_ button)
2. **Clone** your fork to your computer (via `git clone`)
3. **Add and commit** your contributions
4. **Push** your changes to your remote fork
5. **Open a pull-request** on the spacefish repo

## Sections

Spacefish supports most of the popular programming languages, runtimes, version managers, etc. If it doesn't support something that you need, feel free to open a pull request over at Spaceship, and it will be a candidate to be added to Spacefish.

### Will it slow down the prompt?

Every additional section will slow down the prompt a little bit. If your section performs any expensive checks, find a way to make it faster.

* **Good:** check if a command exists, check the value of an environment variable
* **Bad:** network requests, reading large files, etc

### Documentation

When updating documentation for your section, make sure the markdown document is being properly rendered by Github. Specifically, the following common pitfalls have already been discovered:

* Empty inline code blocks ` ` will only be rendered if you put at least one non-breaking whitespace "&nbsp;" inside, like so: `` ` ` `` → ` `
* Leading and trailing whitespaces in inline code blocks will be stripped, to indicate that a whitespace is present, use the middot symbol `·`, like so: `` `🐟·` `` → `🐟·`

**Thank you for reading the contribution guide! Happy hacking!**
