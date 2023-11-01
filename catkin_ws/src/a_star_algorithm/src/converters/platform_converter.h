#include "a_star_algorithm/PlatformMessage.h"
#include "../algorithm/platform.h"
#include "../algorithm/vector2d.h"

namespace converters{
    class PlatformConverter{
        public :
            static algorithm::Platform toPlatform(a_star_algorithm::PlatformMessage * msg){
                int size2 = msg->size * msg->size;
                int *data = (int *)malloc(sizeof(int) * size2);
                for(int i = 0; i < size2;i++)
                    data[i] = msg->data[i];
                return algorithm::Platform(
                    msg->size,
                    new algorithm::Vector2D(msg->start[0],msg->start[1]),
                    new algorithm::Vector2D(msg->end[0],msg->end[1]),
                    data
                );
            }
    };
}