FROM devkitpro/devkita64:20210726

RUN ln -s /proc/self/mounts /etc/mtab
RUN dkp-pacman -Syyu --noconfirm switch-dev libnx \
    && dkp-pacman -Scc --noconfirm
RUN git clone -b 14_baseline_support https://github.com/Atmosphere-NX/libnx.git --depth=1 \
     && cd libnx \
     && make -j8 \
     && make install \
     && cd .. \
     && rm -rf libnx

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
