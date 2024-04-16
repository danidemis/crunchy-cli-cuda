FROM linuxserver/ffmpeg
ENV TZ=Europe/Rome
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update && apt upgrade -y && apt -y install git wget build-essential 
#install for OpenVPN
RUN apt -y install curl openvpn unzip
WORKDIR /tmp
RUN git clone https://github.com/FFmpeg/nv-codec-headers.git
RUN cd nv-codec-headers && make install
RUN cd /tmp/
RUN apt-get -y install build-essential yasm cmake libtool libc6 libc6-dev unzip wget libnuma1 libnuma-dev ffmpeg
#RUN cd /tmp && git clone https://git.ffmpeg.org/ffmpeg.git && cd /tmp/ffmpeg && ./configure --enable-nvenc --enable-cuvid --enable-nonfree --enable-cuda-nvcc --enable-libnpp --extra-cflags=-I/usr/local/cuda/include --extra-ldflags=-L/usr/local/cuda/lib64 --disable-static --enable-shared
#RUN cd /tmp/ffmpeg && make -j 8
#RUN cd /tmp/ffmpeg && make install
#RUN cd ..
RUN cd /tmp/ && wget https://github.com/crunchy-labs/crunchy-cli/releases/download/v3.4.3/crunchy-cli-v3.4.3-linux-x86_64
RUN mv /tmp/crunchy-cli-v3.4.3-linux-x86_64 /usr/bin/crunchy-cli && chmod +x /usr/bin/crunchy-cli
WORKDIR /root
RUN mkdir /ffmpeg


WORKDIR /config
ENTRYPOINT ["/usr/bin/crunchy-cli"]
#CMD ["-h"]
