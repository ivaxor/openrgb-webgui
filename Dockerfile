FROM jlesage/baseimage-gui:ubuntu-24.04

ENV LANG=en_US.UTF-8
ENV KEEP_APP_RUNNING=1
ENV INSTALL_PACKAGES=git build-essential qtcreator qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools libusb-1.0-0-dev libhidapi-dev pkgconf libmbedtls-dev qttools5-dev-tools
ENV APP_NAME=OpenRGB
ENV APP_VERSION=0.9

ARG APP_ICON_URL=https://gitlab.com/uploads/-/system/project/avatar/10582521/OpenRGB.png
ARG OpenRGB_URL=https://openrgb.org/releases/release_0.9/openrgb_0.9_amd64_bookworm_b5f46e3.deb
ARG OpenRGBEffectsPlugin_URL=https://openrgb.org/releases/plugins/effects/release_0.9/OpenRGBEffectsPlugin_0.9_Bookworm_64_f1411e1.so
ARG OpenRGBVisualMapPlugin_URL=https://openrgb.org/releases/plugins/visualmap/release_0.9/OpenRGBVisualMapPlugin_0.9_Bookworm_64_bbf30c4.so
ARG OpenRGBHardwareSyncPlugin_URL=https://openrgb.org/releases/plugins/hardwaresync/release_0.9/OpenRGBHardwareSyncPlugin_0.9_Bookworm_64_dcefdd5.so
ARG OpenRGBFanSyncPlugin_URL=https://gitlab.com/OpenRGBDevelopers/OpenRGBFanSyncPlugin/-/jobs/artifacts/master/download?job=Linux+amd64+.deb+(Debian+Bookworm)
ARG OpenRGBE131ReceiverPlugin_URL=https://gitlab.com/OpenRGBDevelopers/OpenRGBE131ReceiverPlugin/-/jobs/artifacts/master/download?job=Linux+amd64+.deb+(Debian+Bookworm)
ARG OpenRGBSchedulerPlugin_URL=https://gitlab.com/OpenRGBDevelopers/OpenRGBSchedulerPlugin/-/jobs/artifacts/master/download?job=Linux+amd64+.deb+(Debian+Bookworm)

WORKDIR /app

RUN install_app_icon.sh $APP_ICON_URL

RUN curl --output OpenRGB.deb $OpenRGB_URL
RUN curl --output plugins/OpenRGBEffectsPlugin.so $OpenRGBEffectsPlugin_URL
RUN curl --output plugins/OpenRGBVisualMapPlugin.so $OpenRGBVisualMapPlugin_URL
RUN curl --output plugins/OpenRGBHardwareSyncPlugin.so $OpenRGBHardwareSyncPlugin_URL
RUN curl --output plugins/OpenRGBFanSyncPlugin.so $OpenRGBFanSyncPlugin_URL
RUN curl --output plugins/OpenRGBE131ReceiverPlugin.so $OpenRGBE131ReceiverPlugin_URL
RUN curl --output plugins/OpenRGBSchedulerPlugin.so $OpenRGBSchedulerPlugin_URL

RUN exec OpenRGB.deb --gui --server --server-port 6742
