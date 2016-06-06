// Generated by gencpp from file crazyflie_driver/GenericLogData.msg
// DO NOT EDIT!


#ifndef CRAZYFLIE_DRIVER_MESSAGE_GENERICLOGDATA_H
#define CRAZYFLIE_DRIVER_MESSAGE_GENERICLOGDATA_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace crazyflie_driver
{
template <class ContainerAllocator>
struct GenericLogData_
{
  typedef GenericLogData_<ContainerAllocator> Type;

  GenericLogData_()
    : values()  {
    }
  GenericLogData_(const ContainerAllocator& _alloc)
    : values(_alloc)  {
    }



   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _values_type;
  _values_type values;




  typedef boost::shared_ptr< ::crazyflie_driver::GenericLogData_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::crazyflie_driver::GenericLogData_<ContainerAllocator> const> ConstPtr;

}; // struct GenericLogData_

typedef ::crazyflie_driver::GenericLogData_<std::allocator<void> > GenericLogData;

typedef boost::shared_ptr< ::crazyflie_driver::GenericLogData > GenericLogDataPtr;
typedef boost::shared_ptr< ::crazyflie_driver::GenericLogData const> GenericLogDataConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::crazyflie_driver::GenericLogData_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::crazyflie_driver::GenericLogData_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::crazyflie_driver::GenericLogData_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::crazyflie_driver::GenericLogData_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::crazyflie_driver::GenericLogData_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::crazyflie_driver::GenericLogData_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::crazyflie_driver::GenericLogData_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::crazyflie_driver::GenericLogData_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::crazyflie_driver::GenericLogData_<ContainerAllocator> >
{
  static const char* value()
  {
    return "b9163d7c678dcd669317e43e46b63d96";
  }

  static const char* value(const ::crazyflie_driver::GenericLogData_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xb9163d7c678dcd66ULL;
  static const uint64_t static_value2 = 0x9317e43e46b63d96ULL;
};

template<class ContainerAllocator>
struct DataType< ::crazyflie_driver::GenericLogData_<ContainerAllocator> >
{
  static const char* value()
  {
    return "crazyflie_driver/GenericLogData";
  }

  static const char* value(const ::crazyflie_driver::GenericLogData_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::crazyflie_driver::GenericLogData_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64[] values\n\
";
  }

  static const char* value(const ::crazyflie_driver::GenericLogData_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::crazyflie_driver::GenericLogData_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.values);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct GenericLogData_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::crazyflie_driver::GenericLogData_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::crazyflie_driver::GenericLogData_<ContainerAllocator>& v)
  {
    s << indent << "values[]" << std::endl;
    for (size_t i = 0; i < v.values.size(); ++i)
    {
      s << indent << "  values[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.values[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // CRAZYFLIE_DRIVER_MESSAGE_GENERICLOGDATA_H
