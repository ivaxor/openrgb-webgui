FROM jlesage/baseimage-gui:ubuntu-24.04

ENV LANG=en_US.UTF-8
ENV KEEP_APP_RUNNING=1
ENV INSTALL_PACKAGES=git build-essential qtcreator qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools libusb-1.0-0-dev libhidapi-dev pkgconf libmbedtls-dev qttools5-dev-tools
ENV APP_NAME=OpenRGB
ENV APP_VERSION=0.9

WORKDIR /app

ARG APP_ICON_URL=https://gitlab.com/uploads/-/system/project/avatar/10582521/OpenRGB.png
RUN install_app_icon.sh $APP_ICON_URL

RUN curl --output openrgb_0.9_amd64_bookworm_b5f46e3.deb https://openrgb.org/releases/release_0.9/openrgb_0.9_amd64_bookworm_b5f46e3.deb
RUN curl --output plugins/OpenRGBEffectsPlugin_0.9_Bookworm_64_f1411e1.so https://openrgb.org/releases/plugins/effects/release_0.9/OpenRGBEffectsPlugin_0.9_Bookworm_64_f1411e1.so
RUN curl --output plugins/OpenRGBVisualMapPlugin_0.9_Bookworm_64_bbf30c4.so https://openrgb.org/releases/plugins/visualmap/release_0.9/OpenRGBVisualMapPlugin_0.9_Bookworm_64_bbf30c4.so
RUN curl --output plugins/OpenRGBHardwareSyncPlugin_0.9_Bookworm_64_dcefdd5.so https://openrgb.org/releases/plugins/hardwaresync/release_0.9/OpenRGBHardwareSyncPlugin_0.9_Bookworm_64_dcefdd5.so

RUN exec openrgb_0.9_amd64_bookworm_b5f46e3.deb --gui --server --server-port 6742
