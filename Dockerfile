FROM debian:11

ENV FLASH_SHA1=0df7b2467e5e5d778031ae10dbbd2ed52996a282

RUN apt-get update && apt-get install -y build-essential wget zlib1g-dev

WORKDIR /usr/app
RUN wget https://downloads.sourceforge.net/project/flashpage/FLASH-1.2.11.tar.gz
RUN echo "${FLASH_SHA1} FLASH-1.2.11.tar.gz" | sha1sum --check --status
RUN tar xzf FLASH-1.2.11.tar.gz 
WORKDIR /usr/app/FLASH-1.2.11
RUN make

RUN ln -s /usr/app/FLASH-1.2.11/flash /usr/local/bin