# lukko-demo

This project generates an image based on [Wolfi](https://github.com/wolfi-dev) which has Lukko
installed and enabled in the image.

## Running the demo image

### Docker / Podman

    $ docker run --rm -it ghcr.io/edera-dev/lukko-demo:latest
    .../examples# ./buffer-overflow
    Illegal instruction

### Krata

    $ kratactl launch -a ghcr.io/edera-dev/lukko-demo:latest
    .../examples# ./buffer-overflow
    Illegal instruction

