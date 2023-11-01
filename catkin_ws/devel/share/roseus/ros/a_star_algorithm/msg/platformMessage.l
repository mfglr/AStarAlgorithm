;; Auto-generated. Do not edit!


(when (boundp 'a_star_algorithm::platformMessage)
  (if (not (find-package "A_STAR_ALGORITHM"))
    (make-package "A_STAR_ALGORITHM"))
  (shadow 'platformMessage (find-package "A_STAR_ALGORITHM")))
(unless (find-package "A_STAR_ALGORITHM::PLATFORMMESSAGE")
  (make-package "A_STAR_ALGORITHM::PLATFORMMESSAGE"))

(in-package "ROS")
;;//! \htmlinclude platformMessage.msg.html


(defclass a_star_algorithm::platformMessage
  :super ros::object
  :slots (_id _size _start _end _data ))

(defmethod a_star_algorithm::platformMessage
  (:init
   (&key
    ((:id __id) 0)
    ((:size __size) 0)
    ((:start __start) (make-array 0 :initial-element 0 :element-type :integer))
    ((:end __end) (make-array 0 :initial-element 0 :element-type :integer))
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
   (&optional __start)
   (if __start (setq _start __start)) _start)
  (:end
   (&optional __end)
   (if __end (setq _end __end)) _end)
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
    ;; int32[] _start
    (* 4    (length _start)) 4
    ;; int32[] _end
    (* 4    (length _end)) 4
    ;; int8[] _data
    (* 1    (length _data)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _id
       (write-long _id s)
     ;; int32 _size
       (write-long _size s)
     ;; int32[] _start
     (write-long (length _start) s)
     (dotimes (i (length _start))
       (write-long (elt _start i) s)
       )
     ;; int32[] _end
     (write-long (length _end) s)
     (dotimes (i (length _end))
       (write-long (elt _end i) s)
       )
     ;; int8[] _data
     (write-long (length _data) s)
     (dotimes (i (length _data))
       (write-byte (elt _data i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _size
     (setq _size (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32[] _start
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _start (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _start i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32[] _end
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _end (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _end i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int8[] _data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _data (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _data i) (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> (elt _data i) 127) (setf (elt _data i) (- (elt _data i) 256)))
     ))
   ;;
   self)
  )

(setf (get a_star_algorithm::platformMessage :md5sum-) "a52ae1bdbb73caa3e00e36dbb90510bc")
(setf (get a_star_algorithm::platformMessage :datatype-) "a_star_algorithm/platformMessage")
(setf (get a_star_algorithm::platformMessage :definition-)
      "int32 id
int32 size
int32[] start
int32[] end
int8[] data

")



(provide :a_star_algorithm/platformMessage "a52ae1bdbb73caa3e00e36dbb90510bc")


