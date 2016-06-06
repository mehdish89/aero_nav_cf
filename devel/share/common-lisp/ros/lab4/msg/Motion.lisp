; Auto-generated. Do not edit!


(cl:in-package lab4-msg)


;//! \htmlinclude Motion.msg.html

(cl:defclass <Motion> (roslisp-msg-protocol:ros-message)
  ((timeTag
    :reader timeTag
    :initarg :timeTag
    :type cl:integer
    :initform 0)
   (rotation1
    :reader rotation1
    :initarg :rotation1
    :type geometry_msgs-msg:Quaternion
    :initform (cl:make-instance 'geometry_msgs-msg:Quaternion))
   (translation
    :reader translation
    :initarg :translation
    :type cl:float
    :initform 0.0)
   (rotation2
    :reader rotation2
    :initarg :rotation2
    :type geometry_msgs-msg:Quaternion
    :initform (cl:make-instance 'geometry_msgs-msg:Quaternion)))
)

(cl:defclass Motion (<Motion>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Motion>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Motion)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lab4-msg:<Motion> is deprecated: use lab4-msg:Motion instead.")))

(cl:ensure-generic-function 'timeTag-val :lambda-list '(m))
(cl:defmethod timeTag-val ((m <Motion>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lab4-msg:timeTag-val is deprecated.  Use lab4-msg:timeTag instead.")
  (timeTag m))

(cl:ensure-generic-function 'rotation1-val :lambda-list '(m))
(cl:defmethod rotation1-val ((m <Motion>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lab4-msg:rotation1-val is deprecated.  Use lab4-msg:rotation1 instead.")
  (rotation1 m))

(cl:ensure-generic-function 'translation-val :lambda-list '(m))
(cl:defmethod translation-val ((m <Motion>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lab4-msg:translation-val is deprecated.  Use lab4-msg:translation instead.")
  (translation m))

(cl:ensure-generic-function 'rotation2-val :lambda-list '(m))
(cl:defmethod rotation2-val ((m <Motion>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lab4-msg:rotation2-val is deprecated.  Use lab4-msg:rotation2 instead.")
  (rotation2 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Motion>) ostream)
  "Serializes a message object of type '<Motion>"
  (cl:let* ((signed (cl:slot-value msg 'timeTag)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'rotation1) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'translation))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'rotation2) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Motion>) istream)
  "Deserializes a message object of type '<Motion>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'timeTag) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'rotation1) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'translation) (roslisp-utils:decode-double-float-bits bits)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'rotation2) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Motion>)))
  "Returns string type for a message object of type '<Motion>"
  "lab4/Motion")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Motion)))
  "Returns string type for a message object of type 'Motion"
  "lab4/Motion")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Motion>)))
  "Returns md5sum for a message object of type '<Motion>"
  "720b0c53a7b95aaae8783915252c8f0d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Motion)))
  "Returns md5sum for a message object of type 'Motion"
  "720b0c53a7b95aaae8783915252c8f0d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Motion>)))
  "Returns full string definition for message of type '<Motion>"
  (cl:format cl:nil "int32 timeTag~%geometry_msgs/Quaternion rotation1~%float64 translation~%geometry_msgs/Quaternion rotation2~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Motion)))
  "Returns full string definition for message of type 'Motion"
  (cl:format cl:nil "int32 timeTag~%geometry_msgs/Quaternion rotation1~%float64 translation~%geometry_msgs/Quaternion rotation2~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Motion>))
  (cl:+ 0
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'rotation1))
     8
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'rotation2))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Motion>))
  "Converts a ROS message object to a list"
  (cl:list 'Motion
    (cl:cons ':timeTag (timeTag msg))
    (cl:cons ':rotation1 (rotation1 msg))
    (cl:cons ':translation (translation msg))
    (cl:cons ':rotation2 (rotation2 msg))
))
