; Auto-generated. Do not edit!


(cl:in-package lab5-srv)


;//! \htmlinclude Position-request.msg.html

(cl:defclass <Position-request> (roslisp-msg-protocol:ros-message)
  ((i
    :reader i
    :initarg :i
    :type cl:integer
    :initform 0))
)

(cl:defclass Position-request (<Position-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Position-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Position-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lab5-srv:<Position-request> is deprecated: use lab5-srv:Position-request instead.")))

(cl:ensure-generic-function 'i-val :lambda-list '(m))
(cl:defmethod i-val ((m <Position-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lab5-srv:i-val is deprecated.  Use lab5-srv:i instead.")
  (i m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Position-request>) ostream)
  "Serializes a message object of type '<Position-request>"
  (cl:let* ((signed (cl:slot-value msg 'i)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Position-request>) istream)
  "Deserializes a message object of type '<Position-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Position-request>)))
  "Returns string type for a service object of type '<Position-request>"
  "lab5/PositionRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Position-request)))
  "Returns string type for a service object of type 'Position-request"
  "lab5/PositionRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Position-request>)))
  "Returns md5sum for a message object of type '<Position-request>"
  "e08ef57940873b4e7c6ae9af91d65b85")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Position-request)))
  "Returns md5sum for a message object of type 'Position-request"
  "e08ef57940873b4e7c6ae9af91d65b85")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Position-request>)))
  "Returns full string definition for message of type '<Position-request>"
  (cl:format cl:nil "int32 i~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Position-request)))
  "Returns full string definition for message of type 'Position-request"
  (cl:format cl:nil "int32 i~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Position-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Position-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Position-request
    (cl:cons ':i (i msg))
))
;//! \htmlinclude Position-response.msg.html

(cl:defclass <Position-response> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0))
)

(cl:defclass Position-response (<Position-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Position-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Position-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lab5-srv:<Position-response> is deprecated: use lab5-srv:Position-response instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <Position-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lab5-srv:x-val is deprecated.  Use lab5-srv:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <Position-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lab5-srv:y-val is deprecated.  Use lab5-srv:y instead.")
  (y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Position-response>) ostream)
  "Serializes a message object of type '<Position-response>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Position-response>) istream)
  "Deserializes a message object of type '<Position-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Position-response>)))
  "Returns string type for a service object of type '<Position-response>"
  "lab5/PositionResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Position-response)))
  "Returns string type for a service object of type 'Position-response"
  "lab5/PositionResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Position-response>)))
  "Returns md5sum for a message object of type '<Position-response>"
  "e08ef57940873b4e7c6ae9af91d65b85")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Position-response)))
  "Returns md5sum for a message object of type 'Position-response"
  "e08ef57940873b4e7c6ae9af91d65b85")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Position-response>)))
  "Returns full string definition for message of type '<Position-response>"
  (cl:format cl:nil "float64 x~%float64 y~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Position-response)))
  "Returns full string definition for message of type 'Position-response"
  (cl:format cl:nil "float64 x~%float64 y~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Position-response>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Position-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Position-response
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Position)))
  'Position-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Position)))
  'Position-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Position)))
  "Returns string type for a service object of type '<Position>"
  "lab5/Position")