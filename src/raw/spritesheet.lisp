(in-package :gk.raw)

(defun free-gk-cmd-spritesheet-create (ptr)
  (c-let ((o gk-cmd-spritesheet-create :ptr ptr))
    (autocollect-cancel o)
    (free (o :path * &))
    (free (o :filename * &))
    (free (invalidate o))))

(defmethod destroy-object ((o gk-cmd-spritesheet-create))
  (free-gk-cmd-spritesheet-create (ptr o)))

(autowrap:define-bitmask-from-enum (spritesheet-create-flags gk-spritesheet-create-flags))

(defun make-gk-cmd-spritesheet-create (pathname format &key flags key)
  (c-let ((cmd gk-cmd-spritesheet-create :calloc t))
    (autocollect (ptr) cmd
      (free-gk-cmd-spritesheet-create ptr))
    (init-gk-cmd cmd :spritesheet-create key)
    (setf (cmd :path) (string (directory-namestring pathname))
          (cmd :filename) (string (file-namestring pathname))
          (cmd :format) format
          (cmd :flags) (mask-apply 'spritesheet-create-flags flags))
    cmd))

(simply-destroy gk-cmd-spritesheet-destroy)

(defun make-gk-cmd-spritesheet-destroy (sheet &key key)
  (c-let ((cmd gk-cmd-spritesheet-destroy :calloc t))
    (autocollect (ptr) cmd (free ptr))
    (init-gk-cmd cmd :spritesheet-destroy key)
    (setf (cmd :sheet) (ptr sheet))
    cmd))
