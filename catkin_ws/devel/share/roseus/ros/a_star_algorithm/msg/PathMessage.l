;; Auto-generated. Do not edit!


(when (boundp 'a_star_algorithm::PathMessage)
  (if (not (find-package "A_STAR_ALGORITHM"))
    (make-package "A_STAR_ALGORITHM"))
  (shadow 'PathMessage (find-package "A_STAR_ALGORITHM")))
(unless (find-package "A_STAR_ALGORITHM::PATHMESSAGE")
  (make-package "A_STAR_ALGORITHM::PATHMESSAGE"))

(in-package "ROS")
;;//! \htmlinclude PathMessage.msg.html


(defclass a_star_algorithm::PathMessage
  :super ros::object
  :slots (_id _sizeOfNodes _nodes ))

(defmethod a_star_algorithm::PathMessage
  (:init
   (&key
    ((:id __id) 0)
    ((:sizeOfNodes __sizeOfNodes) 0)
    ((:nodes __nodes) ())
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _sizeOfNodes (round __sizeOfNodes))
   (setq _nodes __nodes)
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:sizeOfNodes
   (&optional __sizeOfNodes)
   (if __sizeOfNodes (setq _sizeOfNodes __sizeOfNodes)) _sizeOfNodes)
  (:nodes
   (&rest __nodes)
   (if (keywordp (car __nodes))
       (send* _nodes __nodes)
     (progn
       (if __nodes (setq _nodes (car __nodes)))
       _nodes)))
  (:serialization-length
   ()
   (+
    ;; int32 _id
    4
    ;; int32 _sizeOfNodes
    4
    ;; a_star_algorithm/NodeMessage[] _nodes
    (apply #'+ (send-all _nodes :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _id
       (write-long _id s)
     ;; int32 _sizeOfNodes
       (write-long _sizeOfNodes s)
     ;; a_star_algorithm/NodeMessage[] _nodes
     (write-long (length _nodes) s)
     (dolist (elem _nodes)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _sizeOfNodes
     (setq _sizeOfNodes (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; a_star_algorithm/NodeMessage[] _nodes
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _nodes (let (r) (dotimes (i n) (push (instance a_star_algorithm::NodeMessage :init) r)) r))
     (dolist (elem- _nodes)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get a_star_algorithm::PathMessage :md5sum-) "811bbae5e142336076d4597212609193")
(setf (get a_star_algorithm::PathMessage :datatype-) "a_star_algorithm/PathMessage")
(setf (get a_star_algorithm::PathMessage :definition-)
      "int32 id
int32 sizeOfNodes
NodeMessage[] nodes
================================================================================
MSG: a_star_algorithm/NodeMessage
VectorMessage location
int32 value
================================================================================
MSG: a_star_algorithm/VectorMessage
int32 x
int32 y
")



(provide :a_star_algorithm/PathMessage "811bbae5e142336076d4597212609193")


