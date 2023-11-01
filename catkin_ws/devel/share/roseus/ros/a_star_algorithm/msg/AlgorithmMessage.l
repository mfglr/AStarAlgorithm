;; Auto-generated. Do not edit!


(when (boundp 'a_star_algorithm::AlgorithmMessage)
  (if (not (find-package "A_STAR_ALGORITHM"))
    (make-package "A_STAR_ALGORITHM"))
  (shadow 'AlgorithmMessage (find-package "A_STAR_ALGORITHM")))
(unless (find-package "A_STAR_ALGORITHM::ALGORITHMMESSAGE")
  (make-package "A_STAR_ALGORITHM::ALGORITHMMESSAGE"))

(in-package "ROS")
;;//! \htmlinclude AlgorithmMessage.msg.html


(defclass a_star_algorithm::AlgorithmMessage
  :super ros::object
  :slots (_platform _activePath _paths ))

(defmethod a_star_algorithm::AlgorithmMessage
  (:init
   (&key
    ((:platform __platform) (instance a_star_algorithm::PlatformMessage :init))
    ((:activePath __activePath) (instance a_star_algorithm::PathMessage :init))
    ((:paths __paths) ())
    )
   (send-super :init)
   (setq _platform __platform)
   (setq _activePath __activePath)
   (setq _paths __paths)
   self)
  (:platform
   (&rest __platform)
   (if (keywordp (car __platform))
       (send* _platform __platform)
     (progn
       (if __platform (setq _platform (car __platform)))
       _platform)))
  (:activePath
   (&rest __activePath)
   (if (keywordp (car __activePath))
       (send* _activePath __activePath)
     (progn
       (if __activePath (setq _activePath (car __activePath)))
       _activePath)))
  (:paths
   (&rest __paths)
   (if (keywordp (car __paths))
       (send* _paths __paths)
     (progn
       (if __paths (setq _paths (car __paths)))
       _paths)))
  (:serialization-length
   ()
   (+
    ;; a_star_algorithm/PlatformMessage _platform
    (send _platform :serialization-length)
    ;; a_star_algorithm/PathMessage _activePath
    (send _activePath :serialization-length)
    ;; a_star_algorithm/PathMessage[] _paths
    (apply #'+ (send-all _paths :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; a_star_algorithm/PlatformMessage _platform
       (send _platform :serialize s)
     ;; a_star_algorithm/PathMessage _activePath
       (send _activePath :serialize s)
     ;; a_star_algorithm/PathMessage[] _paths
     (write-long (length _paths) s)
     (dolist (elem _paths)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; a_star_algorithm/PlatformMessage _platform
     (send _platform :deserialize buf ptr-) (incf ptr- (send _platform :serialization-length))
   ;; a_star_algorithm/PathMessage _activePath
     (send _activePath :deserialize buf ptr-) (incf ptr- (send _activePath :serialization-length))
   ;; a_star_algorithm/PathMessage[] _paths
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _paths (let (r) (dotimes (i n) (push (instance a_star_algorithm::PathMessage :init) r)) r))
     (dolist (elem- _paths)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get a_star_algorithm::AlgorithmMessage :md5sum-) "ce4c2d0aafc2657f6ef6618d564bf819")
(setf (get a_star_algorithm::AlgorithmMessage :datatype-) "a_star_algorithm/AlgorithmMessage")
(setf (get a_star_algorithm::AlgorithmMessage :definition-)
      "PlatformMessage platform
PathMessage activePath
PathMessage[] paths
================================================================================
MSG: a_star_algorithm/PlatformMessage
int32 id
int32 size
VectorMessage start
VectorMessage end
int32[] data

================================================================================
MSG: a_star_algorithm/VectorMessage
int32 x
int32 y
================================================================================
MSG: a_star_algorithm/PathMessage
int32 id
int32 sizeOfNodes
NodeMessage[] nodes
================================================================================
MSG: a_star_algorithm/NodeMessage
VectorMessage location
int32 g
")



(provide :a_star_algorithm/AlgorithmMessage "ce4c2d0aafc2657f6ef6618d564bf819")


