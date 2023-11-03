; Auto-generated. Do not edit!


(cl:in-package a_star_algorithm-msg)


;//! \htmlinclude AlgorithmMessage.msg.html

(cl:defclass <AlgorithmMessage> (roslisp-msg-protocol:ros-message)
  ((platform
    :reader platform
    :initarg :platform
    :type a_star_algorithm-msg:PlatformMessage
    :initform (cl:make-instance 'a_star_algorithm-msg:PlatformMessage))
   (activePath
    :reader activePath
    :initarg :activePath
    :type a_star_algorithm-msg:PathMessage
    :initform (cl:make-instance 'a_star_algorithm-msg:PathMessage))
   (paths
    :reader paths
    :initarg :paths
    :type (cl:vector a_star_algorithm-msg:PathMessage)
   :initform (cl:make-array 0 :element-type 'a_star_algorithm-msg:PathMessage :initial-element (cl:make-instance 'a_star_algorithm-msg:PathMessage))))
)

(cl:defclass AlgorithmMessage (<AlgorithmMessage>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AlgorithmMessage>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AlgorithmMessage)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name a_star_algorithm-msg:<AlgorithmMessage> is deprecated: use a_star_algorithm-msg:AlgorithmMessage instead.")))

(cl:ensure-generic-function 'platform-val :lambda-list '(m))
(cl:defmethod platform-val ((m <AlgorithmMessage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader a_star_algorithm-msg:platform-val is deprecated.  Use a_star_algorithm-msg:platform instead.")
  (platform m))

(cl:ensure-generic-function 'activePath-val :lambda-list '(m))
(cl:defmethod activePath-val ((m <AlgorithmMessage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader a_star_algorithm-msg:activePath-val is deprecated.  Use a_star_algorithm-msg:activePath instead.")
  (activePath m))

(cl:ensure-generic-function 'paths-val :lambda-list '(m))
(cl:defmethod paths-val ((m <AlgorithmMessage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader a_star_algorithm-msg:paths-val is deprecated.  Use a_star_algorithm-msg:paths instead.")
  (paths m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AlgorithmMessage>) ostream)
  "Serializes a message object of type '<AlgorithmMessage>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'platform) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'activePath) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'paths))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'paths))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AlgorithmMessage>) istream)
  "Deserializes a message object of type '<AlgorithmMessage>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'platform) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'activePath) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'paths) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'paths)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'a_star_algorithm-msg:PathMessage))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AlgorithmMessage>)))
  "Returns string type for a message object of type '<AlgorithmMessage>"
  "a_star_algorithm/AlgorithmMessage")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AlgorithmMessage)))
  "Returns string type for a message object of type 'AlgorithmMessage"
  "a_star_algorithm/AlgorithmMessage")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AlgorithmMessage>)))
  "Returns md5sum for a message object of type '<AlgorithmMessage>"
  "63a360c1d5e98eca0dd6fb4c67c4258a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AlgorithmMessage)))
  "Returns md5sum for a message object of type 'AlgorithmMessage"
  "63a360c1d5e98eca0dd6fb4c67c4258a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AlgorithmMessage>)))
  "Returns full string definition for message of type '<AlgorithmMessage>"
  (cl:format cl:nil "PlatformMessage platform~%PathMessage activePath~%PathMessage[] paths~%================================================================================~%MSG: a_star_algorithm/PlatformMessage~%int32 id~%int32 size~%VectorMessage start~%VectorMessage end~%int32[] data~%~%================================================================================~%MSG: a_star_algorithm/VectorMessage~%int32 x~%int32 y~%================================================================================~%MSG: a_star_algorithm/PathMessage~%int32 id~%int32 sizeOfNodes~%NodeMessage[] nodes~%================================================================================~%MSG: a_star_algorithm/NodeMessage~%VectorMessage location~%int32 value~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AlgorithmMessage)))
  "Returns full string definition for message of type 'AlgorithmMessage"
  (cl:format cl:nil "PlatformMessage platform~%PathMessage activePath~%PathMessage[] paths~%================================================================================~%MSG: a_star_algorithm/PlatformMessage~%int32 id~%int32 size~%VectorMessage start~%VectorMessage end~%int32[] data~%~%================================================================================~%MSG: a_star_algorithm/VectorMessage~%int32 x~%int32 y~%================================================================================~%MSG: a_star_algorithm/PathMessage~%int32 id~%int32 sizeOfNodes~%NodeMessage[] nodes~%================================================================================~%MSG: a_star_algorithm/NodeMessage~%VectorMessage location~%int32 value~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AlgorithmMessage>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'platform))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'activePath))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'paths) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AlgorithmMessage>))
  "Converts a ROS message object to a list"
  (cl:list 'AlgorithmMessage
    (cl:cons ':platform (platform msg))
    (cl:cons ':activePath (activePath msg))
    (cl:cons ':paths (paths msg))
))
