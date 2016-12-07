FROM alpine:3.4

MAINTAINER Wataru MIYAGUNI <gonngo@gmail.com>

#
# Install Emacs
#
#   https://pkgs.alpinelinux.org/package/edge/testing/x86_64/emacs
#
RUN apk add --no-cache \
            --repository http://dl-3.alpinelinux.org/alpine/edge/community/ \
            emacs

#
# Install Cask
#
#   https://github.com/cask/cask
#
ENV CASK /opt/cask
ENV CASK_BIN "$CASK/bin"

# Delete `git` that was used only to fetch the cask
RUN apk add --no-cache --virtual cask-install-deps git \
    && apk add --no-cache \
           python \
           gnutls-utils \
    && git clone --depth 1 https://github.com/cask/cask.git "$CASK" \
    && apk del cask-install-deps

ENV PATH $CASK_BIN:$PATH
