; Auto-generated. Do not edit!


(cl:in-package chatbot_node-msg)


;//! \htmlinclude reply_msg.msg.html

(cl:defclass <reply_msg> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass reply_msg (<reply_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <reply_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'reply_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name chatbot_node-msg:<reply_msg> is deprecated: use chatbot_node-msg:reply_msg instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <reply_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader chatbot_node-msg:header-val is deprecated.  Use chatbot_node-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <reply_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader chatbot_node-msg:message-val is deprecated.  Use chatbot_node-msg:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <reply_msg>) ostream)
  "Serializes a message object of type '<reply_msg>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <reply_msg>) istream)
  "Deserializes a message object of type '<reply_msg>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<reply_msg>)))
  "Returns string type for a message object of type '<reply_msg>"
  "chatbot_node/reply_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'reply_msg)))
  "Returns string type for a message object of type 'reply_msg"
  "chatbot_node/reply_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<reply_msg>)))
  "Returns md5sum for a message object of type '<reply_msg>"
  "49f8a60a46dc2a23c8756dda3465c662")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'reply_msg)))
  "Returns md5sum for a message object of type 'reply_msg"
  "49f8a60a46dc2a23c8756dda3465c662")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<reply_msg>)))
  "Returns full string definition for message of type '<reply_msg>"
  (cl:format cl:nil "Header header~%string message~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'reply_msg)))
  "Returns full string definition for message of type 'reply_msg"
  (cl:format cl:nil "Header header~%string message~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <reply_msg>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <reply_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'reply_msg
    (cl:cons ':header (header msg))
    (cl:cons ':message (message msg))
))
