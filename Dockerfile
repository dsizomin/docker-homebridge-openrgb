FROM debian:bookworm-slim

WORKDIR /home/root
RUN \
    apt-get update && \
    apt-get install -y curl unzip && \
    curl -L https://gitlab.com/CalcProgrammer1/OpenRGB/-/jobs/artifacts/master/download?job=Linux+armhf+.deb+%28Debian%20Bookworm%29 -o openrgb.zip && \
    unzip openrgb.zip && \
    apt --fix-broken install -y ./*.deb
EXPOSE 6742
ENTRYPOINT ["openrgb", "--server"]
