FROM debian:bookworm-slim

WORKDIR /home/
RUN apt-get update && apt-get install -y curl unzip
RUN curl -L https://gitlab.com/CalcProgrammer1/OpenRGB/-/jobs/artifacts/master/download?job=Linux+armhf+.deb+%28Debian%20Bookworm%29 -o openrgb.zip
RUN unzip openrgb.zip
RUN apt --fix-broken install -y ./*.deb
EXPOSE 6742
ENTRYPOINT ["openrgb", "--server", "-vv"]
