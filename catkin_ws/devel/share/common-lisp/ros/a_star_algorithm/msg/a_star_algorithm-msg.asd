
(cl:in-package :asdf)

(defsystem "a_star_algorithm-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "AlgorithmMessage" :depends-on ("_package_AlgorithmMessage"))
    (:file "_package_AlgorithmMessage" :depends-on ("_package"))
    (:file "NodeMessage" :depends-on ("_package_NodeMessage"))
    (:file "_package_NodeMessage" :depends-on ("_package"))
    (:file "PathMessage" :depends-on ("_package_PathMessage"))
    (:file "_package_PathMessage" :depends-on ("_package"))
    (:file "PlatformMessage" :depends-on ("_package_PlatformMessage"))
    (:file "_package_PlatformMessage" :depends-on ("_package"))
    (:file "VectorMessage" :depends-on ("_package_VectorMessage"))
    (:file "_package_VectorMessage" :depends-on ("_package"))
  ))