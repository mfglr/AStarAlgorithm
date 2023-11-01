
(cl:in-package :asdf)

(defsystem "a_star_algorithm-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "PathMessage" :depends-on ("_package_PathMessage"))
    (:file "_package_PathMessage" :depends-on ("_package"))
    (:file "PlatformMessage" :depends-on ("_package_PlatformMessage"))
    (:file "_package_PlatformMessage" :depends-on ("_package"))
  ))