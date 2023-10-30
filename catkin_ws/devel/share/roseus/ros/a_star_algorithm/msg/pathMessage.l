;; Auto-generated. Do not edit!


(when (boundp 'a_star_algorithm::pathMessage)
  (if (not (find-package "A_STAR_ALGORITHM"))
    (make-package "A_STAR_ALGORITHM"))
  (shadow 'pathMessage (find-package "A_STAR_ALGORITHM")))
(unless (find-package "A_STAR_ALGORITHM::PATHMESSAGE")
  (make-package "A_STAR_ALGORITHM::PATHMESSAGE"))

(in-package "ROS")
;;//! \htmlinclude pathMessage.msg.html


(defclass a_star_algorithm::pathMessage
  :super ros::object
  :slots (_path ))

(defmethod a_star_algorithm::pathMessage
  (:init
   (&key
    ((:path __path) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _path __path)
   self)
  (:path
   (&optional __path)
   (if __path (setq _path __path)) _path)
  (:serialization-length
   ()
   (+
    ;; int8[] _path
    (* 1    (length _path)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8[] _path
     (write-long (length _path) s)
     (dotimes (i (length _path))
       (write-byte (elt _path i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8[] _path
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _path (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _path i) (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> (elt _path i) 127) (setf (elt _path i) (- (elt _path i) 256)))
     ))
   ;;
   self)
  )

(setf (get a_star_algorithm::pathMessage :md5sum-) "1e25e195c90ff1d4c83f62d1d195014e")
(setf (get a_star_algorithm::pathMessage :datatype-) "a_star_algorithm/pathMessage")
(setf (get a_star_algorithm::pathMessage :definition-)
      "int8[] path
")



(provide :a_star_algorithm/pathMessage "1e25e195c90ff1d4c83f62d1d195014e")


