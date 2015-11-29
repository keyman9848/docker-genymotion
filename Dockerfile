FROM thenewvu/virtualbox
MAINTAINER Vu Le "thenewvu@gmail.com"

# copy setup to the image
COPY genymotion-2.5.2_x64.bin /tmp/genymotion.bin

# install needed packages
RUN sudo apt-get update && \
    sudo apt-get install -y libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev

# install genymotion
RUN sudo chmod u+x /tmp/genymotion.bin && \
    echo "y" | sudo /tmp/genymotion.bin -d /opt

# clean up
RUN sudo rm -rf /tmp/genymotion.bin && \
    sudo apt-get clean && \
    sudo rm -rf /var/lib/apt/lists/*

# start genymotion at container start up
ENTRYPOINT ["/opt/genymotion/genymotion"]
