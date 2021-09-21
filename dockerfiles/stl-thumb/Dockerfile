FROM debian

RUN apt-get update && apt-get install -y \
        libgl1 libosmesa6-dev \
        parallel

ADD https://github.com/unlimitedbacon/stl-thumb/releases/download/v0.4.0/stl-thumb_0.4.0_amd64.deb /tmp/packages/
RUN dpkg -i /tmp/packages/stl-thumb_0.4.0_amd64.deb

VOLUME [ "/data" ]
WORKDIR /data
