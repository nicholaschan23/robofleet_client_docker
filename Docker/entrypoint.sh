#!/bin/bash

set -e

source /opt/ros/iron/setup.bash
source robofleet_client_ws/install/setup.bash

ros2 run robofleet_client client robofleet_client_ws/src/robofleet_client/cfg/config.yaml
exec "$@"

# exec /bin/bash