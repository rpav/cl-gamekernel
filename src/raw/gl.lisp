(in-package :gk.raw)

(simply-destroy gk-cmd-quad)

(defun make-gk-cmd-quad (tex &key key tfm quadverts)
  (c-let ((cmd gk-cmd-quad :calloc t))
    (init-gk-cmd cmd :quad key)
    (setf (cmd :tex) tex)
    (if tfm
        (memcpy (cmd :tfm) tfm)
        (memcpy (cmd :tfm) +identity-mat4+))
    (when quadverts
      (loop for i from 0 upto 3
            for qv in quadverts
            do (memcpy (cmd :attr i) qv)))
    cmd))

(simply-destroy gk-cmd-quadsprite)

(defun make-gk-cmd-quadsprite (sheet index &key key tfm)
  (c-let ((cmd gk-cmd-quadsprite :calloc t))
    (init-gk-cmd cmd :quadsprite key)
    (if tfm
        (memcpy (cmd :tfm) tfm)
        (memcpy (cmd :tfm) +identity-mat4+))
    (setf (cmd :sheet) (ptr sheet)
          (cmd :index) (or index 0))
    cmd))

