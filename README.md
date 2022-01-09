# [@rootsher/boilerplate-dev](https://github.com/rootsher/boilerplate-dev)

[![GitHub issues](https://img.shields.io/github/issues/rootsher/boilerplate-dev.svg)](https://github.com/rootsher/boilerplate-dev/issues)
[![GitHub PRs](https://img.shields.io/github/issues-pr/rootsher/boilerplate-dev.svg)](https://github.com/rootsher/boilerplate-dev/pulls)

## Requirements

* [git](https://git-scm.com/downloads) `2.29.2`
* [make](https://www.gnu.org/software/make) `3.81`
* [docker](https://docs.docker.com/engine/install) `20.10.8` (build `3967b7d`)
* [docker-compose](https://docs.docker.com/compose/install) `1.29.2` (build `5becea4c`)

## Running

### Clone the `@rootsher/boilerplate-dev` repository

```shell
$ git clone git@github.com:rootsher/boilerplate-dev.git dev && cd dev
```

### Installation and first setup

This command downloads the necessary nested repositories (frontend, 
backend etc.), installs all dependencies and starts the project:

```shell
$ make setup
```

### Development running

If you already have everything downloaded and installed and 
want to start working with the project - just use the command:

```shell
$ make run
```

### Host availability

When services start, go to:

* [http://project.localhost](http://project.localhost) (frontend)
* [http://project.localhost/api](http://project.localhost/api) (backend)

### Available services

* frontend ([React](https://reactjs.org) + [CRA](https://create-react-app.dev))
* backend ([Node.js](https://nodejs.org) + [NestJS](https://nestjs.com))
* database ([MySQL](https://www.mysql.com)), also available on host machine

## Screenshots

<img src="https://raw.githubusercontent.com/rootsher/boilerplate-dev/master/docs/assets/img/browser.png">

## Troubleshooting

Show service logs:

```shell
$ make docker-compose COMMAND="logs -f [service]"
```

## How do you use this in your own project?

1. Fork the `@rootsher/boilerplate-dev` repository
2. Edit the `Makefile` and set the repositories to your own
3. Follow the instructions for setup described above

## This is a series of related projects

* [https://github.com/rootsher/boilerplate-dev](https://github.com/rootsher/boilerplate-dev)
* [https://github.com/rootsher/boilerplate-frontend](https://github.com/rootsher/boilerplate-frontend)
* [https://github.com/rootsher/boilerplate-backend](https://github.com/rootsher/boilerplate-backend)
* [https://github.com/rootsher/boilerplate-infrastructure](https://github.com/rootsher/boilerplate-infrastructure)
