;; Auto-generated. Do not edit!


(when (boundp 'chatbot_node::reply_msg)
  (if (not (find-package "CHATBOT_NODE"))
    (make-package "CHATBOT_NODE"))
  (shadow 'reply_msg (find-package "CHATBOT_NODE")))
(unless (find-package "CHATBOT_NODE::REPLY_MSG")
  (make-package "CHATBOT_NODE::REPLY_MSG"))

(in-package "ROS")
;;//! \htmlinclude reply_msg.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass chatbot_node::reply_msg
  :super ros::object
  :slots (_header _message ))

(defmethod chatbot_node::reply_msg
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:message __message) "")
    )
   (send-super :init)
   (setq _header __header)
   (setq _message (string __message))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get chatbot_node::reply_msg :md5sum-) "49f8a60a46dc2a23c8756dda3465c662")
(setf (get chatbot_node::reply_msg :datatype-) "chatbot_node/reply_msg")
(setf (get chatbot_node::reply_msg :definition-)
      "Header header
string message
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

")



(provide :chatbot_node/reply_msg "49f8a60a46dc2a23c8756dda3465c662")


