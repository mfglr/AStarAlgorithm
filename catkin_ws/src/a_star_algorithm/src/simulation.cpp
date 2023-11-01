#include "ros/ros.h"
#include "a_star_algorithm/pathMessage.h"
#include "std_msgs/String.h"
#include "algorithm/algorithm.h"
#include "algorithm/platform.h"


void getPathMessage(std_msgs::String msg){
    ROS_INFO("%s",msg.data.c_str());
}

int main(int argc,char**argv)
{
    ros::init(argc,argv,"Simulation");
    ros::NodeHandle handler;
    ros::Subscriber path_s = handler.subscribe("path",10,getPathMessage);

    ros::spin();
    return 0;
}
