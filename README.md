# Dockerized test environment for XML and REST validation

The test environment is based on Alpine and Nginx images in Docker containers.
It is created fairly easily using [docker-compose](https://docs.docker.com/compose/).

Used test framework: [Robot Framework](https://github.com/robotframework/robotframework)
1) Dependency test libraries/modules are installed during the setup and execution phase.
2) Currently included testing activities: XML and REST reply verifications.
3) Does not use SeleniumLibrary or browsers.

## Versions used in development/testing:
```
$ docker-machine version
docker-machine version 0.16.0, build 702c267f

$ docker-compose version
docker-compose version 1.23.2, build unknown
docker-py version: 3.6.0
CPython version: 3.7.1
OpenSSL version: OpenSSL 1.0.2q  20 Nov 2018

$ docker version
Client:
 Version:           18.09.0-ce
 API version:       1.39
 Go version:        go1.11.2
 Git commit:        4d60db4
 Built:             unknown-buildtime
 OS/Arch:           darwin/amd64
 Experimental:      false

Server: Docker Engine - Community
 Engine:
  Version:          18.09.0
  API version:      1.39 (minimum version 1.12)
  Go version:       go1.10.4
  Git commit:       4d60db4
  Built:            Wed Nov  7 00:55:00 2018
  OS/Arch:          linux/amd64
  Experimental:     true
```

## Commands to get the environment working:

A new environment is created using Virtualbox and it is named as: testing 
```
docker-machine create -d virtualbox testing
```

Take the (newly) created environment into use.
```
eval $(docker-machine env testing)
```

HTTP application is started.
```
docker-compose up -d web
```

Test execution: Parameter for XML verification: xml-validation, for REST verification: rest-validation. A separate environment for dev/testing activities: validate-env
OBS: 1) The REST verification test are using the following service: http://echo.jsontest.com . 2) Should improve testing and recognize failing situations better.
```
docker-compose run 'parameter'
```

Shut down the whole test environment.
```
docker-compose down
```

Remove the whole test environment/cleanup.
```
docker-machine rm -f testing
```
