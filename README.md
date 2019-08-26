# keschrich/deluge-common Docker image
## Description
**keschrich/deluge-common** ([Docker Hub](https://hub.docker.com/r/keschrich/deluge-common)) is the Docker base image used by **keschrich/deluged** ([Docker Hub](https://hub.docker.com/r/keschrich/deluged), [GitHub](https://github.com/keschrich/docker_deluged)) and **keschrich/deluge-web** ([Docker Hub](https://hub.docker.com/r/keschrich/deluge-web), [GitHub](https://github.com/keschrich/docker_deluge-web)).

It is itself based on *debian:stretch-slim* and contains the Deluge binaries, built from the source in the [Deluge Git repository](https://git.deluge-torrent.org/deluge). Presently installed is **Deluge 1.3.15**.

Many of the existing Deluge containers in Docker Hub utilize multiple running processes in a single container: deluge, the web interface, and sometimes even OpenVPN. I prefer to have each container run a single process, hence the creation of yet another set of container images. The two containers are designed to work together, and can easily be used in conjuction with an OpenVPN container, such as **dperson/openvpn-client** ([Docker Hub](https://hub.docker.com/r/dperson/openvpn-client)), and/or a reverse proxy container.
## Usage
This container image typically would not be used on it's own, rather it is used as the *FROM* image for both *keschrich/deluged* and *keschrich/deluge-web*. Example commands for running each can be found in their respective readme files.

Example docker-compose files running both services can be found here: [https://github.com/keschrich/docker_deluge-common/tree/master/examples](https://github.com/keschrich/docker_deluge-common/tree/master/examples).