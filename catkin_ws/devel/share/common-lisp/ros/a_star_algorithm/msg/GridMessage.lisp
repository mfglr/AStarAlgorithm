; Auto-generated. Do not edit!


(cl:in-package a_star_algorithm-msg)


;//! \htmlinclude GridMessage.msg.html

(cl:defclass <GridMessage> (roslisp-msg-protocol:ros-message)
  ((size
    :reader size
    :initarg :size
    :type cl:integer
    :initform 0)
   (grid
    :reader grid
    :initarg :grid
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass GridMessage (<GridMessage>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GridMessage>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GridMessage)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name a_star_algorithm-msg:<GridMessage> is deprecated: use a_star_algorithm-msg:GridMessage instead.")))

(cl:ensure-generic-function 'size-val :lambda-list '(m))
(cl:defmethod size-val ((m <GridMessage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader a_star_algorithm-msg:size-val is deprecated.  Use a_star_algorithm-msg:size instead.")
  (size m))

(cl:ensure-generic-function 'grid-val :lambda-list '(m))
(cl:defmethod grid-val ((m <GridMessage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader a_star_algorithm-msg:grid-val is deprecated.  Use a_star_algorithm-msg:grid instead.")
  (grid m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GridMessage>) ostream)
  "Serializes a message object of type '<GridMessage>"
  (cl:let* ((signed (cl:slot-value msg 'size)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'grid))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'grid))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GridMessage>) istream)
  "Deserializes a message object of type '<GridMessage>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'size) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'grid) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'grid)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GridMessage>)))
  "Returns string type for a message object of type '<GridMessage>"
  "a_star_algorithm/GridMessage")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GridMessage)))
  "Returns string type for a message object of type 'GridMessage"
  "a_star_algorithm/GridMessage")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GridMessage>)))
  "Returns md5sum for a message object of type '<GridMessage>"
  "c0a5d0669a4de9c73b3b64e22ac14b51")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GridMessage)))
  "Returns md5sum for a message object of type 'GridMessage"
  "c0a5d0669a4de9c73b3b64e22ac14b51")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GridMessage>)))
  "Returns full string definition for message of type '<GridMessage>"
  (cl:format cl:nil "int32 size~%int32[] grid~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GridMessage)))
  "Returns full string definition for message of type 'GridMessage"
  (cl:format cl:nil "int32 size~%int32[] grid~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GridMessage>))
  (cl:+ 0
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'grid) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GridMessage>))
  "Converts a ROS message object to a list"
  (cl:list 'GridMessage
    (cl:cons ':size (size msg))
    (cl:cons ':grid (grid msg))
))
