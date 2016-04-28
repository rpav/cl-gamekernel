(defpackage+-1:defpackage+ :gk.ffi)
(cl:in-package :gk.ffi)

(autowrap:c-include '(#:gamekernel #:autowrap-spec "gk.h")
  :spec-path '(#:gamekernel #:autowrap-spec)
  :symbol-exceptions
  (("GK_GL3" . "GL3")
   ("GK_GL2" . "GL2"))

  :no-accessors t)
