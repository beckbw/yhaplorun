FROM ubuntu:latest
USER root
RUN apt-get update && apt-get install -yq \
    bzip2 \
    git \
    python-dev \
    wget \
    vim

ARG WRKD=/tmp/work 
ARG SCRD=/tmp/scripts 

#RUN mkdir /tmp/work /tmp/scripts
RUN mkdir ${WRKD} ${SCRD}
RUN cd /tmp && git clone https://github.com/23andMe/yhaplo.git 

#ADD run_yhaplo.sh /tmp/scripts/run_yhaplo.sh
#RUN chmod +x /tmp/scripts/run_yhaplo.sh
ADD run_yhaplo.sh ${SCRD}/run_yhaplo.sh
RUN chmod +x ${SCRD}/run_yhaplo.sh

WORKDIR ${WRKD}

ENTRYPOINT ["/tmp/scripts/run_yhaplo.sh"]
