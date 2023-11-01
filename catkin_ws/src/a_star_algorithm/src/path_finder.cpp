#include "ros/ros.h"
#include <list>
#include "a_star_algorithm/PathMessage.h"
#include "a_star_algorithm/PlatformMessage.h"
#include "algorithm/algorithm.h"
#include "algorithm/platform.h"
#include "algorithm/vector2d.h"
#include "algorithm/path.h"
#include "converters/path_converter.h"
#include "converters/platform_converter.h"

using namespace ros;
using namespace std;
using namespace algorithm;
using namespace a_star_algorithm;
using namespace converters;

int currentPlatformId = -1;
NodeHandle *handler;

void publishPath(Path *path){
    Publisher path_publisher = handler->advertise<PathMessage>("path",10);
    Rate rate(1);
    PathMessage msg = PathConverter::toMessage(path);
    while(ros::ok()){
        path->write();
        path_publisher.publish(msg);
        rate.sleep();
    }
}

void getPlatform(PlatformMessage msg){
    if(msg.id != currentPlatformId){
        currentPlatformId = msg.id;
        Platform platform = PlatformConverter::toPlatform(&msg);
        Algorithm a = Algorithm(&platform);
        list<Path> path = a.run();
        publishPath(&path.front());
    }
}


int main(int argc,char**argv)
{
    init(argc,argv,"PathFinder");
    handler = new NodeHandle();
    Subscriber platform_sub = handler->subscribe("platform",10,getPlatform);
    spin();
    return 0;
}
