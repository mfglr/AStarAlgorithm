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
  :slots (_id _sizeOfNodes _path ))

(defmethod a_star_algorithm::PathMessage
  (:init
   (&key
    ((:id __id) 0)
    ((:sizeOfNodes __sizeOfNodes) 0)
    ((:path __path) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _sizeOfNodes (round __sizeOfNodes))
   (setq _path __path)
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:sizeOfNodes
   (&optional __sizeOfNodes)
   (if __sizeOfNodes (setq _sizeOfNodes __sizeOfNodes)) _sizeOfNodes)
  (:path
   (&optional __path)
   (if __path (setq _path __path)) _path)
  (:serialization-length
   ()
   (+
    ;; int32 _id
    4
    ;; int32 _sizeOfNodes
    4
    ;; int32[] _path
    (* 4    (length _path)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _id
       (write-long _id s)
     ;; int32 _sizeOfNodes
       (write-long _sizeOfNodes s)
     ;; int32[] _path
     (write-long (length _path) s)
     (dotimes (i (length _path))
       (write-long (elt _path i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _sizeOfNodes
     (setq _sizeOfNodes (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32[] _path
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _path (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _path i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get a_star_algorithm::PathMessage :md5sum-) "126cd8f525eab64ba326556281e7f16a")
(setf (get a_star_algorithm::PathMessage :datatype-) "a_star_algorithm/PathMessage")
(setf (get a_star_algorithm::PathMessage :definition-)
      "int32 id
int32 sizeOfNodes
int32[] path
")



(provide :a_star_algorithm/PathMessage "126cd8f525eab64ba326556281e7f16a")


