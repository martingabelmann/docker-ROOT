FROM ubuntu:14.04
MAINTAINER martin@gabelmann.biz

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y git dpkg-dev make g++ gcc \
    binutils libx11-dev libxpm-dev libxft-dev \ 
    libxext-dev libpng12-dev libjpeg-turbo8-dev \
    python gfortran libssl-dev wget

ENV ROOT_VERSION="6.05.02"
ENV ROOT_TAR="root_v${ROOT_VERSION}.source.tar.gz" \
    ROOT_DL="https://root.cern.ch/download/root_v${ROOT_VERSION}.source.tar.gz" \
    ROOTSYS="/cern/root-${ROOT_VERSION}"
ENV PATH="$ROOTSYS/bin:$PATH" \
    LD_LIBRARY_PATH="$ROOTSYS/lib:$LD_LIBRARY_PATH" 

RUN mkdir /cern && cd /cern \
    && wget $ROOT_DL \
    && tar xzfv $ROOT_TAR \
    && rm -f $ROOT_TAR \
    && cd $ROOTSYS \
    && ./configure linuxx8664gcc \
    && make

ADD run-root /usr/local/sbin/run-root

WORKDIR /tmp/

ENTRYPOINT ["run-root"]
