FROM cgr.dev/chainguard/wolfi-base:latest AS build

WORKDIR /build

RUN apk add build-base git

RUN git clone https://github.com/edera-dev/lukko

RUN cd lukko && make -j$(nproc) && make -j$(nproc) check

FROM cgr.dev/chainguard/wolfi-base:latest AS final

RUN apk add libstdc++

COPY --from=build /build/lukko/liblukko.so /lib/liblukko.so

COPY --from=build /build/lukko/tests/ /examples/

RUN echo "/lib/liblukko.so" >> /etc/ld.so.preload

RUN /sbin/ldconfig -v -n /etc/ld.so.preload

WORKDIR /examples
