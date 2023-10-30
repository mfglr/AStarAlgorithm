
(cl:in-package :asdf)

(defsystem "a_star_algorithm-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "pathMessage" :depends-on ("_package_pathMessage"))
    (:file "_package_pathMessage" :depends-on ("_package"))
    (:file "platformMessage" :depends-on ("_package_platformMessage"))
    (:file "_package_platformMessage" :depends-on ("_package"))
  ))