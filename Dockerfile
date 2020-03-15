#Build this docker file using
#docker build -t docker_image_name .

FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update

# Install lots of packages
RUN apt-get update && apt-get install -y libxcb-keysyms1-dev libxcb-image0-dev \
    libxcb-shm0-dev libxcb-icccm4-dev libxcb-sync0-dev libxcb-xfixes0-dev \
    libxcb-shape0-dev libxcb-randr0-dev libxcb-render-util0-dev \
    libfontconfig1-dev libfreetype6-dev libx11-dev libxext-dev libxfixes-dev \
    libxi-dev libxrender-dev libxcb1-dev libx11-xcb-dev libxcb-glx0-dev x11vnc \
    xauth build-essential mesa-common-dev libglu1-mesa-dev libxkbcommon-dev \
    libxcb-xkb-dev libxslt1-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev

RUN apt-get install -y build-essential libgl1-mesa-dev libfontconfig libdbus-glib-1-2 libfontconfig1 libxrender1 libxkbcommon-x11-0

ADD qt-opensource-linux-x64-5.14.1.run /qt-opensource-linux-x64-5.14.1.run

RUN chmod +x ./qt-opensource-linux-x64-5.14.1.run

ENTRYPOINT ./qt-opensource-linux-x64-5.14.1.run

##Instructions to run after creating the image
#Important for running gui apps run this command on host
#1.xhost local:root  
#Run the Image to install qt in image
#2.docker run -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -v /home/guest/Documents/Projects/qt:/home/guest/Documents --name qt_install #docker_image_name
#now commit the container to create its image
#3.docker commit qt_install qt_installed:5.14.1
#no run the commited image by specifying the entrypoint of qtcreator
#4.docker run -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -v /home/guest/Documents/Projects/qt:/home --name qt1 --rm --entrypoint /opt/#Qt5.14.1/Tools/QtCreator/bin/qtcreator qt_installed:5.14.1



