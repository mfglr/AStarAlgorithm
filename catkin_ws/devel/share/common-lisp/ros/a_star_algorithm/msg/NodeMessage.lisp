; Auto-generated. Do not edit!


(cl:in-package a_star_algorithm-msg)


;//! \htmlinclude NodeMessage.msg.html

(cl:defclass <NodeMessage> (roslisp-msg-protocol:ros-message)
  ((location
    :reader location
    :initarg :location
    :type a_star_algorithm-msg:VectorMessage
    :initform (cl:make-instance 'a_star_algorithm-msg:VectorMessage))
   (value
    :reader value
    :initarg :value
    :type cl:integer
    :initform 0))
)

(cl:defclass NodeMessage (<NodeMessage>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <NodeMessage>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'NodeMessage)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name a_star_algorithm-msg:<NodeMessage> is deprecated: use a_star_algorithm-msg:NodeMessage instead.")))

(cl:ensure-generic-function 'location-val :lambda-list '(m))
(cl:defmethod location-val ((m <NodeMessage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader a_star_algorithm-msg:location-val is deprecated.  Use a_star_algorithm-msg:location instead.")
  (location m))

(cl:ensure-generic-function 'value-val :lambda-list '(m))
(cl:defmethod value-val ((m <NodeMessage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader a_star_algorithm-msg:value-val is deprecated.  Use a_star_algorithm-msg:value instead.")
  (value m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <NodeMessage>) ostream)
  "Serializes a message object of type '<NodeMessage>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'location) ostream)
  (cl:let* ((signed (cl:slot-value msg 'value)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <NodeMessage>) istream)
  "Deserializes a message object of type '<NodeMessage>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'location) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'value) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<NodeMessage>)))
  "Returns string type for a message object of type '<NodeMessage>"
  "a_star_algorithm/NodeMessage")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'NodeMessage)))
  "Returns string type for a message object of type 'NodeMessage"
  "a_star_algorithm/NodeMessage")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<NodeMessage>)))
  "Returns md5sum for a message object of type '<NodeMessage>"
  "bdea65e7844ffe19096249ab018e2217")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'NodeMessage)))
  "Returns md5sum for a message object of type 'NodeMessage"
  "bdea65e7844ffe19096249ab018e2217")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<NodeMessage>)))
  "Returns full string definition for message of type '<NodeMessage>"
  (cl:format cl:nil "VectorMessage location~%int32 value~%================================================================================~%MSG: a_star_algorithm/VectorMessage~%int32 x~%int32 y~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'NodeMessage)))
  "Returns full string definition for message of type 'NodeMessage"
  (cl:format cl:nil "VectorMessage location~%int32 value~%================================================================================~%MSG: a_star_algorithm/VectorMessage~%int32 x~%int32 y~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <NodeMessage>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'location))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <NodeMessage>))
  "Converts a ROS message object to a list"
  (cl:list 'NodeMessage
    (cl:cons ':location (location msg))
    (cl:cons ':value (value msg))
))
