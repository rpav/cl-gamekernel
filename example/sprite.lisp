(in-package :gk.test)

(defclass sprite ()
  (qs trs))

(defmethod initialize-instance ((s sprite) &key sheet index pos size key)
  (with-slots (qs trs scale) s
    (setf qs (cmd-quadsprite sheet index))
    (setf trs (cmd-tf-trs :out (quadsprite-tfm qs)
                          :translate pos
                          :scale size
                          :key key))))

(defun sprite-pos (s)
  (tf-trs-translate (slot-value s 'trs)))

(defun (setf sprite-pos) (v s)
  (setf (tf-trs-translate (slot-value s 'trs)) v))

(defun sprite-index (s)
  (quadsprite-index (slot-value s 'qs)))

(defun (setf sprite-index) (v s)
  (with-slots (qs) s
    (setf (quadsprite-index qs) v)))

(defmethod draw ((sprite sprite) list m)
  (with-slots (qs trs) sprite
    (setf (tf-trs-prior trs) m)
    (cmd-list-append list trs)
    (cmd-list-append list qs)))
