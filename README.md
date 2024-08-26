[![WTFPL License][license-badger]][wtfpl-orignal]
[![Maintainability][maitainability-badger]][codeclimate]
[![SSL Rating][ssl-badger]][ssl-labs]

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

I didn't make docker enviroment here, there is no special need for it.

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
[maitainability-badger]: https://api.codeclimate.com/v1/badges/3d4a4a856e67fc87790a/maintainability
[ssl-badger]: https://sslbadge.org/?domain=mayurifag.ru
[codeclimate]: https://codeclimate.com/github/Mayurifag/mayurifag.github.io/maintainability
[wtfpl-orignal]: https://github.com/rpherrera/WTFPL
[ssl-labs]: https://www.ssllabs.com/ssltest/analyze.html?d=mayurifag.ru
