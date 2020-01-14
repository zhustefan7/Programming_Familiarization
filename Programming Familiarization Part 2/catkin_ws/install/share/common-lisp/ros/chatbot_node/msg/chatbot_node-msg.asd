
(cl:in-package :asdf)

(defsystem "chatbot_node-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "reply_msg" :depends-on ("_package_reply_msg"))
    (:file "_package_reply_msg" :depends-on ("_package"))
  ))