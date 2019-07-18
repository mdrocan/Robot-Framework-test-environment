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
docker-compose version 1.24.1, build unknown
docker-py version: 3.7.3
CPython version: 3.7.4
OpenSSL version: OpenSSL 1.0.2s  28 May 2019

$ docker version
Client: Docker Engine - Community
 Version:           18.09.7
 API version:       1.39
 Go version:        go1.12.6
 Git commit:        2d0083d
 Built:             Thu Jun 27 22:52:31 2019
 OS/Arch:           darwin/amd64
 Experimental:      false

Server: Docker Engine - Community
 Engine:
  Version:          18.09.2
  API version:      1.39 (minimum version 1.12)
  Go version:       go1.10.6
  Git commit:       6247962
  Built:            Sun Feb 10 04:13:06 2019
  OS/Arch:          linux/amd64
  Experimental:     false
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

Test execution:
i) XML verification: xml-validation ii) REST verification: rest-validation

A separate environment for dev/testing activities: validate-env

Notice:

1) The REST verification test is using the following service: http://echo.jsontest.com
2) Recognizing failing situations haven't been implemented properly.
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