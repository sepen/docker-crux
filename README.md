# docker-crux

CRUX Linux Unofficial Docker Images


## About these images

The `crux:latest` tag will always point the latest official CRUX release. Those releases are also tagged with their version (ie, `crux:latest` is an alias for `crux:3.7`, `crux:slim` is an alias for `crux:3.7-slim`, etc).

To artifacts required for these images are built using the [iso2tar.sh](https://github.com/sepen/docker-crux/blob/main/iso2tar.sh) tool. This tool converts a CRUX release from ISO format to TAR format, and then decompressing this TAR file we can extract packages and all resources necessary to generate the images.

The images tagged as `setup` are the ones that are made first. All other images use these `setup` images as part of multistage builds.

## Image Variants

`crux:slim` or `crux:<CRUX_VERSION>-slim`

These tags are an experiment in providing a slimmer base removing some extra files and packages that are normally not necessary within containers.
See the Dockerfile of those for more details about what gets removed during the "slimification" process.

`crux:setup` or `crux:<CRUX_VERSION>-setup`

The largest images. Wiith everything the CRUX ISO brings in /media/crux (core, opt and xorg packages, tools, boot files, etc.) and ready to use as installation media (see examples)

`crux:updated` or `crux:<CRUX_VERSION>-updated`

They are an up-to-date variant based on an unofficial CRUX ISO built with updated packages for avoiding long compile times due to updates after an official release. This updated ISO is contributed by Matt Housh and available from his site [crux.ninja](https://crux.ninja/).

For this variant, there are also subvariants like `updated-slim` and `updated-setup`, etc.


## Supported tags and respective Dockerfile links

* [`3.7`](https://github.com/sepen/docker-crux/blob/main/3.7/Dockerfile), [`latest`](https://github.com/sepen/docker-crux/blob/main/3.7/Dockerfile) 
* [`3.7-slim`](https://github.com/sepen/docker-crux/blob/main/3.7-slim/Dockerfile), [`slim`](https://github.com/sepen/docker-crux/blob/main/3.7-slim/Dockerfile)
* [`3.7-setup`](https://github.com/sepen/docker-crux/blob/main/3.7-setup/Dockerfile), [`setup`](https://github.com/sepen/docker-crux/blob/main/3.7-setup/Dockerfile) 
* [`3.7-updated`](https://github.com/sepen/docker-crux/blob/main/3.7-updated/Dockerfile), [`updated`](https://github.com/sepen/docker-crux/blob/main/3.7-updated/Dockerfile)
* [`3.7-updated-slim`](https://github.com/sepen/docker-crux/blob/main/3.7-updated-slim/Dockerfile), [`updated-slim`](https://github.com/sepen/docker-crux/blob/main/3.7-updated-slim/Dockerfile)
* [`3.7-updated-setup`](https://github.com/sepen/docker-crux/blob/main/3.7-updated-setup/Dockerfile), [`updated-setup`](https://github.com/sepen/docker-crux/blob/main/3.7-updated-setup/Dockerfile) 


## Examples:

To install or upgrade CRUX on a secondary partition (e.g. `/dev/sda2`) we can use the `setup` variant and do something like this:
```
$ sudo mount /dev/sda2 /mnt
$ docker run -it -v /mnt:/mnt sepen/crux:setup
$ sudo umount /mnt
```

To test building a port (with the `updated` variant)
```
$ docker run -it -v $(pwd)/ports:/tmp/ports sepen/crux:updated /bin/bash -c 'cd /tmp/ports/myport && pkgmk -d'
``` 

To test building a port with its dependencies (with the `updated` variant)

```
$ docker run -it -v $(pwd)/ports:/tmp/ports sepen/crux:updated /bin/bash -c 'prt-get depinst myport --config-prepend="prtdir /tmp/ports"'
```
