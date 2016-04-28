(in-package :gk)

(defclass spritesheet ()
  ((gk-spritesheet)
   (frames :initform (make-hash-table :test 'equal))))

(defmethod initialize-instance ((s spritesheet) &key wrapper)
  (call-next-method)
  (c-val ((sheet gk-spritesheet wrapper))
    (with-slots (gk-spritesheet frames) s
      (setf gk-spritesheet sheet)
      (loop for i from 0 below (sheet :nsprites)
            do (setf (gethash (sheet :names * i * string) frames) i)))))

(defun make-sheet (cmd-sheet-create)
  (make-instance 'spritesheet :wrapper
    (c-ref cmd-sheet-create gk-cmd-spritesheet-create :sheet)))

(defun make-sheet-destroy (spritesheet &key key)
  (with-slots (gk-spritesheet) spritesheet
    (cmd-spritesheet-destroy gk-spritesheet :key key)))

(defun find-frame (spritesheet name)
  (with-slots (frames) spritesheet
    (gethash name frames)))

(defgeneric cmd-quadsprite (sheet index &key key tfm))

(defmethod cmd-quadsprite ((sheet gk-spritesheet) index &key key tfm)
  (make-gk-cmd-quadsprite sheet index :key key :tfm tfm))

(defmethod cmd-quadsprite ((sheet spritesheet) index &key key tfm)
  (with-slots (gk-spritesheet) sheet
    (make-gk-cmd-quadsprite gk-spritesheet index
                            :key key :tfm tfm)))
