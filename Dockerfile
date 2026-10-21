FROM ubuntu:22.04

LABEL org.opencontainers.image.title="CueTracker LiveStream"
LABEL org.opencontainers.image.source="https://github.com/CueTracker/cuetracker-livestream-downloads"

RUN apt-get update \
    && apt-get install --yes --no-install-recommends ca-certificates curl libglib2.0-0 libgomp1 \
    && rm -rf /var/lib/apt/lists/* \
    && useradd --create-home --uid 1000 studio \
    && mkdir /data \
    && chown studio:studio /data

WORKDIR /opt/cuetracker
COPY CueTrackerCameraStudio/ ./

ENV STUDIO_DATA=/data STUDIO_ROOT=/data
USER studio
VOLUME /data
EXPOSE 8765 8769 8900-8999

HEALTHCHECK --interval=30s --timeout=5s \
    CMD curl --fail --silent http://127.0.0.1:8765/healthz >/dev/null || exit 1

CMD ["/opt/cuetracker/CueTrackerCameraStudio", "--no-browser", "--no-tray", "--listen", "0.0.0.0"]
