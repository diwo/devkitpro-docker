# https://devkitpro.org/wiki/devkitPro_pacman#Customising_Existing_Pacman_Install

FROM archlinux:20200106

ENV DEVKITPRO=/opt/devkitpro
ENV DEVKITARM=/opt/devkitpro/devkitARM
ENV DEVKITPPC=/opt/devkitpro/devkitPPC

ADD pacman-dkp.conf /docker/

RUN pacman-key --init \
 && pacman-key --recv F7FD5492264BB9D0 \
 && pacman-key --lsign F7FD5492264BB9D0 \
 && pacman -U --noconfirm https://downloads.devkitpro.org/devkitpro-keyring-r1.787e015-2-any.pkg.tar.xz \
 && cat /docker/pacman-dkp.conf >> /etc/pacman.conf \
 && pacman -Syu --noconfirm \
 && pacman -Fy \
 && pacman -S --needed --noconfirm base-devel

RUN pacman -S --needed --noconfirm \
  switch-dev \
  3ds-dev

