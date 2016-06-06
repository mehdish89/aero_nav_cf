// Generated by gencpp from file crazyflie_driver/AddCrazyflieRequest.msg
// DO NOT EDIT!


#ifndef CRAZYFLIE_DRIVER_MESSAGE_ADDCRAZYFLIEREQUEST_H
#define CRAZYFLIE_DRIVER_MESSAGE_ADDCRAZYFLIEREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <crazyflie_driver/LogBlock.h>

namespace crazyflie_driver
{
template <class ContainerAllocator>
struct AddCrazyflieRequest_
{
  typedef AddCrazyflieRequest_<ContainerAllocator> Type;

  AddCrazyflieRequest_()
    : uri()
    , tf_prefix()
    , roll_trim(0.0)
    , pitch_trim(0.0)
    , enable_logging(false)
    , enable_parameters(false)
    , log_blocks()  {
    }
  AddCrazyflieRequest_(const ContainerAllocator& _alloc)
    : uri(_alloc)
    , tf_prefix(_alloc)
    , roll_trim(0.0)
    , pitch_trim(0.0)
    , enable_logging(false)
    , enable_parameters(false)
    , log_blocks(_alloc)  {
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _uri_type;
  _uri_type uri;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _tf_prefix_type;
  _tf_prefix_type tf_prefix;

   typedef float _roll_trim_type;
  _roll_trim_type roll_trim;

   typedef float _pitch_trim_type;
  _pitch_trim_type pitch_trim;

   typedef uint8_t _enable_logging_type;
  _enable_logging_type enable_logging;

   typedef uint8_t _enable_parameters_type;
  _enable_parameters_type enable_parameters;

   typedef std::vector< ::crazyflie_driver::LogBlock_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::crazyflie_driver::LogBlock_<ContainerAllocator> >::other >  _log_blocks_type;
  _log_blocks_type log_blocks;




  typedef boost::shared_ptr< ::crazyflie_driver::AddCrazyflieRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::crazyflie_driver::AddCrazyflieRequest_<ContainerAllocator> const> ConstPtr;

}; // struct AddCrazyflieRequest_

typedef ::crazyflie_driver::AddCrazyflieRequest_<std::allocator<void> > AddCrazyflieRequest;

typedef boost::shared_ptr< ::crazyflie_driver::AddCrazyflieRequest > AddCrazyflieRequestPtr;
typedef boost::shared_ptr< ::crazyflie_driver::AddCrazyflieRequest const> AddCrazyflieRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::crazyflie_driver::AddCrazyflieRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::crazyflie_driver::AddCrazyflieRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace crazyflie_driver

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'crazyflie_driver': ['/home/meit/crazyflie_ws/src/crazyflie_driver/msg'], 'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::crazyflie_driver::AddCrazyflieRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::crazyflie_driver::AddCrazyflieRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::crazyflie_driver::AddCrazyflieRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::crazyflie_driver::AddCrazyflieRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::crazyflie_driver::AddCrazyflieRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::crazyflie_driver::AddCrazyflieRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::crazyflie_driver::AddCrazyflieRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "281517a9f976c165030a3b33c63a9478";
  }

  static const char* value(const ::crazyflie_driver::AddCrazyflieRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x281517a9f976c165ULL;
  static const uint64_t static_value2 = 0x030a3b33c63a9478ULL;
};

template<class ContainerAllocator>
struct DataType< ::crazyflie_driver::AddCrazyflieRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "crazyflie_driver/AddCrazyflieRequest";
  }

  static const char* value(const ::crazyflie_driver::AddCrazyflieRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::crazyflie_driver::AddCrazyflieRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string uri\n\
string tf_prefix\n\
float32 roll_trim\n\
float32 pitch_trim\n\
bool enable_logging\n\
bool enable_parameters\n\
LogBlock[] log_blocks\n\
\n\
================================================================================\n\
MSG: crazyflie_driver/LogBlock\n\
string topic_name\n\
int16 frequency\n\
string[] variables\n\
";
  }

  static const char* value(const ::crazyflie_driver::AddCrazyflieRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::crazyflie_driver::AddCrazyflieRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.uri);
      stream.next(m.tf_prefix);
      stream.next(m.roll_trim);
      stream.next(m.pitch_trim);
      stream.next(m.enable_logging);
      stream.next(m.enable_parameters);
      stream.next(m.log_blocks);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct AddCrazyflieRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::crazyflie_driver::AddCrazyflieRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::crazyflie_driver::AddCrazyflieRequest_<ContainerAllocator>& v)
  {
    s << indent << "uri: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.uri);
    s << indent << "tf_prefix: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.tf_prefix);
    s << indent << "roll_trim: ";
    Printer<float>::stream(s, indent + "  ", v.roll_trim);
    s << indent << "pitch_trim: ";
    Printer<float>::stream(s, indent + "  ", v.pitch_trim);
    s << indent << "enable_logging: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.enable_logging);
    s << indent << "enable_parameters: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.enable_parameters);
    s << indent << "log_blocks[]" << std::endl;
    for (size_t i = 0; i < v.log_blocks.size(); ++i)
    {
      s << indent << "  log_blocks[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::crazyflie_driver::LogBlock_<ContainerAllocator> >::stream(s, indent + "    ", v.log_blocks[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // CRAZYFLIE_DRIVER_MESSAGE_ADDCRAZYFLIEREQUEST_H
