; Auto-generated. Do not edit!


(cl:in-package lab4-msg)


;//! \htmlinclude Observation.msg.html

(cl:defclass <Observation> (roslisp-msg-protocol:ros-message)
  ((timeTag
    :reader timeTag
    :initarg :timeTag
    :type cl:integer
    :initform 0)
   (tagNum
    :reader tagNum
    :initarg :tagNum
    :type cl:integer
    :initform 0)
   (range
    :reader range
    :initarg :range
    :type cl:float
    :initform 0.0)
   (bearing
    :reader bearing
    :initarg :bearing
    :type geometry_msgs-msg:Quaternion
    :initform (cl:make-instance 'geometry_msgs-msg:Quaternion)))
)

(cl:defclass Observation (<Observation>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Observation>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Observation)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lab4-msg:<Observation> is deprecated: use lab4-msg:Observation instead.")))

(cl:ensure-generic-function 'timeTag-val :lambda-list '(m))
(cl:defmethod timeTag-val ((m <Observation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lab4-msg:timeTag-val is deprecated.  Use lab4-msg:timeTag instead.")
  (timeTag m))

(cl:ensure-generic-function 'tagNum-val :lambda-list '(m))
(cl:defmethod tagNum-val ((m <Observation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lab4-msg:tagNum-val is deprecated.  Use lab4-msg:tagNum instead.")
  (tagNum m))

(cl:ensure-generic-function 'range-val :lambda-list '(m))
(cl:defmethod range-val ((m <Observation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lab4-msg:range-val is deprecated.  Use lab4-msg:range instead.")
  (range m))

(cl:ensure-generic-function 'bearing-val :lambda-list '(m))
(cl:defmethod bearing-val ((m <Observation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lab4-msg:bearing-val is deprecated.  Use lab4-msg:bearing instead.")
  (bearing m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Observation>) ostream)
  "Serializes a message object of type '<Observation>"
  (cl:let* ((signed (cl:slot-value msg 'timeTag)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'tagNum)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'range))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'bearing) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Observation>) istream)
  "Deserializes a message object of type '<Observation>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'timeTag) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'tagNum) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'range) (roslisp-utils:decode-double-float-bits bits)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'bearing) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Observation>)))
  "Returns string type for a message object of type '<Observation>"
  "lab4/Observation")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Observation)))
  "Returns string type for a message object of type 'Observation"
  "lab4/Observation")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Observation>)))
  "Returns md5sum for a message object of type '<Observation>"
  "b962468f892f707011ae231ec4acdeb5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Observation)))
  "Returns md5sum for a message object of type 'Observation"
  "b962468f892f707011ae231ec4acdeb5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Observation>)))
  "Returns full string definition for message of type '<Observation>"
  (cl:format cl:nil "int32 timeTag~%int32 tagNum~%float64 range~%geometry_msgs/Quaternion bearing~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Observation)))
  "Returns full string definition for message of type 'Observation"
  (cl:format cl:nil "int32 timeTag~%int32 tagNum~%float64 range~%geometry_msgs/Quaternion bearing~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Observation>))
  (cl:+ 0
     4
     4
     8
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'bearing))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Observation>))
  "Converts a ROS message object to a list"
  (cl:list 'Observation
    (cl:cons ':timeTag (timeTag msg))
    (cl:cons ':tagNum (tagNum msg))
    (cl:cons ':range (range msg))
    (cl:cons ':bearing (bearing msg))
))
