// Generated by gencpp from file a_star_algorithm/PlatformMessage.msg
// DO NOT EDIT!


#ifndef A_STAR_ALGORITHM_MESSAGE_PLATFORMMESSAGE_H
#define A_STAR_ALGORITHM_MESSAGE_PLATFORMMESSAGE_H


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
struct PlatformMessage_
{
  typedef PlatformMessage_<ContainerAllocator> Type;

  PlatformMessage_()
    : id(0)
    , size(0)
    , start()
    , end()
    , data()  {
    }
  PlatformMessage_(const ContainerAllocator& _alloc)
    : id(0)
    , size(0)
    , start(_alloc)
    , end(_alloc)
    , data(_alloc)  {
  (void)_alloc;
    }



   typedef int32_t _id_type;
  _id_type id;

   typedef int32_t _size_type;
  _size_type size;

   typedef std::vector<int32_t, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<int32_t>> _start_type;
  _start_type start;

   typedef std::vector<int32_t, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<int32_t>> _end_type;
  _end_type end;

   typedef std::vector<int32_t, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<int32_t>> _data_type;
  _data_type data;





  typedef boost::shared_ptr< ::a_star_algorithm::PlatformMessage_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::a_star_algorithm::PlatformMessage_<ContainerAllocator> const> ConstPtr;

}; // struct PlatformMessage_

typedef ::a_star_algorithm::PlatformMessage_<std::allocator<void> > PlatformMessage;

typedef boost::shared_ptr< ::a_star_algorithm::PlatformMessage > PlatformMessagePtr;
typedef boost::shared_ptr< ::a_star_algorithm::PlatformMessage const> PlatformMessageConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::a_star_algorithm::PlatformMessage_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::a_star_algorithm::PlatformMessage_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::a_star_algorithm::PlatformMessage_<ContainerAllocator1> & lhs, const ::a_star_algorithm::PlatformMessage_<ContainerAllocator2> & rhs)
{
  return lhs.id == rhs.id &&
    lhs.size == rhs.size &&
    lhs.start == rhs.start &&
    lhs.end == rhs.end &&
    lhs.data == rhs.data;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::a_star_algorithm::PlatformMessage_<ContainerAllocator1> & lhs, const ::a_star_algorithm::PlatformMessage_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace a_star_algorithm

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::a_star_algorithm::PlatformMessage_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::a_star_algorithm::PlatformMessage_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::a_star_algorithm::PlatformMessage_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::a_star_algorithm::PlatformMessage_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::a_star_algorithm::PlatformMessage_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::a_star_algorithm::PlatformMessage_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::a_star_algorithm::PlatformMessage_<ContainerAllocator> >
{
  static const char* value()
  {
    return "a16b117448f2a137e2d0ba8d172a1948";
  }

  static const char* value(const ::a_star_algorithm::PlatformMessage_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xa16b117448f2a137ULL;
  static const uint64_t static_value2 = 0xe2d0ba8d172a1948ULL;
};

template<class ContainerAllocator>
struct DataType< ::a_star_algorithm::PlatformMessage_<ContainerAllocator> >
{
  static const char* value()
  {
    return "a_star_algorithm/PlatformMessage";
  }

  static const char* value(const ::a_star_algorithm::PlatformMessage_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::a_star_algorithm::PlatformMessage_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int32 id\n"
"int32 size\n"
"int32[] start\n"
"int32[] end\n"
"int32[] data\n"
;
  }

  static const char* value(const ::a_star_algorithm::PlatformMessage_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::a_star_algorithm::PlatformMessage_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.id);
      stream.next(m.size);
      stream.next(m.start);
      stream.next(m.end);
      stream.next(m.data);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct PlatformMessage_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::a_star_algorithm::PlatformMessage_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::a_star_algorithm::PlatformMessage_<ContainerAllocator>& v)
  {
    s << indent << "id: ";
    Printer<int32_t>::stream(s, indent + "  ", v.id);
    s << indent << "size: ";
    Printer<int32_t>::stream(s, indent + "  ", v.size);
    s << indent << "start[]" << std::endl;
    for (size_t i = 0; i < v.start.size(); ++i)
    {
      s << indent << "  start[" << i << "]: ";
      Printer<int32_t>::stream(s, indent + "  ", v.start[i]);
    }
    s << indent << "end[]" << std::endl;
    for (size_t i = 0; i < v.end.size(); ++i)
    {
      s << indent << "  end[" << i << "]: ";
      Printer<int32_t>::stream(s, indent + "  ", v.end[i]);
    }
    s << indent << "data[]" << std::endl;
    for (size_t i = 0; i < v.data.size(); ++i)
    {
      s << indent << "  data[" << i << "]: ";
      Printer<int32_t>::stream(s, indent + "  ", v.data[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // A_STAR_ALGORITHM_MESSAGE_PLATFORMMESSAGE_H
