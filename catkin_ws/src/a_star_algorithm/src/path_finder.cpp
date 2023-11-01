#include "ros/ros.h"
#include "a_star_algorithm/PathMessage.h"
#include "a_star_algorithm/PlatformMessage.h"
#include "algorithm/algorithm.h"
#include "algorithm/platform.h"
#include "algorithm/vector.h"
#include "algorithm/path.h"
#include <list>

using namespace ros;
using namespace std;
using namespace algorithm;
using namespace a_star_algorithm;

int currentPlatformId = -1;
NodeHandle *handler;


void findPath(PlatformMessage msg){
    Publisher pub = handler->advertise<AlgorithmMessage>("algorithm",10);
    Rate rate(1);
    Algorithm a = Algorithm(new Platform(msg));
    a.publish(&pub,&rate);
}

void getPlatform(PlatformMessage msg){
    if(msg.id != currentPlatformId){
        currentPlatformId = msg.id;
        findPath(msg);
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
