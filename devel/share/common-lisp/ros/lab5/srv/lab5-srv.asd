
(cl:in-package :asdf)

(defsystem "lab5-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Position" :depends-on ("_package_Position"))
    (:file "_package_Position" :depends-on ("_package"))
    (:file "MoveBot" :depends-on ("_package_MoveBot"))
    (:file "_package_MoveBot" :depends-on ("_package"))
  ))