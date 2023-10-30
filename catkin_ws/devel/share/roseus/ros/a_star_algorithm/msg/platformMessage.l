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
  :slots (_size _data _start _end ))

(defmethod a_star_algorithm::platformMessage
  (:init
   (&key
    ((:size __size) 0)
    ((:data __data) (make-array 0 :initial-element 0 :element-type :integer))
    ((:start __start) (make-array 0 :initial-element 0 :element-type :integer))
    ((:end __end) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _size (round __size))
   (setq _data __data)
   (setq _start __start)
   (setq _end __end)
   self)
  (:size
   (&optional __size)
   (if __size (setq _size __size)) _size)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:start
   (&optional __start)
   (if __start (setq _start __start)) _start)
  (:end
   (&optional __end)
   (if __end (setq _end __end)) _end)
  (:serialization-length
   ()
   (+
    ;; int8 _size
    1
    ;; int8[] _data
    (* 1    (length _data)) 4
    ;; int8[] _start
    (* 1    (length _start)) 4
    ;; int8[] _end
    (* 1    (length _end)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _size
       (write-byte _size s)
     ;; int8[] _data
     (write-long (length _data) s)
     (dotimes (i (length _data))
       (write-byte (elt _data i) s)
       )
     ;; int8[] _start
     (write-long (length _start) s)
     (dotimes (i (length _start))
       (write-byte (elt _start i) s)
       )
     ;; int8[] _end
     (write-long (length _end) s)
     (dotimes (i (length _end))
       (write-byte (elt _end i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _size
     (setq _size (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _size 127) (setq _size (- _size 256)))
   ;; int8[] _data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _data (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _data i) (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> (elt _data i) 127) (setf (elt _data i) (- (elt _data i) 256)))
     ))
   ;; int8[] _start
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _start (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _start i) (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> (elt _start i) 127) (setf (elt _start i) (- (elt _start i) 256)))
     ))
   ;; int8[] _end
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _end (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _end i) (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> (elt _end i) 127) (setf (elt _end i) (- (elt _end i) 256)))
     ))
   ;;
   self)
  )

(setf (get a_star_algorithm::platformMessage :md5sum-) "6bc147b333d921576cde564f05a07c0b")
(setf (get a_star_algorithm::platformMessage :datatype-) "a_star_algorithm/platformMessage")
(setf (get a_star_algorithm::platformMessage :definition-)
      "int8 size
int8[] data
int8[] start
int8[] end
")



(provide :a_star_algorithm/platformMessage "6bc147b333d921576cde564f05a07c0b")


