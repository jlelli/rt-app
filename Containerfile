FROM fedora:latest
USER root
COPY examples/simple_periodic.json /root
RUN dnf install -y json-c-devel numactl-devel automake autogen git libtool
RUN git clone https://github.com/jlelli/rt-app.git
RUN pushd rt-app \
    && git checkout container \
    && ./autogen.sh \
    && ./configure \
    && make \
    && make install \
    && popd \
    && rm -rf rt-app
WORKDIR /root
