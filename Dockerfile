# Copyright 2015 Sean Nelson <audiohacked@gmail.com>
FROM java:7-jre
MAINTAINER Sean Nelson <audiohacked@gmail.com>

#ARG BASE_URL="http://ftb.cursecdn.com/FTB2/modpacks/FTBInfinity"
ENV BASE_URL="http://addons-origin.cursecdn.com/files/2270"
#ARG FTB_VERSION="2_2_2"
ENV FTB_VERSION="338"
ENV SERVER_FILE="FTBInfinityServer.zip"
ENV SERVER_PORT 25565

WORKDIR /minecraft

USER root
COPY CheckEula.sh /minecraft/
# RUN apt-get update && apt-get install -y tmux
RUN useradd -m -U minecraft && \
    mkdir -p /minecraft/world && \
    curl -SLO ${BASE_URL}/${FTB_VERSION}/${SERVER_FILE}  && \
    unzip ${SERVER_FILE} && \
    chmod u+x FTBInstall.sh ServerStart.sh CheckEula.sh && \
    rm eula.txt && \
    sed -i '2i /bin/bash /minecraft/CheckEula.sh' /minecraft/ServerStart.sh && \
    chown -R minecraft:minecraft /minecraft

USER minecraft
RUN /minecraft/FTBInstall.sh
EXPOSE ${SERVER_PORT}
VOLUME ["/minecraft/world"]

# CMD tmux new -s minecraft -d /home/minecraft/ServerStart.sh
CMD ["/bin/bash", "/minecraft/ServerStart.sh"]
