FROM ros:iron-ros-base

SHELL ["/bin/bash", "-c"]

# set the ros version
ENV ROS_DISTRO iron

# install some useful packages and upgrade existing ones
RUN apt update && apt upgrade -y \
    && apt install -y \
    apt-utils \
    git \
    curl \
    nano \
    vim \
    tmux \
    x11-apps \
    python3-pip \
    python3-rosdep \
    python-is-python3 \
    libqt5websockets5-dev

# install ros packages
# see ../docs/installing_ros_packages.md for alternatives
RUN DEBIAN_FRONTEND=noninteractive apt install -y \
    # ros-${ROS_DISTRO}-builtin-interfaces \
    ros-${ROS_DISTRO}-geometry-msgs \
    ros-${ROS_DISTRO}-std-msgs \
    ros-${ROS_DISTRO}-tf2-msgs \
    && rm -rf /var/lib/apt/lists/*

# install python packages
RUN pip install inflection

# RUN rosdep init
# RUN rosdep update

# RUN mkdir -p /robofleet_client_ws/src
# WORKDIR /robofleet_client_ws/src

# # setup a package from github
# COPY id_rsa /root/.ssh/id_rsa
# RUN chmod 600 /root/.ssh/id_rsa
# RUN git clone --recurse-submodules -j8 -b iron-devel https://github.com/UTNuclearRobotics/robofleet_client.git
# RUN git clone git@github.com:UTNuclearRobotics/robofleet_client_msgs.git

# # install missing dependencies
# WORKDIR /robofleet_client_ws
# RUN rosdep install --from-paths src -y --ignore-src

# # build
# RUN source /opt/ros/${ROS_DISTRO}/setup.bash \
#     && colcon build

# RUN source /robofleet_client_ws/install/setup.bash \
#     && ros2 run robofleet_client generate_plugin_pkg.py -o src tf2_msgs
# RUN colcon build

WORKDIR /root

# setup .bashrc
SHELL ["/bin/bash", "-l", "-c"]
RUN echo -e "\
    source /opt/ros/${ROS_DISTRO}/setup.bash\n\
    export ROS_PACKAGE_PATH=\$ROS_PACKAGE_PATH:/root/amrl_msgs" >> ~/.bashrc \
    && echo -e "\
    source /opt/ros/${ROS_DISTRO}/setup.bash\n\
    export ROS_PACKAGE_PATH=\$ROS_PACKAGE_PATH:/root/amrl_msgs" >> ~/.profile

# copy the entrypoint into the image
COPY ./entrypoint.sh /entrypoint.sh

# run this script on startup
ENTRYPOINT /entrypoint.sh