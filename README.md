# Kleister: Web UI

[![Build Status](http://github.dronehippie.de/api/badges/kleister/kleister-ui/status.svg)](http://github.dronehippie.de/kleister/kleister-ui)
[![Stories in Ready](https://badge.waffle.io/kleister/kleister-api.svg?label=ready&title=Ready)](http://waffle.io/kleister/kleister-api)
[![Join the Matrix chat at https://matrix.to/#/#kleister:matrix.org](https://img.shields.io/badge/matrix-%23kleister%3Amatrix.org-7bc9a4.svg)](https://matrix.to/#/#kleister:matrix.org)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/74862ecc4341446185e40b15a9032f64)](https://www.codacy.com/app/kleister/kleister-scripts?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=kleister/kleister-scripts&amp;utm_campaign=Badge_Grade)
[![Go Doc](https://godoc.org/github.com/kleister/kleister-ui?status.svg)](http://godoc.org/github.com/kleister/kleister-ui)
[![Go Report](http://goreportcard.com/badge/github.com/kleister/kleister-ui)](http://goreportcard.com/report/github.com/kleister/kleister-ui)
[![](https://images.microbadger.com/badges/image/kleister/kleister-ui.svg)](http://microbadger.com/images/kleister/kleister-ui "Get your own image badge on microbadger.com")

**This project is under heavy development, it's not in a working state yet!**

Where does this name come from or what does it mean? It's quite simple, it's one
german word for paste/glue, I thought it's a good match as it glues together the
modpacks for Minecraft.


## Build

This project requires NodeJS to build the sources, the installation of NodeJS
won't be covered by those instructions. To build the sources just execute the
following command after NodeJS setup:

```
yarn install
yarn build
```

If you also want to publish it as a single binary with our server based on Go
make sure you have a working Go environment, for further reference or a guide
take a look at the [install instructions](http://golang.org/doc/install.html).
As this project relies on vendoring of the dependencies and we are not
exporting `GO15VENDOREXPERIMENT=1` within our makefile you have to use a Go
version `>= 1.6`

```bash
go get -d github.com/kleister/kleister-ui
cd $GOPATH/src/github.com/kleister/kleister-ui
make generate build

./kleister-ui -h
```

With the `make generate` command we are embedding all the static assets into the
binary so there is no need for any webserver or anything else beside launching
this binary.


## Development

To start developing on this UI you have to execute only a few commands. To setup
a NodeJS environment or even a Go environment is out of the scope of this
document. To start development just execute those commands:

```
yarn install
yarn watch
./kleister-ui --debug server --static dist/static/
```

The development server reloads the used assets on every request. So in order to
properly work with it you need to start the API separately.

After launching this command on a terminal you can access the web interface at
[http://localhost:9000](http://localhost:9000)


## Contributing

Fork -> Patch -> Push -> Pull Request


## Authors

* [Thomas Boerger](https://github.com/tboerger)


## License

Apache-2.0


## Copyright

```
Copyright (c) 2016 Thomas Boerger <http://www.webhippie.de>
```
