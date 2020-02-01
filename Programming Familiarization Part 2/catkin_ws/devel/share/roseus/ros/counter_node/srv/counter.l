;; Auto-generated. Do not edit!


(when (boundp 'counter_node::counter)
  (if (not (find-package "COUNTER_NODE"))
    (make-package "COUNTER_NODE"))
  (shadow 'counter (find-package "COUNTER_NODE")))
(unless (find-package "COUNTER_NODE::COUNTER")
  (make-package "COUNTER_NODE::COUNTER"))
(unless (find-package "COUNTER_NODE::COUNTERREQUEST")
  (make-package "COUNTER_NODE::COUNTERREQUEST"))
(unless (find-package "COUNTER_NODE::COUNTERRESPONSE")
  (make-package "COUNTER_NODE::COUNTERRESPONSE"))

(in-package "ROS")





(defclass counter_node::counterRequest
  :super ros::object
  :slots (_req_id ))

(defmethod counter_node::counterRequest
  (:init
   (&key
    ((:req_id __req_id) 0)
    )
   (send-super :init)
   (setq _req_id (round __req_id))
   self)
  (:req_id
   (&optional __req_id)
   (if __req_id (setq _req_id __req_id)) _req_id)
  (:serialization-length
   ()
   (+
    ;; int16 _req_id
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _req_id
       (write-word _req_id s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _req_id
     (setq _req_id (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(defclass counter_node::counterResponse
  :super ros::object
  :slots (_reply ))

(defmethod counter_node::counterResponse
  (:init
   (&key
    ((:reply __reply) 0.0)
    )
   (send-super :init)
   (setq _reply (float __reply))
   self)
  (:reply
   (&optional __reply)
   (if __reply (setq _reply __reply)) _reply)
  (:serialization-length
   ()
   (+
    ;; float32 _reply
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _reply
       (sys::poke _reply (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _reply
     (setq _reply (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass counter_node::counter
  :super ros::object
  :slots ())

(setf (get counter_node::counter :md5sum-) "4280a7cf1d34a23e38e36c574443dc71")
(setf (get counter_node::counter :datatype-) "counter_node/counter")
(setf (get counter_node::counter :request) counter_node::counterRequest)
(setf (get counter_node::counter :response) counter_node::counterResponse)

(defmethod counter_node::counterRequest
  (:response () (instance counter_node::counterResponse :init)))

(setf (get counter_node::counterRequest :md5sum-) "4280a7cf1d34a23e38e36c574443dc71")
(setf (get counter_node::counterRequest :datatype-) "counter_node/counterRequest")
(setf (get counter_node::counterRequest :definition-)
      "int16 req_id
---
float32 reply

")

(setf (get counter_node::counterResponse :md5sum-) "4280a7cf1d34a23e38e36c574443dc71")
(setf (get counter_node::counterResponse :datatype-) "counter_node/counterResponse")
(setf (get counter_node::counterResponse :definition-)
      "int16 req_id
---
float32 reply

")



(provide :counter_node/counter "4280a7cf1d34a23e38e36c574443dc71")


