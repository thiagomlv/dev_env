#!/usr/bin/env python3

import rclpy
from rclpy.node import Node

def main(args=None):

    # initialize the ros2 nodes communication
    rclpy.init(args=args)

    # create a node
    node = Node("node_name")
    node.get_logger().info("Hellow world")

    # pause the program and keep the node running
    rclpy.spin(node)

    # shutdown the communication
    rclpy.shutdown()

if __name__ == '__main__':
    main()
