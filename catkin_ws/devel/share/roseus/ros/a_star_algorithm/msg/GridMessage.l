;; Auto-generated. Do not edit!


(when (boundp 'a_star_algorithm::GridMessage)
  (if (not (find-package "A_STAR_ALGORITHM"))
    (make-package "A_STAR_ALGORITHM"))
  (shadow 'GridMessage (find-package "A_STAR_ALGORITHM")))
(unless (find-package "A_STAR_ALGORITHM::GRIDMESSAGE")
  (make-package "A_STAR_ALGORITHM::GRIDMESSAGE"))

(in-package "ROS")
;;//! \htmlinclude GridMessage.msg.html


(defclass a_star_algorithm::GridMessage
  :super ros::object
  :slots (_size _grid ))

(defmethod a_star_algorithm::GridMessage
  (:init
   (&key
    ((:size __size) 0)
    ((:grid __grid) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _size (round __size))
   (setq _grid __grid)
   self)
  (:size
   (&optional __size)
   (if __size (setq _size __size)) _size)
  (:grid
   (&optional __grid)
   (if __grid (setq _grid __grid)) _grid)
  (:serialization-length
   ()
   (+
    ;; int32 _size
    4
    ;; int32[] _grid
    (* 4    (length _grid)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _size
       (write-long _size s)
     ;; int32[] _grid
     (write-long (length _grid) s)
     (dotimes (i (length _grid))
       (write-long (elt _grid i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _size
     (setq _size (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32[] _grid
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _grid (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _grid i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get a_star_algorithm::GridMessage :md5sum-) "c0a5d0669a4de9c73b3b64e22ac14b51")
(setf (get a_star_algorithm::GridMessage :datatype-) "a_star_algorithm/GridMessage")
(setf (get a_star_algorithm::GridMessage :definition-)
      "int32 size
int32[] grid
")



(provide :a_star_algorithm/GridMessage "c0a5d0669a4de9c73b3b64e22ac14b51")


