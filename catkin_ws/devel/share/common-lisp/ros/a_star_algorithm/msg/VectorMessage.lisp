; Auto-generated. Do not edit!


(cl:in-package a_star_algorithm-msg)


;//! \htmlinclude VectorMessage.msg.html

(cl:defclass <VectorMessage> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:integer
    :initform 0)
   (y
    :reader y
    :initarg :y
    :type cl:integer
    :initform 0))
)

(cl:defclass VectorMessage (<VectorMessage>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <VectorMessage>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'VectorMessage)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name a_star_algorithm-msg:<VectorMessage> is deprecated: use a_star_algorithm-msg:VectorMessage instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <VectorMessage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader a_star_algorithm-msg:x-val is deprecated.  Use a_star_algorithm-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <VectorMessage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader a_star_algorithm-msg:y-val is deprecated.  Use a_star_algorithm-msg:y instead.")
  (y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <VectorMessage>) ostream)
  "Serializes a message object of type '<VectorMessage>"
  (cl:let* ((signed (cl:slot-value msg 'x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'y)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <VectorMessage>) istream)
  "Deserializes a message object of type '<VectorMessage>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'x) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'y) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<VectorMessage>)))
  "Returns string type for a message object of type '<VectorMessage>"
  "a_star_algorithm/VectorMessage")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VectorMessage)))
  "Returns string type for a message object of type 'VectorMessage"
  "a_star_algorithm/VectorMessage")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<VectorMessage>)))
  "Returns md5sum for a message object of type '<VectorMessage>"
  "bd7b43fd41d4c47bf5c703cc7d016709")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'VectorMessage)))
  "Returns md5sum for a message object of type 'VectorMessage"
  "bd7b43fd41d4c47bf5c703cc7d016709")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<VectorMessage>)))
  "Returns full string definition for message of type '<VectorMessage>"
  (cl:format cl:nil "int32 x~%int32 y~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'VectorMessage)))
  "Returns full string definition for message of type 'VectorMessage"
  (cl:format cl:nil "int32 x~%int32 y~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <VectorMessage>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <VectorMessage>))
  "Converts a ROS message object to a list"
  (cl:list 'VectorMessage
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
))
