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
docker-machine version 0.16.1, build cce350d

$ docker-compose version
docker-compose version 1.23.2, build unknown
docker-py version: 3.6.0
CPython version: 3.7.2
OpenSSL version: OpenSSL 1.0.2q  20 Nov 2018

$ docker version
Client: Docker Engine - Community
 Version:           18.09.1
 API version:       1.39
 Go version:        go1.11.4
 Git commit:        4c52b90
 Built:             Thu Jan 10 03:21:29 2019
 OS/Arch:           darwin/amd64
 Experimental:      false

Server: Docker Engine - Community
 Engine:
  Version:          18.09.1
  API version:      1.39 (minimum version 1.12)
  Go version:       go1.10.6
  Git commit:       4c52b90
  Built:            Wed Jan  9 19:41:49 2019
  OS/Arch:          linux/amd64
  Experimental:     true
```

## Commands to get the environment working:

Create a new environment using Virtualbox and name it 'testing':
```
docker-machine create -d virtualbox testing
```

Take the created environment into use:
```
eval $(docker-machine env testing)
```

Start the HTTP application:
```
docker-compose up -d web
```

Test execution: Parameter for XML verification: xml-validation, for REST verification: rest-validation. A separate environment for dev/testing activities: validate-env
OBS: 1) The REST verification test are using the following service: http://echo.jsontest.com . 2) Should improve testing and recognize failing situations better.
```
docker-compose run 'parameter'
```

Shut down the test environment.
```
docker-compose down
```

Remove the test environment/cleanup.
```
docker-machine rm -f testing
```