FROM gcr.io/tensorflow/tensorflow:latest-devel

RUN dpkg --add-architecture i386
RUN apt-get update && apt-get install -y \
  wget \
  libc6:i386 libstdc++6:i386 \
  zlib1g:i386

WORKDIR /root
RUN wget http://dl.google.com/android/android-sdk_r24.2-linux.tgz
RUN tar -xvf android-sdk_r24.2-linux.tgz
RUN wget https://dl.google.com/android/repository/android-ndk-r13b-linux-x86_64.zip
RUN unzip android-ndk-r13b-linux-x86_64.zip

WORKDIR /root/android-sdk-linux/tools
RUN ./android update sdk --no-ui
