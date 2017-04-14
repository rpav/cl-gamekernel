(defpackage :gamekernel.asdf
  (:use #:cl #:asdf))

(in-package :gamekernel.asdf)

(defsystem :gamekernel
  :description "GameKernel wrapper"
  :author "Ryan Pavlik"
  :license "MIT"
  :version "0.0"

  :depends-on (:alexandria :defpackage-plus :trivial-garbage :cl-autowrap :cl-plus-c)
  :pathname "src"
  :serial t

  :components
  ((:module #:autowrap-spec
    :pathname "spec"
    :components
    ((:static-file "gk.h")
     (:static-file "gk.arm-pc-linux-gnu.spec")
     (:static-file "gk.i386-unknown-freebsd.spec")
     (:static-file "gk.i686-apple-darwin9.spec")
     (:static-file "gk.i686-pc-linux-gnu.spec")
     (:static-file "gk.i686-pc-windows-msvc.spec")
     (:static-file "gk.x86_64-apple-darwin9.spec")
     (:static-file "gk.x86_64-pc-linux-gnu.spec")
     (:static-file "gk.x86_64-pc-windows-msvc.spec")
     (:static-file "gk.x86_64-unknown-freebsd.spec")))

   (:module #:raw
    :pathname "raw"
    :components
    ((:file "library")
     (:file "autowrap")
     (:file "package")
     (:file "c-api")
     (:file "gk")
     (:file "transform")
     (:file "gl")
     (:file "paths")
     (:file "nvg")
     (:file "spritesheet")

     ;; This should be last
     (:file "load")))

   (:file "package")
   (:file "gk")
   (:file "bundle")
   (:file "pass")
   (:file "cmd-list")
   (:file "vec")
   (:file "cmd")
   (:file "spritesheet")))

(defsystem :gamekernel/examples
  :description "GameKernel examples"
  :author "Ryan Pavlik"
  :license "MIT"
  :version "0.0"

  :depends-on (:alexandria :defpackage-plus :cl-autowrap :cl-opengl
               :sdl2kit :sdl2kit-examples :glkit :gamekernel)
  :pathname "example"
  :serial t

  :components
  ((:static-file "black_chancery.ttf")
   (:static-file "platformer_sprites.json")
   (:static-file "platformer_sprites.png")
   (:static-file "test.png")

   (:file "package")
   (:file "image")
   (:file "sprite")
   (:file "example1")
   (:file "example1.1")
   (:file "example2")
   (:file "example3")))
