;; Auto-generated. Do not edit!


(when (boundp 'a_star_algorithm::NodeMessage)
  (if (not (find-package "A_STAR_ALGORITHM"))
    (make-package "A_STAR_ALGORITHM"))
  (shadow 'NodeMessage (find-package "A_STAR_ALGORITHM")))
(unless (find-package "A_STAR_ALGORITHM::NODEMESSAGE")
  (make-package "A_STAR_ALGORITHM::NODEMESSAGE"))

(in-package "ROS")
;;//! \htmlinclude NodeMessage.msg.html


(defclass a_star_algorithm::NodeMessage
  :super ros::object
  :slots (_location _g ))

(defmethod a_star_algorithm::NodeMessage
  (:init
   (&key
    ((:location __location) (instance a_star_algorithm::VectorMessage :init))
    ((:g __g) 0)
    )
   (send-super :init)
   (setq _location __location)
   (setq _g (round __g))
   self)
  (:location
   (&rest __location)
   (if (keywordp (car __location))
       (send* _location __location)
     (progn
       (if __location (setq _location (car __location)))
       _location)))
  (:g
   (&optional __g)
   (if __g (setq _g __g)) _g)
  (:serialization-length
   ()
   (+
    ;; a_star_algorithm/VectorMessage _location
    (send _location :serialization-length)
    ;; int32 _g
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; a_star_algorithm/VectorMessage _location
       (send _location :serialize s)
     ;; int32 _g
       (write-long _g s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; a_star_algorithm/VectorMessage _location
     (send _location :deserialize buf ptr-) (incf ptr- (send _location :serialization-length))
   ;; int32 _g
     (setq _g (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get a_star_algorithm::NodeMessage :md5sum-) "055d2c8f3fa27ed8eee4293f534be47c")
(setf (get a_star_algorithm::NodeMessage :datatype-) "a_star_algorithm/NodeMessage")
(setf (get a_star_algorithm::NodeMessage :definition-)
      "VectorMessage location
int32 g
================================================================================
MSG: a_star_algorithm/VectorMessage
int32 x
int32 y
")



(provide :a_star_algorithm/NodeMessage "055d2c8f3fa27ed8eee4293f534be47c")


