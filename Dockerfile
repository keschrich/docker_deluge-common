FROM debian:stretch-slim
LABEL maintainer=kennethj@eschrich.us

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        gettext \
        geoip-database \
        git \
        intltool \
        libtorrent-rasterbar9 \
        python \
        python-chardet \
        python-geoip \
        python-libtorrent \
        python-mako \
        python-openssl \
        python-setproctitle \
        python-setuptools \
        python-twisted \
        python-twisted-web \
        python-xdg \
    && \
    mkdir /build && \
    cd /build && \
    git clone git://deluge-torrent.org/deluge.git && \
    cd deluge && \
    git checkout deluge-1.3.15 && \
    cd /build/deluge && \
    python setup.py build && \
    python setup.py build_plugins && \
    python setup.py install && \
    cd / && \
    rm -rf /build && \
    apt-get remove -y --purge \
        git \
    && \
    apt-get autoremove -y --purge && \
    rm -rf /var/lib/apt/lists/*

CMD ["bash"]
