FROM sworthlabs/kali-base:default

ARG EXTRA_PACKAGES=""
RUN apt-get update && apt-get install -y ${EXTRA_PACKAGES} && apt-get clean
