
(cl:in-package :asdf)

(defsystem "counter_node-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "counter_reply_msg" :depends-on ("_package_counter_reply_msg"))
    (:file "_package_counter_reply_msg" :depends-on ("_package"))
  ))