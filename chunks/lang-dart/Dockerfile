ARG base
FROM ${base}

USER root

# Dazzle does not rebuild a layer until one of its lines are changed. Increase this counter to rebuild this layer.
ENV TRIGGER_REBUILD=1

RUN set -ex \
    && curl -fsSL https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/dart.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/dart.gpg arch=amd64] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main" \
        | sudo tee /etc/apt/sources.list.d/dart_stable.list > /dev/null \
    && apt update \
    && install-packages \
        dart

USER gitpod

ENV PATH="$PATH:$HOME/.pub-cache/bin"

RUN set -ex \
    && dart pub global activate melos
