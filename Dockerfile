FROM amd64/debian:sid-slim

RUN apt update && apt upgrade -y
RUN apt install -y libfontconfig1 libxrender1 xfonts-75dpi xfonts-base gvfs colord glew-utils libvisual-0.4-plugins gstreamer1.0-tools opus-tools qt5-image-formats-plugins qtwayland5 qt5-qmltooling-plugins librsvg2-bin lm-sensors
RUN apt install -y libssl3

WORKDIR /root

ADD wkhtmltox_0.12.6.1-3.bookworm_amd64.deb /root
RUN dpkg -i wkhtmltox_0.12.6.1-3.bookworm_amd64.deb
RUN cp /usr/local/bin/wkhtmltopdf /usr/bin/wkhtmltopdf

ENTRYPOINT ["/usr/bin/wkhtmltopdf"]
