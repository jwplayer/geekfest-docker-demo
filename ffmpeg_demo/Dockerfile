FROM alpine:3.6

# Set up environment vars
ENV APP_DIR=/service

RUN mkdir -p $APP_DIR
WORKDIR $APP_DIR

# Install dependencies
RUN apk add --no-cache \
    bash \
    sudo\
    ffmpeg

COPY bunny_short_14s.mov $APP_DIR
COPY movietrailer_hq.webm $APP_DIR
COPY transcode.sh $APP_DIR

CMD ["sh", "transcode.sh"]
