FROM alpine:3.6 AS portable_ffmpeg_build

RUN apk add --no-cache \
    autoconf \
    automake \
    build-base \
    bzip2 \
    cmake \
    git \
    libtool \
    nasm \
    pkgconf \
    texinfo \
    wget \
    yasm\
    zlib-dev

WORKDIR /ffmpeg_bin

COPY Makefile /ffmpeg_bin/build_ffmpeg/Makefile
RUN make -j 8 -f /ffmpeg_bin/build_ffmpeg/Makefile


FROM alpine:3.6

# Set up environment vars
ENV APP_DIR=/service

RUN mkdir -p $APP_DIR
WORKDIR $APP_DIR

# Install dependencies
RUN apk add --no-cache \
    bash \
    libjpeg \
    libmagic \
    libcurl \
    libstdc++\
    python3 \
    sudo\
    zlib

COPY bunny_short_14s.mov $APP_DIR
COPY transcode.sh $APP_DIR
COPY --from=portable_ffmpeg_build ffmpeg_bin/bin/ffmpeg ffmpeg_bin/bin/ffprobe  /usr/local/bin/

CMD ["sh", "transcode.sh"]
