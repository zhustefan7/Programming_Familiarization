// Generated by gencpp from file counter_node/counterRequest.msg
// DO NOT EDIT!


#ifndef COUNTER_NODE_MESSAGE_COUNTERREQUEST_H
#define COUNTER_NODE_MESSAGE_COUNTERREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace counter_node
{
template <class ContainerAllocator>
struct counterRequest_
{
  typedef counterRequest_<ContainerAllocator> Type;

  counterRequest_()
    : req_id(0)  {
    }
  counterRequest_(const ContainerAllocator& _alloc)
    : req_id(0)  {
  (void)_alloc;
    }



   typedef int16_t _req_id_type;
  _req_id_type req_id;





  typedef boost::shared_ptr< ::counter_node::counterRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::counter_node::counterRequest_<ContainerAllocator> const> ConstPtr;

}; // struct counterRequest_

typedef ::counter_node::counterRequest_<std::allocator<void> > counterRequest;

typedef boost::shared_ptr< ::counter_node::counterRequest > counterRequestPtr;
typedef boost::shared_ptr< ::counter_node::counterRequest const> counterRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::counter_node::counterRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::counter_node::counterRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace counter_node

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'counter_node': ['/home/stefanzhu/Documents/2020 Spring/Programming_familiarization/Programming Familiarization Part 2/catkin_ws/src/counter_node/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::counter_node::counterRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::counter_node::counterRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::counter_node::counterRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::counter_node::counterRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::counter_node::counterRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::counter_node::counterRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::counter_node::counterRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d67e2fcd47f3255cc3fbcfba8a121186";
  }

  static const char* value(const ::counter_node::counterRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd67e2fcd47f3255cULL;
  static const uint64_t static_value2 = 0xc3fbcfba8a121186ULL;
};

template<class ContainerAllocator>
struct DataType< ::counter_node::counterRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "counter_node/counterRequest";
  }

  static const char* value(const ::counter_node::counterRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::counter_node::counterRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int16 req_id\n\
";
  }

  static const char* value(const ::counter_node::counterRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::counter_node::counterRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.req_id);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct counterRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::counter_node::counterRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::counter_node::counterRequest_<ContainerAllocator>& v)
  {
    s << indent << "req_id: ";
    Printer<int16_t>::stream(s, indent + "  ", v.req_id);
  }
};

} // namespace message_operations
} // namespace ros

#endif // COUNTER_NODE_MESSAGE_COUNTERREQUEST_H
