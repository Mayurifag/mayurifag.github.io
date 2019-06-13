[![Build Status][travis-badger]][travis]
[![WTFPL License][license-badger]][wtfpl-orignal]
[![Maintainability][maitainability-badger]][codeclimate]

<p align="center">
  <a href="https://mayurifag.github.io">
    <img src="source/_favicon_template.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">
    <b>
      <a href="https://mayurifag.github.io">Yet another personal website</a>
    </b>
  </h3>
</p>

## Getting Started

1. You should have installed latest stable `Docker` and `Docker Compose` to start
development server.

2. Clone repo and execute:

```shell
$ docker-compose up --build
```

Development server has to be served at [localhost][middleman-server]

### Built With
* Ruby 2.6
* Middleman (Ruby-based static website framework)
* Docker

Deploy via Travis CI

## License

Distributed under the WTFPL License. See `LICENSE.md` for more information.

[travis-badger]: https://travis-ci.org/Mayurifag/mayurifag.github.io.svg?branch=source
[license-badger]: https://img.shields.io/github/license/Mayurifag/mayurifag.github.io.svg?style=plastic
[maitainability-badger]: https://api.codeclimate.com/v1/badges/3d4a4a856e67fc87790a/maintainability
[codeclimate]: https://codeclimate.com/github/Mayurifag/mayurifag.github.io/maintainability
[wtfpl-orignal]: https://github.com/rpherrera/WTFPL
[travis]: https://travis-ci.org/Mayurifag/mayurifag.github.io
[middleman-server]: http://lvh.me:4567