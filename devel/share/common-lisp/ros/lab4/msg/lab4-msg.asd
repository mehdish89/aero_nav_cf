
(cl:in-package :asdf)

(defsystem "lab4-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "Observation" :depends-on ("_package_Observation"))
    (:file "_package_Observation" :depends-on ("_package"))
    (:file "Motion" :depends-on ("_package_Motion"))
    (:file "_package_Motion" :depends-on ("_package"))
  ))