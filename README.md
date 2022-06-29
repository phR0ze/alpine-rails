alpine-rails
====================================================================================================
[![build-badge](https://github.com/phR0ze/alpine-rails/workflows/Build%20Docker%20Image/badge.svg)](https://github.com/phR0ze/alpine-rails/actions)
![docker-badge](https://img.shields.io/docker/v/phr0ze/alpine-rails?label=Docker%20Image)

Minimal environment for Rails apps intended to simplify running older Rails applications in a static 
runtime environment without making your app source static in the image. In this way you can tweak and 
modify your app souce then simply mount it in the static Rails runtime environment to run without 
having to worry about your local Rails configuration getting out of date or updated when your not 
expecting it to or any other local dev issue.

**Docker Image Size: 400 MB**

## Build
This image is intended to be depended upon by Rails apps. A app developer would write a Dockerfile 
calling out `FROM phr0ze/alpine-rails:3.16` and the `ONBUILD` commands from this base image would 
`COPY Gemfile /usr/src/app` and run `bundle install`.

1. Create your `Dockerfile` alongside your `Gemfile`, example:
   ```
   FROM phr0ze/alpine-rails:3.16
   ```
2. Build the new image
   ```
   $ docker build -t new-rails-app .
   ```

## Run

### Run Rails app

### Run interactive shell
```bash
$ docker run --rm -it phr0ze/alpine-rails bash
```

## Packages
Package details can be found with [Alpine's Package page](https://pkgs.alpinelinux.org/packages)

### Bash environment
| Package                   | Description
| ------------------------- | ------------------------------------------
| `bash`                    | The GNU Bourne Again shell
| `bash-completion`         | Command-line tab-completion for bash
| `ca-certificates`         | Common CA certificates PEM files
| `curl`                    | URL retrival utility and library

### Rails environment
| Package                   | Description
| ------------------------- | ------------------------------------------
| `build-base`              | Meta package for build base tooling for rails
| `build-dependencies`      | Meta package for build base tooling for rails
| `ruby-dev`                | An object-oriented language for quick and easy programming (development files)
| `ruby-json`               | Ruby JSON library
| `nodejs`                  | JavaScript runtime built on V8 engine - LTS version
| `sqlite`                  | C library that implements an SQL database engine
| `sqlite-dev`              | C library that implements an SQL database engine (development files)
| `tzdata`                  | Timezone data
| `yaml`                    | YAML 1.1 parser and emitter written in C
| `yaml-dev`                | YAML 1.1 parser and emitter written in C (development files)
| `yarn`                    | Fast, reliable, and secure dependency management for Node.js

## Configuration
* .bashrc
* .dircolors

## Update in DockerHub

### Update with Actions
1. Push up your changes to the repo
2. Cut a release with the tag version that will be used for the image e.g. `3.16`

### Update manually
```bash
$ docker login
$ docker tag alpine-rails:3.16 phr0ze/alpine-rails:3.16
$ docker push phr0ze/alpine-rails:3.16
$ docker tag alpine-rails:3.16 phr0ze/alpine-rails:latest
$ docker push phr0ze/alpine-rails:latest
`
