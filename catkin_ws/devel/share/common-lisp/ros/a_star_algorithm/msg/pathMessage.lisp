; Auto-generated. Do not edit!


(cl:in-package a_star_algorithm-msg)


;//! \htmlinclude pathMessage.msg.html

(cl:defclass <pathMessage> (roslisp-msg-protocol:ros-message)
  ((path
    :reader path
    :initarg :path
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass pathMessage (<pathMessage>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <pathMessage>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'pathMessage)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name a_star_algorithm-msg:<pathMessage> is deprecated: use a_star_algorithm-msg:pathMessage instead.")))

(cl:ensure-generic-function 'path-val :lambda-list '(m))
(cl:defmethod path-val ((m <pathMessage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader a_star_algorithm-msg:path-val is deprecated.  Use a_star_algorithm-msg:path instead.")
  (path m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <pathMessage>) ostream)
  "Serializes a message object of type '<pathMessage>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'path))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    ))
   (cl:slot-value msg 'path))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <pathMessage>) istream)
  "Deserializes a message object of type '<pathMessage>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'path) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'path)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<pathMessage>)))
  "Returns string type for a message object of type '<pathMessage>"
  "a_star_algorithm/pathMessage")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'pathMessage)))
  "Returns string type for a message object of type 'pathMessage"
  "a_star_algorithm/pathMessage")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<pathMessage>)))
  "Returns md5sum for a message object of type '<pathMessage>"
  "1e25e195c90ff1d4c83f62d1d195014e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'pathMessage)))
  "Returns md5sum for a message object of type 'pathMessage"
  "1e25e195c90ff1d4c83f62d1d195014e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<pathMessage>)))
  "Returns full string definition for message of type '<pathMessage>"
  (cl:format cl:nil "int8[] path~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'pathMessage)))
  "Returns full string definition for message of type 'pathMessage"
  (cl:format cl:nil "int8[] path~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <pathMessage>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'path) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <pathMessage>))
  "Converts a ROS message object to a list"
  (cl:list 'pathMessage
    (cl:cons ':path (path msg))
))
