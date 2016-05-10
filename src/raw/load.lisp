(in-package :gk.raw)

;;; You MUST call this function if you're building a binary that
;;; uses cl-gamekernel.
(defun load-gk ()
  (setf +identity-mat4+ (gk-mat4))
  (load-gk-library))
