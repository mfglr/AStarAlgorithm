#include "ros/ros.h"
#include "std_msgs/String.h"
#include "algorithm/algorithm.h"
#include "algorithm/platform.h"
#include <sstream>

int main(int argc,char**argv)
{
    
    ros::init(argc,argv,"PathFinder");
    ros::NodeHandle handler;
    ros::Publisher path_publisher = handler.advertise<std_msgs::String>("path",10);
    std_msgs::String s;
    std::stringstream ss;
    ss << "deneme";
    s.data = ss.str();
    path_publisher.publish(s);
    ROS_INFO("%s",ss.str().c_str());
    return 0;
}
