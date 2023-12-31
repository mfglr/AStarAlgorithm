// Generated by gencpp from file a_star_algorithm/VectorMessage.msg
// DO NOT EDIT!


#ifndef A_STAR_ALGORITHM_MESSAGE_VECTORMESSAGE_H
#define A_STAR_ALGORITHM_MESSAGE_VECTORMESSAGE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace a_star_algorithm
{
template <class ContainerAllocator>
struct VectorMessage_
{
  typedef VectorMessage_<ContainerAllocator> Type;

  VectorMessage_()
    : x(0)
    , y(0)  {
    }
  VectorMessage_(const ContainerAllocator& _alloc)
    : x(0)
    , y(0)  {
  (void)_alloc;
    }



   typedef int32_t _x_type;
  _x_type x;

   typedef int32_t _y_type;
  _y_type y;





  typedef boost::shared_ptr< ::a_star_algorithm::VectorMessage_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::a_star_algorithm::VectorMessage_<ContainerAllocator> const> ConstPtr;

}; // struct VectorMessage_

typedef ::a_star_algorithm::VectorMessage_<std::allocator<void> > VectorMessage;

typedef boost::shared_ptr< ::a_star_algorithm::VectorMessage > VectorMessagePtr;
typedef boost::shared_ptr< ::a_star_algorithm::VectorMessage const> VectorMessageConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::a_star_algorithm::VectorMessage_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::a_star_algorithm::VectorMessage_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::a_star_algorithm::VectorMessage_<ContainerAllocator1> & lhs, const ::a_star_algorithm::VectorMessage_<ContainerAllocator2> & rhs)
{
  return lhs.x == rhs.x &&
    lhs.y == rhs.y;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::a_star_algorithm::VectorMessage_<ContainerAllocator1> & lhs, const ::a_star_algorithm::VectorMessage_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace a_star_algorithm

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::a_star_algorithm::VectorMessage_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::a_star_algorithm::VectorMessage_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::a_star_algorithm::VectorMessage_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::a_star_algorithm::VectorMessage_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::a_star_algorithm::VectorMessage_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::a_star_algorithm::VectorMessage_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::a_star_algorithm::VectorMessage_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bd7b43fd41d4c47bf5c703cc7d016709";
  }

  static const char* value(const ::a_star_algorithm::VectorMessage_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xbd7b43fd41d4c47bULL;
  static const uint64_t static_value2 = 0xf5c703cc7d016709ULL;
};

template<class ContainerAllocator>
struct DataType< ::a_star_algorithm::VectorMessage_<ContainerAllocator> >
{
  static const char* value()
  {
    return "a_star_algorithm/VectorMessage";
  }

  static const char* value(const ::a_star_algorithm::VectorMessage_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::a_star_algorithm::VectorMessage_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int32 x\n"
"int32 y\n"
;
  }

  static const char* value(const ::a_star_algorithm::VectorMessage_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::a_star_algorithm::VectorMessage_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.x);
      stream.next(m.y);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct VectorMessage_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::a_star_algorithm::VectorMessage_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::a_star_algorithm::VectorMessage_<ContainerAllocator>& v)
  {
    s << indent << "x: ";
    Printer<int32_t>::stream(s, indent + "  ", v.x);
    s << indent << "y: ";
    Printer<int32_t>::stream(s, indent + "  ", v.y);
  }
};

} // namespace message_operations
} // namespace ros

#endif // A_STAR_ALGORITHM_MESSAGE_VECTORMESSAGE_H
