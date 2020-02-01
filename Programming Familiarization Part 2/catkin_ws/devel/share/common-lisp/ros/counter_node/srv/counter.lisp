; Auto-generated. Do not edit!


(cl:in-package counter_node-srv)


;//! \htmlinclude counter-request.msg.html

(cl:defclass <counter-request> (roslisp-msg-protocol:ros-message)
  ((req_id
    :reader req_id
    :initarg :req_id
    :type cl:fixnum
    :initform 0))
)

(cl:defclass counter-request (<counter-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <counter-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'counter-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name counter_node-srv:<counter-request> is deprecated: use counter_node-srv:counter-request instead.")))

(cl:ensure-generic-function 'req_id-val :lambda-list '(m))
(cl:defmethod req_id-val ((m <counter-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader counter_node-srv:req_id-val is deprecated.  Use counter_node-srv:req_id instead.")
  (req_id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <counter-request>) ostream)
  "Serializes a message object of type '<counter-request>"
  (cl:let* ((signed (cl:slot-value msg 'req_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <counter-request>) istream)
  "Deserializes a message object of type '<counter-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'req_id) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<counter-request>)))
  "Returns string type for a service object of type '<counter-request>"
  "counter_node/counterRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'counter-request)))
  "Returns string type for a service object of type 'counter-request"
  "counter_node/counterRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<counter-request>)))
  "Returns md5sum for a message object of type '<counter-request>"
  "4280a7cf1d34a23e38e36c574443dc71")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'counter-request)))
  "Returns md5sum for a message object of type 'counter-request"
  "4280a7cf1d34a23e38e36c574443dc71")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<counter-request>)))
  "Returns full string definition for message of type '<counter-request>"
  (cl:format cl:nil "int16 req_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'counter-request)))
  "Returns full string definition for message of type 'counter-request"
  (cl:format cl:nil "int16 req_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <counter-request>))
  (cl:+ 0
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <counter-request>))
  "Converts a ROS message object to a list"
  (cl:list 'counter-request
    (cl:cons ':req_id (req_id msg))
))
;//! \htmlinclude counter-response.msg.html

(cl:defclass <counter-response> (roslisp-msg-protocol:ros-message)
  ((reply
    :reader reply
    :initarg :reply
    :type cl:float
    :initform 0.0))
)

(cl:defclass counter-response (<counter-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <counter-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'counter-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name counter_node-srv:<counter-response> is deprecated: use counter_node-srv:counter-response instead.")))

(cl:ensure-generic-function 'reply-val :lambda-list '(m))
(cl:defmethod reply-val ((m <counter-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader counter_node-srv:reply-val is deprecated.  Use counter_node-srv:reply instead.")
  (reply m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <counter-response>) ostream)
  "Serializes a message object of type '<counter-response>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'reply))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <counter-response>) istream)
  "Deserializes a message object of type '<counter-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'reply) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<counter-response>)))
  "Returns string type for a service object of type '<counter-response>"
  "counter_node/counterResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'counter-response)))
  "Returns string type for a service object of type 'counter-response"
  "counter_node/counterResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<counter-response>)))
  "Returns md5sum for a message object of type '<counter-response>"
  "4280a7cf1d34a23e38e36c574443dc71")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'counter-response)))
  "Returns md5sum for a message object of type 'counter-response"
  "4280a7cf1d34a23e38e36c574443dc71")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<counter-response>)))
  "Returns full string definition for message of type '<counter-response>"
  (cl:format cl:nil "float32 reply~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'counter-response)))
  "Returns full string definition for message of type 'counter-response"
  (cl:format cl:nil "float32 reply~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <counter-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <counter-response>))
  "Converts a ROS message object to a list"
  (cl:list 'counter-response
    (cl:cons ':reply (reply msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'counter)))
  'counter-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'counter)))
  'counter-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'counter)))
  "Returns string type for a service object of type '<counter>"
  "counter_node/counter")