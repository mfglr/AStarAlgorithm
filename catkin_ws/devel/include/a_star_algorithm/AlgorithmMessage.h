// Generated by gencpp from file a_star_algorithm/AlgorithmMessage.msg
// DO NOT EDIT!


#ifndef A_STAR_ALGORITHM_MESSAGE_ALGORITHMMESSAGE_H
#define A_STAR_ALGORITHM_MESSAGE_ALGORITHMMESSAGE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <a_star_algorithm/PlatformMessage.h>
#include <a_star_algorithm/PathMessage.h>
#include <a_star_algorithm/PathMessage.h>

namespace a_star_algorithm
{
template <class ContainerAllocator>
struct AlgorithmMessage_
{
  typedef AlgorithmMessage_<ContainerAllocator> Type;

  AlgorithmMessage_()
    : platform()
    , activePath()
    , paths()  {
    }
  AlgorithmMessage_(const ContainerAllocator& _alloc)
    : platform(_alloc)
    , activePath(_alloc)
    , paths(_alloc)  {
  (void)_alloc;
    }



   typedef  ::a_star_algorithm::PlatformMessage_<ContainerAllocator>  _platform_type;
  _platform_type platform;

   typedef  ::a_star_algorithm::PathMessage_<ContainerAllocator>  _activePath_type;
  _activePath_type activePath;

   typedef std::vector< ::a_star_algorithm::PathMessage_<ContainerAllocator> , typename std::allocator_traits<ContainerAllocator>::template rebind_alloc< ::a_star_algorithm::PathMessage_<ContainerAllocator> >> _paths_type;
  _paths_type paths;





  typedef boost::shared_ptr< ::a_star_algorithm::AlgorithmMessage_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::a_star_algorithm::AlgorithmMessage_<ContainerAllocator> const> ConstPtr;

}; // struct AlgorithmMessage_

typedef ::a_star_algorithm::AlgorithmMessage_<std::allocator<void> > AlgorithmMessage;

typedef boost::shared_ptr< ::a_star_algorithm::AlgorithmMessage > AlgorithmMessagePtr;
typedef boost::shared_ptr< ::a_star_algorithm::AlgorithmMessage const> AlgorithmMessageConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::a_star_algorithm::AlgorithmMessage_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::a_star_algorithm::AlgorithmMessage_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::a_star_algorithm::AlgorithmMessage_<ContainerAllocator1> & lhs, const ::a_star_algorithm::AlgorithmMessage_<ContainerAllocator2> & rhs)
{
  return lhs.platform == rhs.platform &&
    lhs.activePath == rhs.activePath &&
    lhs.paths == rhs.paths;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::a_star_algorithm::AlgorithmMessage_<ContainerAllocator1> & lhs, const ::a_star_algorithm::AlgorithmMessage_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace a_star_algorithm

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::a_star_algorithm::AlgorithmMessage_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::a_star_algorithm::AlgorithmMessage_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::a_star_algorithm::AlgorithmMessage_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::a_star_algorithm::AlgorithmMessage_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::a_star_algorithm::AlgorithmMessage_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::a_star_algorithm::AlgorithmMessage_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::a_star_algorithm::AlgorithmMessage_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ce4c2d0aafc2657f6ef6618d564bf819";
  }

  static const char* value(const ::a_star_algorithm::AlgorithmMessage_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xce4c2d0aafc2657fULL;
  static const uint64_t static_value2 = 0x6ef6618d564bf819ULL;
};

template<class ContainerAllocator>
struct DataType< ::a_star_algorithm::AlgorithmMessage_<ContainerAllocator> >
{
  static const char* value()
  {
    return "a_star_algorithm/AlgorithmMessage";
  }

  static const char* value(const ::a_star_algorithm::AlgorithmMessage_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::a_star_algorithm::AlgorithmMessage_<ContainerAllocator> >
{
  static const char* value()
  {
    return "PlatformMessage platform\n"
"PathMessage activePath\n"
"PathMessage[] paths\n"
"================================================================================\n"
"MSG: a_star_algorithm/PlatformMessage\n"
"int32 id\n"
"int32 size\n"
"VectorMessage start\n"
"VectorMessage end\n"
"int32[] data\n"
"\n"
"================================================================================\n"
"MSG: a_star_algorithm/VectorMessage\n"
"int32 x\n"
"int32 y\n"
"================================================================================\n"
"MSG: a_star_algorithm/PathMessage\n"
"int32 id\n"
"int32 sizeOfNodes\n"
"NodeMessage[] nodes\n"
"================================================================================\n"
"MSG: a_star_algorithm/NodeMessage\n"
"VectorMessage location\n"
"int32 g\n"
;
  }

  static const char* value(const ::a_star_algorithm::AlgorithmMessage_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::a_star_algorithm::AlgorithmMessage_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.platform);
      stream.next(m.activePath);
      stream.next(m.paths);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct AlgorithmMessage_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::a_star_algorithm::AlgorithmMessage_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::a_star_algorithm::AlgorithmMessage_<ContainerAllocator>& v)
  {
    s << indent << "platform: ";
    s << std::endl;
    Printer< ::a_star_algorithm::PlatformMessage_<ContainerAllocator> >::stream(s, indent + "  ", v.platform);
    s << indent << "activePath: ";
    s << std::endl;
    Printer< ::a_star_algorithm::PathMessage_<ContainerAllocator> >::stream(s, indent + "  ", v.activePath);
    s << indent << "paths[]" << std::endl;
    for (size_t i = 0; i < v.paths.size(); ++i)
    {
      s << indent << "  paths[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::a_star_algorithm::PathMessage_<ContainerAllocator> >::stream(s, indent + "    ", v.paths[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // A_STAR_ALGORITHM_MESSAGE_ALGORITHMMESSAGE_H