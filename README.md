[![Build Status][travis-badger]][travis]
[![WTFPL License][license-badger]][wtfpl-orignal]
[![Maintainability][maitainability-badger]][codeclimate]
[![SSL Rating][ssl-badger]][ssl-labs]

<p align="center">
  <a href="https://mayurifag.ru">
    <img src="source/images/main_icon.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">
    <b>
      <a href="https://mayurifag.ru">Yet another personal website</a>
    </b>
  </h3>
</p>

## Getting Started

1. You should have installed latest stable `Docker` and `Docker Compose` to start
development server.

2. Clone repo and execute:

```shell
docker-compose up --build
```

Development server has to be served at [localhost:4567][middleman-local-server]

There's a `dip` way to launch development server: `dip provision`.

### Built With

* Ruby 3.1
* Middleman (Ruby-based static website framework)
* Docker

Deploy via Travis CI, hosted on Github Pages.

## Automatic tests

To run test suite, you may use following command:

```shell
docker-compose run web bundle exec rspec
```

You may also use `dip rspec`.

## Stylelint

If you have installed package-lock.json packages you may check styles by
running `npx stylelint "source/**/*.scss"`.

## Production image

Build production image tagged `latest`:

```shell
DOCKER_BUILDKIT=1 docker build . -f production.Dockerfile -t mayurifag/mayurifag.github.io:latest
```

Run latest production image (open `localhost:8000` on your browser):

```shell
docker run --rm -it -p 8000:8005 --init mayurifag/mayurifag.github.io:latest
```

## License

Distributed under the WTFPL License. See `LICENSE.md` for more information.

[travis-badger]: https://travis-ci.com/Mayurifag/mayurifag.github.io.svg?branch=source
[license-badger]: https://img.shields.io/github/license/Mayurifag/mayurifag.github.io.svg?style=plastic
[maitainability-badger]: https://api.codeclimate.com/v1/badges/3d4a4a856e67fc87790a/maintainability
[ssl-badger]: https://sslbadge.org/?domain=mayurifag.ru
[codeclimate]: https://codeclimate.com/github/Mayurifag/mayurifag.github.io/maintainability
[wtfpl-orignal]: https://github.com/rpherrera/WTFPL
[travis]: https://travis-ci.com/Mayurifag/mayurifag.github.io
[ssl-labs]: https://www.ssllabs.com/ssltest/analyze.html?d=mayurifag.ru
[middleman-local-server]: http://lvh.me:4567
