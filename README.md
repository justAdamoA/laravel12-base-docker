<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" height="100" alt="Laravel Logo"></a><a href="https://docker.com" target="_blank"><img src="https://1000logos.net/wp-content/uploads/2021/11/Docker-Logo.png" height="100" alt="Laravel Logo"></a></p>

## Table of Contents
- [Abouts](#abouts)
  - [About this project](#about-this-project)
  - [About Laravel](#about-laravel)
  - [About Docker](#about-docker)
- [How to](#how-to)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Make commands](#make-commands)
- [License](#license)

## Abouts

### About this project
I wanted to create a base docker image that is a good starting point to work with Laravel. All you need to do is to run a simple command. And then, instead of installing, configurating and setting up your environment, you can focus on building your app.

This is an already generated laravel app with the following settings:

- PHP 8.4 and Node 22.14
- Laravel 12
- React Starter Kit with React 19
- Laravel authentication
- PostgreSQL 17 database
- Redis 7 for cache and sessions

If you are looking for a docker image where the first step is to create a new laravel app where you can select the starter kits and settings, you should visit my other laravel base project: ~~Laraver Creator Docker~~ *(Work in Progress)*.


### About Laravel
Laravel is a web application framework with expressive, elegant syntax. It is accessible, powerful and provides tools required for large, robust applications.

If you want to learn more about it, visit the [official site](https://laravel.com/).

### About Docker 
Docker is a platform for developing, shipping and running applications inside containers, which are lightweight, portable and isolated environments. It simplifies application deployment by packaging all dependencies together, ensuring consistent execution across different systems.

If you want to learn more about Docker and Docker Compose... well, after visiting the [official site](https://docker.com/) I guess you can watch some youtubes or read some blogs because it is a deep rabbit hole :)

## How to

### Prerequisites

#### Supported platforms
Currently supported OSs are Mac OS X and Linux. On Windows you need to setup **Make** commands first in order to use it but I'm gonna be honest with you... I've never tried, but if it works, let me know.

#### Make
Make is a build automation tool that simplifies compiling and linking software by managing dependencies and executing commands based on a configuration file called a Makefile. It streamlines the build process, ensuring only necessary components are rebuilt when changes occur.

On most Linux distributions it is installed by default. On Mac OS X you need Xcode or Xcode Command Line Tools in order to use it.

#### Docker
You need to install Docker to use this project. You can download it from the [official site](https://docker.com/) but that's it. No extra configuration is needed.

### Install

After cloning the repository all you have to do is to run the following command:

```shell
$ make first-run
```

This starts all the docker containers, migrates the database and starts Vite and Artisan dev environment. It's going to take several minutes and at one point it will ask you a Yes/No question regarding database creation. You should choose `Yes` obviously. So far I haven't found a way to skip this question.

You can check your brand new application on `localhost:8000`. You can also reach your application on `localhost:8080` hosted by nginx and fpm. This uses the built frontend.

If everything was done right, you should see something like this in your console:

<p align="center"><img src="https://i.imgur.com/vm02DJm.png" width="600" alt="Laravel Logo"></p>

### How to use it

Basically you have two options:

1) You use the built in dev environments run by Artisan and Vite, where changes are automatically shown. You can reach this on `localhost:8000`. With this method a react frontend, a laravel backend, queues and logs are all started. All you have to do is work on your app. It is recommended for early development. To start it, run the following command:

```shell
$ make up-dev
```

2) You build the frontend after changes with the command `make build-fe` but you don't have ro run the dev environments. You can reach your app on `localhost:8080` hosted by nginx and fpm. To start it this way, run:

```shell
$ make up
```

> [!IMPORTANT]  
> With the second method queues are not started automatically.
> You have to start them manually with the following command:
>
> ```shell
> $ make start-workers
> ```

### Make commands

| Command              | Description                                                  |
|----------------------|--------------------------------------------------------------|
| `make help`          | Show help. This is the default command a well                |
| `build`              | build the docker containers                                  |
| `build-fe`           | build the frontend                                           |
| `console`            | starts a shell                                               |
| `dotenv`             | create .env from .env.example if doesnt exist                |
| `down`               | stop the docker containers                                   |
| `first-run`          | setup and run laravel for the first time                     |
| `help`               | show help                                                    |
| `install`            | install dependencies                                         |
| `install-js`         | install js dependencies                                      |
| `install-php`        | install php dependencies                                     |
| `logs`               | show docker containers logs                                  |
| `migrate`            | migrate db                                                   |
| `restart`            | restarts the web and worker (to pick up changes is .env)     |
| `start`              | start docker and migrate                                     |
| `start-dev`          | start the dev environment                                    |
| `start-workers`      | start laravel workers                                        |
| `stop`               | stop the docker containers                                   | 
| `up`                 | start the @docker containers                                 |
| `up-dev`             | start the docker environment and laravel dev                 |
| `update`             | update dependencies                                          |
| `update-php`         | update php dependencies                                      |

## License

This is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).
