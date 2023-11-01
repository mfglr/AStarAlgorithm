; Auto-generated. Do not edit!


(cl:in-package a_star_algorithm-msg)


;//! \htmlinclude PathMessage.msg.html

(cl:defclass <PathMessage> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0)
   (sizeOfNodes
    :reader sizeOfNodes
    :initarg :sizeOfNodes
    :type cl:integer
    :initform 0)
   (nodes
    :reader nodes
    :initarg :nodes
    :type (cl:vector a_star_algorithm-msg:NodeMessage)
   :initform (cl:make-array 0 :element-type 'a_star_algorithm-msg:NodeMessage :initial-element (cl:make-instance 'a_star_algorithm-msg:NodeMessage))))
)

(cl:defclass PathMessage (<PathMessage>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PathMessage>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PathMessage)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name a_star_algorithm-msg:<PathMessage> is deprecated: use a_star_algorithm-msg:PathMessage instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <PathMessage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader a_star_algorithm-msg:id-val is deprecated.  Use a_star_algorithm-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'sizeOfNodes-val :lambda-list '(m))
(cl:defmethod sizeOfNodes-val ((m <PathMessage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader a_star_algorithm-msg:sizeOfNodes-val is deprecated.  Use a_star_algorithm-msg:sizeOfNodes instead.")
  (sizeOfNodes m))

(cl:ensure-generic-function 'nodes-val :lambda-list '(m))
(cl:defmethod nodes-val ((m <PathMessage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader a_star_algorithm-msg:nodes-val is deprecated.  Use a_star_algorithm-msg:nodes instead.")
  (nodes m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PathMessage>) ostream)
  "Serializes a message object of type '<PathMessage>"
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'sizeOfNodes)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'nodes))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'nodes))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PathMessage>) istream)
  "Deserializes a message object of type '<PathMessage>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sizeOfNodes) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'nodes) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'nodes)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'a_star_algorithm-msg:NodeMessage))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PathMessage>)))
  "Returns string type for a message object of type '<PathMessage>"
  "a_star_algorithm/PathMessage")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PathMessage)))
  "Returns string type for a message object of type 'PathMessage"
  "a_star_algorithm/PathMessage")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PathMessage>)))
  "Returns md5sum for a message object of type '<PathMessage>"
  "3a3bf4539a5dd0a368b12000b34be22d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PathMessage)))
  "Returns md5sum for a message object of type 'PathMessage"
  "3a3bf4539a5dd0a368b12000b34be22d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PathMessage>)))
  "Returns full string definition for message of type '<PathMessage>"
  (cl:format cl:nil "int32 id~%int32 sizeOfNodes~%NodeMessage[] nodes~%================================================================================~%MSG: a_star_algorithm/NodeMessage~%VectorMessage location~%int32 g~%================================================================================~%MSG: a_star_algorithm/VectorMessage~%int32 x~%int32 y~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PathMessage)))
  "Returns full string definition for message of type 'PathMessage"
  (cl:format cl:nil "int32 id~%int32 sizeOfNodes~%NodeMessage[] nodes~%================================================================================~%MSG: a_star_algorithm/NodeMessage~%VectorMessage location~%int32 g~%================================================================================~%MSG: a_star_algorithm/VectorMessage~%int32 x~%int32 y~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PathMessage>))
  (cl:+ 0
     4
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'nodes) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PathMessage>))
  "Converts a ROS message object to a list"
  (cl:list 'PathMessage
    (cl:cons ':id (id msg))
    (cl:cons ':sizeOfNodes (sizeOfNodes msg))
    (cl:cons ':nodes (nodes msg))
))
