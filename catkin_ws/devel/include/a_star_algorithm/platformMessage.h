// Generated by gencpp from file a_star_algorithm/platformMessage.msg
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
struct platformMessage_
{
  typedef platformMessage_<ContainerAllocator> Type;

  platformMessage_()
    : id(0)
    , size(0)
    , start()
    , end()
    , data()  {
    }
  platformMessage_(const ContainerAllocator& _alloc)
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

   typedef std::vector<int8_t, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<int8_t>> _data_type;
  _data_type data;





  typedef boost::shared_ptr< ::a_star_algorithm::platformMessage_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::a_star_algorithm::platformMessage_<ContainerAllocator> const> ConstPtr;

}; // struct platformMessage_

typedef ::a_star_algorithm::platformMessage_<std::allocator<void> > platformMessage;

typedef boost::shared_ptr< ::a_star_algorithm::platformMessage > platformMessagePtr;
typedef boost::shared_ptr< ::a_star_algorithm::platformMessage const> platformMessageConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::a_star_algorithm::platformMessage_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::a_star_algorithm::platformMessage_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::a_star_algorithm::platformMessage_<ContainerAllocator1> & lhs, const ::a_star_algorithm::platformMessage_<ContainerAllocator2> & rhs)
{
  return lhs.id == rhs.id &&
    lhs.size == rhs.size &&
    lhs.start == rhs.start &&
    lhs.end == rhs.end &&
    lhs.data == rhs.data;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::a_star_algorithm::platformMessage_<ContainerAllocator1> & lhs, const ::a_star_algorithm::platformMessage_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace a_star_algorithm

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::a_star_algorithm::platformMessage_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::a_star_algorithm::platformMessage_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::a_star_algorithm::platformMessage_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::a_star_algorithm::platformMessage_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::a_star_algorithm::platformMessage_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::a_star_algorithm::platformMessage_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::a_star_algorithm::platformMessage_<ContainerAllocator> >
{
  static const char* value()
  {
    return "a52ae1bdbb73caa3e00e36dbb90510bc";
  }

  static const char* value(const ::a_star_algorithm::platformMessage_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xa52ae1bdbb73caa3ULL;
  static const uint64_t static_value2 = 0xe00e36dbb90510bcULL;
};

template<class ContainerAllocator>
struct DataType< ::a_star_algorithm::platformMessage_<ContainerAllocator> >
{
  static const char* value()
  {
    return "a_star_algorithm/platformMessage";
  }

  static const char* value(const ::a_star_algorithm::platformMessage_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::a_star_algorithm::platformMessage_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int32 id\n"
"int32 size\n"
"int32[] start\n"
"int32[] end\n"
"int8[] data\n"
;
  }

  static const char* value(const ::a_star_algorithm::platformMessage_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::a_star_algorithm::platformMessage_<ContainerAllocator> >
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
  }; // struct platformMessage_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::a_star_algorithm::platformMessage_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::a_star_algorithm::platformMessage_<ContainerAllocator>& v)
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
      Printer<int8_t>::stream(s, indent + "  ", v.data[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // A_STAR_ALGORITHM_MESSAGE_PLATFORMMESSAGE_H
