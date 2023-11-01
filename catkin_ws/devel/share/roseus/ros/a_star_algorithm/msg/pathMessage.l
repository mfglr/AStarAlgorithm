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
  :slots (_id _sizeOfPath _path ))

(defmethod a_star_algorithm::pathMessage
  (:init
   (&key
    ((:id __id) 0)
    ((:sizeOfPath __sizeOfPath) 0)
    ((:path __path) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _sizeOfPath (round __sizeOfPath))
   (setq _path __path)
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:sizeOfPath
   (&optional __sizeOfPath)
   (if __sizeOfPath (setq _sizeOfPath __sizeOfPath)) _sizeOfPath)
  (:path
   (&optional __path)
   (if __path (setq _path __path)) _path)
  (:serialization-length
   ()
   (+
    ;; int32 _id
    4
    ;; int8 _sizeOfPath
    1
    ;; int8[] _path
    (* 1    (length _path)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _id
       (write-long _id s)
     ;; int8 _sizeOfPath
       (write-byte _sizeOfPath s)
     ;; int8[] _path
     (write-long (length _path) s)
     (dotimes (i (length _path))
       (write-byte (elt _path i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int8 _sizeOfPath
     (setq _sizeOfPath (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _sizeOfPath 127) (setq _sizeOfPath (- _sizeOfPath 256)))
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

(setf (get a_star_algorithm::pathMessage :md5sum-) "d11fa3ccd9cda428b05f117412d7ba8b")
(setf (get a_star_algorithm::pathMessage :datatype-) "a_star_algorithm/pathMessage")
(setf (get a_star_algorithm::pathMessage :definition-)
      "int32 id
int8 sizeOfPath
int8[] path
")



(provide :a_star_algorithm/pathMessage "d11fa3ccd9cda428b05f117412d7ba8b")


