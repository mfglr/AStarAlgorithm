;; Auto-generated. Do not edit!


(when (boundp 'a_star_algorithm::PlatformMessage)
  (if (not (find-package "A_STAR_ALGORITHM"))
    (make-package "A_STAR_ALGORITHM"))
  (shadow 'PlatformMessage (find-package "A_STAR_ALGORITHM")))
(unless (find-package "A_STAR_ALGORITHM::PLATFORMMESSAGE")
  (make-package "A_STAR_ALGORITHM::PLATFORMMESSAGE"))

(in-package "ROS")
;;//! \htmlinclude PlatformMessage.msg.html


(defclass a_star_algorithm::PlatformMessage
  :super ros::object
  :slots (_id _size _start _end _data ))

(defmethod a_star_algorithm::PlatformMessage
  (:init
   (&key
    ((:id __id) 0)
    ((:size __size) 0)
    ((:start __start) (instance a_star_algorithm::VectorMessage :init))
    ((:end __end) (instance a_star_algorithm::VectorMessage :init))
    ((:data __data) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _size (round __size))
   (setq _start __start)
   (setq _end __end)
   (setq _data __data)
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:size
   (&optional __size)
   (if __size (setq _size __size)) _size)
  (:start
   (&rest __start)
   (if (keywordp (car __start))
       (send* _start __start)
     (progn
       (if __start (setq _start (car __start)))
       _start)))
  (:end
   (&rest __end)
   (if (keywordp (car __end))
       (send* _end __end)
     (progn
       (if __end (setq _end (car __end)))
       _end)))
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; int32 _id
    4
    ;; int32 _size
    4
    ;; a_star_algorithm/VectorMessage _start
    (send _start :serialization-length)
    ;; a_star_algorithm/VectorMessage _end
    (send _end :serialization-length)
    ;; int32[] _data
    (* 4    (length _data)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _id
       (write-long _id s)
     ;; int32 _size
       (write-long _size s)
     ;; a_star_algorithm/VectorMessage _start
       (send _start :serialize s)
     ;; a_star_algorithm/VectorMessage _end
       (send _end :serialize s)
     ;; int32[] _data
     (write-long (length _data) s)
     (dotimes (i (length _data))
       (write-long (elt _data i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _size
     (setq _size (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; a_star_algorithm/VectorMessage _start
     (send _start :deserialize buf ptr-) (incf ptr- (send _start :serialization-length))
   ;; a_star_algorithm/VectorMessage _end
     (send _end :deserialize buf ptr-) (incf ptr- (send _end :serialization-length))
   ;; int32[] _data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _data (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _data i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get a_star_algorithm::PlatformMessage :md5sum-) "a9b6046552f5181f0b68fa4d8d8c533d")
(setf (get a_star_algorithm::PlatformMessage :datatype-) "a_star_algorithm/PlatformMessage")
(setf (get a_star_algorithm::PlatformMessage :definition-)
      "int32 id
int32 size
VectorMessage start
VectorMessage end
int32[] data

================================================================================
MSG: a_star_algorithm/VectorMessage
int32 x
int32 y
")



(provide :a_star_algorithm/PlatformMessage "a9b6046552f5181f0b68fa4d8d8c533d")


