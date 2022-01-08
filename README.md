# [@rootsher/boilerplate-dev](https://github.com/rootsher/boilerplate-dev)

[![GitHub issues](https://img.shields.io/github/issues/rootsher/boilerplate-dev.svg)](https://github.com/rootsher/boilerplate-dev/issues)
[![GitHub PRs](https://img.shields.io/github/issues-pr/rootsher/boilerplate-dev.svg)](https://github.com/rootsher/boilerplate-dev/pulls)

## Requirements

* docker `20.10.8` (build `3967b7d`)
* docker-compose `1.29.2` (build `5becea4c`)
* make `3.81`

## Running

### Installation and first setup

This command downloads the necessary repositories, 
installs all dependencies and starts the project:

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

When services start, go to: [http://project.local](http://project.local)

## Troubleshooting

Show service logs:

```shell
$ make docker-compose COMMAND="logs -f [service]"
```
