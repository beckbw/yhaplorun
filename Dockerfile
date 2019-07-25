FROM ubuntu:latest
USER root
RUN apt-get update && apt-get install -yq —no-install-recommends \
    bzip2 \
    git \
    wget \
    vim

RUN mkdir /tmp/work /tmp/scripts
RUN cd /tmp && git clone https://github.com/23andMe/yhaplo.git 

ADD run_yhaplo.sh /tmp/scripts/run_yhaplo.sh
RUN chmod +x /tmp/scripts/run_yhaplo.sh

ENTRYPOINT ["/tmp/scripts/run_yhaplo.sh"]
