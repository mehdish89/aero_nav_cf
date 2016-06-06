; Auto-generated. Do not edit!


(cl:in-package lab5-srv)


;//! \htmlinclude MoveBot-request.msg.html

(cl:defclass <MoveBot-request> (roslisp-msg-protocol:ros-message)
  ((i
    :reader i
    :initarg :i
    :type cl:integer
    :initform 0)
   (j
    :reader j
    :initarg :j
    :type cl:integer
    :initform 0))
)

(cl:defclass MoveBot-request (<MoveBot-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveBot-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveBot-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lab5-srv:<MoveBot-request> is deprecated: use lab5-srv:MoveBot-request instead.")))

(cl:ensure-generic-function 'i-val :lambda-list '(m))
(cl:defmethod i-val ((m <MoveBot-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lab5-srv:i-val is deprecated.  Use lab5-srv:i instead.")
  (i m))

(cl:ensure-generic-function 'j-val :lambda-list '(m))
(cl:defmethod j-val ((m <MoveBot-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lab5-srv:j-val is deprecated.  Use lab5-srv:j instead.")
  (j m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveBot-request>) ostream)
  "Serializes a message object of type '<MoveBot-request>"
  (cl:let* ((signed (cl:slot-value msg 'i)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'j)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveBot-request>) istream)
  "Deserializes a message object of type '<MoveBot-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'j) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveBot-request>)))
  "Returns string type for a service object of type '<MoveBot-request>"
  "lab5/MoveBotRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveBot-request)))
  "Returns string type for a service object of type 'MoveBot-request"
  "lab5/MoveBotRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveBot-request>)))
  "Returns md5sum for a message object of type '<MoveBot-request>"
  "13049e71ce257115ce81a97e5adc1c6e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveBot-request)))
  "Returns md5sum for a message object of type 'MoveBot-request"
  "13049e71ce257115ce81a97e5adc1c6e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveBot-request>)))
  "Returns full string definition for message of type '<MoveBot-request>"
  (cl:format cl:nil "int32 i~%int32 j~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveBot-request)))
  "Returns full string definition for message of type 'MoveBot-request"
  (cl:format cl:nil "int32 i~%int32 j~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveBot-request>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveBot-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveBot-request
    (cl:cons ':i (i msg))
    (cl:cons ':j (j msg))
))
;//! \htmlinclude MoveBot-response.msg.html

(cl:defclass <MoveBot-response> (roslisp-msg-protocol:ros-message)
  ((status
    :reader status
    :initarg :status
    :type cl:string
    :initform ""))
)

(cl:defclass MoveBot-response (<MoveBot-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveBot-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveBot-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lab5-srv:<MoveBot-response> is deprecated: use lab5-srv:MoveBot-response instead.")))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <MoveBot-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lab5-srv:status-val is deprecated.  Use lab5-srv:status instead.")
  (status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveBot-response>) ostream)
  "Serializes a message object of type '<MoveBot-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'status))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'status))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveBot-response>) istream)
  "Deserializes a message object of type '<MoveBot-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'status) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveBot-response>)))
  "Returns string type for a service object of type '<MoveBot-response>"
  "lab5/MoveBotResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveBot-response)))
  "Returns string type for a service object of type 'MoveBot-response"
  "lab5/MoveBotResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveBot-response>)))
  "Returns md5sum for a message object of type '<MoveBot-response>"
  "13049e71ce257115ce81a97e5adc1c6e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveBot-response)))
  "Returns md5sum for a message object of type 'MoveBot-response"
  "13049e71ce257115ce81a97e5adc1c6e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveBot-response>)))
  "Returns full string definition for message of type '<MoveBot-response>"
  (cl:format cl:nil "string status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveBot-response)))
  "Returns full string definition for message of type 'MoveBot-response"
  (cl:format cl:nil "string status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveBot-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'status))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveBot-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveBot-response
    (cl:cons ':status (status msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MoveBot)))
  'MoveBot-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MoveBot)))
  'MoveBot-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveBot)))
  "Returns string type for a service object of type '<MoveBot>"
  "lab5/MoveBot")