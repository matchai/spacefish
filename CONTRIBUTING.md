# Contributing

First of all, thank you for contributing. Any contribution is highly appreciated and welcome.

## Philosophy

There's a simple philosophy behind Spacefish:

* **Absolute parity with spaceship-prompt.** The prompt should be identical to spaceship-prompt when it comes to visuals, functionality, and configuration.

## Setup

1. **Fork** this repo (click the _fork_ button)
2. **Clone** your fork to your computer (via `git clone`)
3. **Make your changes**. Check our [API](./docs/API.md) for more information (we suggest you to check out a new branch for changes).
4. **Test** your code (via `npm test`)
5. **Add and commit** your contributions
6. **Push** your changes to your remote fork
7. **Open a pull-request** on the spacefish repo

## Testing

Unit tests are stored in the `./tests` directory, with the `(filename).test.fish` naming scheme.
To run the unit tests, simply run:

```sh
./tests/run.fish
```

The unit tests will create their own temporary fish environment, so your local fish and spacefish configuration will not affect the unit test run.

## Sections

Spacefish supports most of the popular programming languages, runtimes, version managers, etc. If it doesn't support something that you need, feel free to open a pull request over at Spaceship, and it will be a candidate to be added to Spacefish.

### Will it slow down the prompt?

Every additional section will slow down the prompt a little bit. If your section performs any expensive checks, find a way to make it faster.

* **Good:** check if a command exists, check the value of an environment variable
* **Bad:** network requests, reading large files, etc

## Documentation

When updating documentation for your section, make sure the markdown document is being properly rendered by Github. Specifically, the following common pitfalls have already been discovered:

* Empty inline code blocks ` ` will only be rendered if you put at least one non-breaking whitespace "&nbsp;" inside, like so: `` ` ` `` → ` `
* Leading and trailing whitespaces in inline code blocks will be stripped, to indicate that a whitespace is present, use the middot symbol `·`, like so: `` `🐟·` `` → `🐟·`

## Add yourself as a contributor

This project follows the [all contributors](https://github.com/kentcdodds/all-contributors) specification. To add yourself to the table of
contributors on the README.md, please use the automated script as part of your PR:

```console
npm install
npm run contributors:add -- <YOUR_GITHUB_USERNAME>
```

Follow the prompt. If you've already added yourself to the list and are making a new type of contribution, you can run
it again and select the added contribution type.

**Thank you for reading the contribution guide! Happy hacking!**
