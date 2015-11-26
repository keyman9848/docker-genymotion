FROM thenewvu/virtualbox
MAINTAINER Vu Le "thenewvu@gmail.com"

COPY genymotion-2.5.2_x64.bin /home/vu

RUN sudo apt-get update && \
    sudo apt-get install -y libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev

RUN sudo chmod u+x /home/vu/genymotion-2.5.2_x64.bin

RUN echo "y" | sudo /home/vu/genymotion-2.5.2_x64.bin -d /opt

RUN sudo rm -rf /home/vu/genymotion-2.5.2_x64.bin && \
    sudo apt-get clean && \
    sudo rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/opt/genymotion/genymotion"]
