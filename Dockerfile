# Base image for ROS 2 Humble Desktop Full on Jammy
FROM osrf/ros:humble-desktop-full-jammy AS base

# Shell to be used during the build process and the container's default
SHELL ["/bin/bash", "-c"]

# Set the environment variables
ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    ROS_DISTRO=humble \
    DEBIAN_FRONTEND=noninteractive \
    DISPLAY=host.docker.internal:0.0 \
    NO_AT_BRIDGE=1 \ 
    GDK_SCALE=1.25\
    GDK_DPI_SCALE=1

# Update and upgrade system
RUN sudo apt update && DEBIAN_FRONTEND=noninteractive apt upgrade -y

# Install Gazebo Fortress  
RUN apt-get update && \
    apt-get install -y lsb-release gnupg curl && \
    curl https://packages.osrfoundation.org/gazebo.gpg --output /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null && \
    apt-get update && \
    apt-get install -y ignition-fortress

# Install gedit
RUN apt-get update && \
    apt-get install -y gedit

######################################### Installing Terminator #########################################

# Install Terminator
RUN apt-get update && \
    apt-get install -y terminator \
    gsettings-desktop-schemas \
    gnome-settings-daemon \
    dbus-x11 \
    libgtk-3-bin \ 
    libgtk-3-dev \
    at-spi2-core \
    gdk-pixbuf2.0-bin && \
    apt-get install -y --reinstall librsvg2-common \
    libgdk-pixbuf2.0-0
      
# Create the Terminator configuration directory and create the configuration file
RUN mkdir -p /etc/xdg/terminator && \
    touch /etc/xdg/terminator/config

#########################################################################################################

# Remove unused apt files after installation processes 
RUN rm -rf /var/lib/apt/lists/* 

############################################## ROS2 Setup ###############################################

# Create the workspace
RUN mkdir -p /root/estudos_ws/src 

# Define the estudos_ws directory as the work directory
WORKDIR /root/estudos_ws/

# Build the workspace
RUN colcon build

# Enable ros2 features
RUN echo 'source /opt/ros/humble/setup.bash' >> /root/.bashrc

# Enable estudos_ws features
RUN echo 'source /root/estudos_ws/install/setup.bash' >> /root/.bashrc

# Enable colcon auto complete
RUN echo '/usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash' >> /root/.bashrc