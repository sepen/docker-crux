# **CRUX** Linux Docker Images (Unofficial)

This document provides a breakdown of the available Docker image tags for the CRUX Linux distribution. Each tag corresponds to a specific version or variant of CRUX, designed for different architectures or use cases.

## CRUX 3.7 for 64-bit Intel/AMD architectures

| Image tag  | Description |
| ---------- | ----------- |
| `crux:3.7` | Base image for CRUX version 3.7 (default architecture `amd64`). |
| `crux:3.6` | Base image for CRUX version 3.6 (default architecture `amd64`). |
| `crux:latest` | Latest stable CRUX version (default architecture `amd64`). |
| `crux:3.7-setup` | Setup variant of CRUX 3.7 (default architecture `amd64`). Likely a minimal image to start a CRUX installation. |
| `crux:3.7-updated` | Updated variant for CRUX 3.7 (default architecture `amd64`). Includes the latest patches and updates. |
| `crux:3.7-slim` | Slim variant for CRUX 3.7 (default architecture `amd64`). A minimal version with fewer packages for optimized performance. |

## CRUX for ARM Architectures

| Image tag | Description |
| -------------------- | ----------------------------------------- |
| `crux:3.7-arm64` | CRUX 3.7 for ARMv8 (64-bit) architecture. |
| `crux:3.7-armhf` | CRUX 3.7 for ARMv7 (32-bit) architecture. |
| `crux:3.7-arm64-builder` | Builder variant for CRUX 3.7 (ARMv8/64-bit) architecture. Includes fakeroot and git packages. |
| `crux:3.7-armhf-builder` | Builder variant for CRUX 3.7 (ARMv7/32-bit) architecture. Includes fakeroot and git packages. |
| `crux:3.7-updated-arm64` | Updated variant for CRUX 3.7 (ARMv8/64-bit) architecture. Includes the latest patches and updates. |
| `crux:3.7-updated-arm64-builder` | Updated and builer variant for CRUX 3.7 (ARMv8/64-bit) architecture. Includes the latest patches, updates and fakeroot and git packages. |

## General Naming Convention

CRUX images are versioned and categorized based on architecture and build variant. The tags follow a consistent naming convention, making it easy to identify both the version and type of image.

### Base Image Tags

The base image tags follow the format: `crux:<version>`

Where `<version>` represents the version of CRUX (e.g., `3.6`, `3.7`, `3.7-updated`, etc.). This is the primary version of the image for the default architecture x86_64 (aka. `amd64`).
Examples include:

- `crux:3.7`
- `crux:3.6`
- `crux:3.7-updated`

### Latest Tag

The `latest` tag always points to the most recent stable version of the CRUX image. If no architecture is specified, Docker will default to the `amd64` architecture.

- `crux:latest` → points to `crux:3.7` (or the latest stable version).


### Variant Tags

CRUX also provides variant tags for different use cases. These include setup, updated, and slim versions.
The format for these tags is:

`crux:<version>-<variant>`

Where `<variant>` can be:

- `setup`: Setup variant, typically used for environment initialization and ready to use as installation media (see examples)
- `updated`: Updated variant, which contains patches or updates on top of the base image.
- `slim`: Base image with a minimal set of packages.

For example:

- `crux:3.6-setup`
- `crux:3.6-updated`
- `crux:3.7-slim`

The latest tags for these variants are also available:

- `crux:setup` → points to `crux:3.7-setup` (or the latest setup variant).
- `crux:updated` → points to `crux:3.7-updated` (or the latest updated variant).
- `crux:slim` → points to `crux:3.7-slim` (or the latest updated variant).


## Architecture-Specific Tags

CRUX supports multiple architectures, and these are reflected in the image tags using architecture-specific suffixes:

`crux:<version>-<arch>`

Where `<arch>` can be one of the following:

- `armhf` for ARMv7 (32-bit architecture)
- `arm64` for ARMv8 (64-bit architecture)
- `amd64` (x86_64) for 64-bit Intel/AMD architectures (default, no need to specify)

For example:

- `crux:3.7-armhf` → CRUX 3.7 for ARMv7 (32-bit).
- `crux:3.7-arm64` → CRUX 3.7 for ARMv8 (64-bit).
- `crux:3.7-amd64` → CRUX 3.6 for 64-bit Intel/AMD architectures.

If no architecture is specified, Docker will assume `amd64` (default architecture):

- `crux:3.7` → CRUX 3.7 for x86_64.
- `crux:latest` → Latest CRUX version for x86_64.

### Architecture-Specific Variant Tags

CRUX also provides architecture-specific variant images. These follow the same pattern as the base images and include the `setup` and `updated` variants:

`crux:<version>-<arch>-<variant>`

Where `<arch>` is the architecture (`armhf`, `arm64`, `amd64`), and `<variant>` can be `setup`, `slim` or `updated`.

For example:

- `crux:3.7-updated-armhf`
- `crux:3.7-updated-arm64`
- `crux:3.6-amd64-slim`

The latest tags for these variants are available as well:

- `crux:armhf` → latest CRUX for ARMv7 (32-bit).
- `crux:arm64` → latest CRUX for ARMv8 (64-bit).


## Example Tag Breakdown

| Image Tag                           | Description                                                     |
|-------------------------------------|-----------------------------------------------------------------|
| `crux:3.7`                          | Base image for CRUX version 3.7 (default architecture `amd64`)  |
| `crux:3.6`                          | Base image for CRUX version 3.6 (default architecture `amd64`)  |
| `crux:latest`                       | Latest version of CRUX (default architecture `amd64`)           |
| `crux:3.7-setup`                    | Setup variant for CRUX 3.7 (default architecture `amd64`)       |
| `crux:3.7-updated`                  | Updated variant for CRUX 3.7 (default architecture `amd64`)     |
| `crux:3.7-slim`                     | Slim variant for CRUX 3.7 (default architecture `amd64`)        |
| `crux:3.7-armhf`                    | CRUX 3.7 for ARMv7 (32-bit) architecture                        |
| `crux:3.7-arm64`                    | CRUX 3.7 for ARMv8 (64-bit) architecture                        |
| `crux:armhf`                        | Latest CRUX for ARMv7 (32-bit) architecture                     |
| `crux:arm64`                        | Latest CRUX for ARMv8 (64-bit) architecture                     |
| `crux:3.7-updated-armhf`            | Updated variant for CRUX 3.7 (ARMv7/32-bit) architecture        |
| `crux:3.7-updated-arm64`            | Updated variant for CRUX 3.7 (ARMv8/64-bit) architecture        |

## Multi-Architecture Support

CRUX images also support multi-architecture builds. When a user pulls an image without specifying an architecture, Docker will automatically pull the appropriate image for the host platform. This includes the default `amd64` architecture as well as `armhf` and `arm64` for ARM-based systems.

For example:

- `crux:3.7` will automatically resolve to `crux:3.7-amd64` on an Intel/AMD-based system and `crux:3.7-armhf` or `crux:3.7-arm64` depending on the architecture of the system pulling the image.

## How to Use the Tags

### Pull the Latest Version of CRUX for Your Architecture
To pull the latest image for your platform (architecture-specific):

```bash
docker pull crux:latest        # For default architecture (amd64)
docker pull crux:armhf         # For ARMv7 (32-bit)
docker pull crux:arm64         # For ARMv8 (64-bit)
```

### Pull a Specific Version for a Given Architecture
To pull a specific version of CRUX for a particular architecture:

```shell
docker pull crux:3.7           # Default architecture (amd64)
docker pull crux:3.7-armhf     # ARMv7 (32-bit)
docker pull crux:3.7-arm64     # ARMv8 (64-bit)
```

### Pull a Variant for a Specific Version and Architecture
To pull a specific variant (e.g., setup, updated) for a particular version and architecture:

```shell
docker pull crux:3.7-setup          # Default architecture (amd64)
docker pull crux:3.7-updated-arm64  # ARMv8 (64-bit) updated variant
docker pull crux:3.7-updated-armhf  # ARMv7 (32-bit) updated variant
```

## Using CRUX Docker Images for Installing or Upgrade a CRUX system

To install or upgrade CRUX on a secondary partition (e.g. `/dev/sda2`) we can use the `setup` variant and do something like this:

```shell
# mount the partition
sudo mount /dev/sda2 /mnt
# run a container and share the mountpoint as a volume
docker run -it -v /mnt:/mnt sepen/crux:setup
# umount the partition
sudo umount /mnt
```

## Using CRUX Docker Images for Building CRUX Ports

To test building a port (with the `updated` variant)
```shell
# run a container and use a local folder as a volume to store ports
# then execute `pkgmk` to build inside the container
docker run -it -v $(pwd)/ports:/tmp/ports sepen/crux:updated \
   /bin/bash -c 'cd /tmp/ports/myport && pkgmk -d'
```

To test building a port with its dependencies (with the `updated` variant)
```shell
# run a container and use a local folder as a volume to store ports
# then execute `prt-get` to build with deps inside the container
docker run -it -v $(pwd)/ports:/tmp/ports sepen/crux:updated \
   /bin/bash -c 'prt-get depinst myport --config-prepend="prtdir /tmp/ports"'
```