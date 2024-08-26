[![WTFPL License][license-badger]][wtfpl-orignal]

<p align="center">
  <a href="https://mayurifag.ru">
    <img src="public/favicon.svg" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">
    <b>
      <a href="https://mayurifag.ru">Yet another personal website</a>
    </b>
  </h3>
</p>

## Launch development environment

Make sure you have `bun` installed.

```sh
bun install
make dev
```

I didn't make docker dev enviroment here, there is no special need for it.

## Build and run production docker image

Make sure you have `docker` installed.

```sh
make docker-run
```

## How project was built

There was Middleman project before, which you may check with
`latest-middleman-release` tag. I've decided to start from scratch using
Astro.js and Bun. I've also used github actions and github pages.

Cheatsheet:

```sh
bunx create-astro@latest mayurifag.github.io
cd mayurifag.github.io
bunx --bun astro telemetry disable
```

## License

Distributed under the WTFPL License. See `LICENSE.md` for more information.

[license-badger]: https://img.shields.io/github/license/Mayurifag/mayurifag.github.io.svg?style=plastic
[wtfpl-orignal]: https://github.com/rpherrera/WTFPL
