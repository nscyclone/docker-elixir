# docker-elixir

[![Docker pulls](https://img.shields.io/docker/pulls/nscyclone/elixir.svg?style=flat-square)](https://hub.docker.com/r/nscyclone/elixir/)
[![License](https://img.shields.io/github/license/nscyclone/docker-elixir.svg?style=flat-square)](https://github.com/nscyclone/docker-elixir/blob/master/LICENSE)

[`docker-elixir`](https://github.com/nscyclone/docker-elixir/) is a [Docker](https://github.com/docker/docker) image of the [latest](https://github.com/elixir-lang/elixir/releases/latest) stable release of [Elixir](https://github.com/elixir-lang/elixir).

## What is Elixir?

[Elixir](https://github.com/elixir-lang/elixir) is a dynamic, functional language designed for building scalable and maintainable applications.

To learn more about [Elixir](https://github.com/elixir-lang/elixir) please check the [official guide](http://elixir-lang.org/getting-started/introduction.html) or visit [Elixir School](https://elixirschool.com).

## Usage

### Use as a part of another `Dockerfile`:

```docker
FROM nscyclone/elixir
```

### Use as an [Elixir](https://github.com/elixir-lang/elixir) REPL:

#### Build:

##### From [GitHub](https://github.com/nscyclone/docker-elixir/):

```shell
$ docker build github.com/nscyclone/docker-elixir -t elixir
```

##### Or from [Docker Hub](https://hub.docker.com):

```shell
$ docker pull nscyclone/elixir
```

#### Run:

```elixir
$ docker run -it --rm nscyclone/elixir
Erlang/OTP 19 [erts-8.2] [source-fbd2db2] [64-bit] [smp:4:4] [async-threads:10] [hipe] [kernel-poll:false]

Interactive Elixir (1.4.1) - press Ctrl+C to exit (type h() ENTER for help)
iex> System.version
"1.4.1"
```

## Issues

If you have any troubles using this image feel free to [submit an issue](https://github.com/nscyclone/docker-elixir/issues/new).