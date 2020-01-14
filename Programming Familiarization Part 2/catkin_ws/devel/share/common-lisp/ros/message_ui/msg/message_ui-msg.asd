
(cl:in-package :asdf)

(defsystem "message_ui-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "sent_msg" :depends-on ("_package_sent_msg"))
    (:file "_package_sent_msg" :depends-on ("_package"))
  ))