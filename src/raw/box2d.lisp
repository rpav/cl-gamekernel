(in-package :gk.raw)

 ;; gk-b2-world

(defun make-gk-b2-world (&key (timestep (/ 1s0 60s0)) (velocity-iterations 8) (position-iterations 3))
  (c-let ((world gk-b2-world :calloc t))
    (autocollect (ptr) world
      (free ptr))
    (setf (world :timestep) timestep
          (world :velocity-iterations) velocity-iterations
          (world :position-iterations) position-iterations)
    world))

(defun free-gk-b2-body (ptr)
  (c-let ((o gk-b2-body :ptr ptr))
    ;; FIXME: Check/free all the other stuff
    (free ptr)))

(defun make-gk-b2-body ()
  (c-let ((body gk-b2-body :calloc t))
    (autocollect (ptr) body
      (free-gk-b2-body ptr))
    body))

(defun make-gk-b2-bodydef (body type
                           &key position linear-velocity
                           (linear-damping 0.0) (angle 0.0)
                           (angular-velocity 0.0) (angular-damping 0.0)
                           (gravity-scale 1.0)
                           (activep t) (awakep t) bulletp fixed-rotation-p
                           (allow-sleep-p t))
  (c-let ((bd gk-b2-bodydef :calloc t))
    (autocollect (ptr) bd
      (free ptr))
    (setf (bd :body) body
          (bd :type) (enum-value 'gk-b2-body-type type)
          (bd :linear-damping) linear-damping
          (bd :angle) angle
          (bd :angular-velocity) angular-velocity
          (bd :angular-damping) angular-damping
          (bd :gravity-scale) gravity-scale
          (bd :active) (if activep 1 0)
          (bd :awake) (if awakep 1 0)
          (bd :bullet) (if bulletp 1 0)
          (bd :fixed-rotation) (if fixed-rotation-p 1 0)
          (bd :allow-sleep) (if allow-sleep-p 1 0))
    (when position (memcpy (bd :position) position))
    (when linear-velocity (memcpy (bd :linear-velocity) linear-velocity))
    bd))

(defun make-gk-cmd-b2-world-create (world &key gravity do-sleep-p)
  (c-let ((cmd gk-cmd-b2-world-create :calloc t))
    (autocollect (ptr) cmd (free ptr))
    (setf (cmd :parent :type) :b2-world-create
          (cmd :world) world
          (cmd :do-sleep) (if do-sleep-p 1 0))
    (when gravity (memcpy (cmd :gravity) gravity))
    cmd))

(defun make-gk-cmd-b2-world-destroy (world)
  (c-let ((cmd gk-cmd-b2-world-destroy :calloc t))
    (autocollect (ptr) cmd (free ptr))
    (setf (cmd :parent :type) :b2-world-destroy
          (cmd :world) world)
    cmd))

(defun free-gk-cmd-b2-body-create (ptr)
  (c-let ((cmd gk-cmd-b2-body-create :ptr ptr))
    (when (> (cmd :ndefs) 0)
      (free (cmd :defs)))
    (free cmd)))

(defun make-gk-cmd-b2-body-create (world &key (key 0) (prealloc 1))
  (c-let ((cmd gk-cmd-b2-body-create :calloc t))
    (autocollect (ptr) cmd
      (free-gk-cmd-b2-body-create ptr))
    (setf (cmd-type cmd) :b2-body-create
          (cmd :parent :key) key
          (cmd :world) world
          (cmd :ndefs) prealloc)
    (when (> prealloc 0)
      (setf (cmd :defs) (alloc :pointer prealloc)))
    cmd))

(defun make-gk-cmd-b2-body-update (body translate angle)
  (c-let ((cmd gk-cmd-b2-body-update :calloc t))
    (autocollect (ptr) cmd (free ptr))
    (setf (cmd-type cmd) :b2-body-update
          (cmd :body) body
          (cmd :angle) angle)
    (memcpy (cmd :translate) translate)
    cmd))

(defun make-gk-cmd-b2-body-destroy (world body)
  (c-let ((cmd gk-cmd-b2-body-destroy))
    (autocollect (ptr) cmd (free ptr))
    (setf (cmd-type cmd) :b2-body-destroy
          (cmd :world) world
          (cmd :body) body)
    cmd))

(defun free-gk-cmd-b2-fixture-create (ptr)
  (c-let ((cmd gk-cmd-b2-fixture-create :ptr ptr))
    (free (cmd :pathdef))
    (free cmd)))

(defun make-gk-cmd-b2-fixture-create (body ptr len &key (key 0))
  (c-let ((cmd gk-cmd-b2-fixture-create :calloc t))
    (autocollect (ptr) cmd
      (free-gk-cmd-b2-fixture-create ptr))
    (setf (cmd :parent :type) :b2-fixture-create
          (cmd :parent :key) key
          (cmd :body) body
          (cmd :pathdef) ptr
          (cmd :pathlen) len)
    cmd))

(autowrap:define-bitmask-from-enum (gk-b2-fixture-update-mask gk-b2-fixture-update-flags))

(defun make-gk-cmd-b2-fixture-update (body id
                                      &key (key 0)
                                      (density 0.0 densityp)
                                      (elasticity 0.0 elasticityp)
                                      (friction 0.0 frictionp)
                                      (sensorp nil sensorpp)
                                      (category #x01 categoryp)
                                      (mask #xFFFF maskp)
                                      (group 0 groupp))
  (c-let ((cmd gk-cmd-b2-fixture-update :calloc t))
    (autocollect (ptr) cmd (free ptr))
    (setf (cmd :parent :type) :b2-fixture-update
          (cmd :parent :key) key
          (cmd :body) body
          (cmd :id) id
          (cmd :density) density
          (cmd :elasticity) elasticity
          (cmd :friction) friction
          (cmd :sensor) (if sensorp 1 0)
          (cmd :category) category
          (cmd :mask) mask
          (cmd :group) group)
    (setf (cmd :update)
          (autowrap:mask-apply 'gk-b2-fixture-update-mask
                               (delete-if #'null
                                          (list (and densityp :density)
                                                (and elasticityp :elasticity)
                                                (and frictionp :friction)
                                                (and sensorpp :sensor)
                                                (and (or categoryp maskp groupp)
                                                     :filter)))))
    cmd))

(defun make-gk-cmd-b2-iter-bodies (world)
  (c-let ((cmd gk-cmd-b2-iter-bodies :calloc t))
    (autocollect (ptr) cmd (free ptr))
    (setf (cmd :parent :type) :b2-iter-bodies
          (cmd :world) world)
    cmd))

(defun make-gk-cmd-b2-force (body force point &key (wakep t))
  (c-let ((cmd gk-cmd-b2-force :calloc t))
    (autocollect (ptr) cmd (free ptr))
    (setf (cmd :parent :type) :b2-force
          (cmd :body) body
          (cmd :wake) (if wakep 1 0))
    (memcpy (cmd :force) force)
    (memcpy (cmd :point) point)
    cmd))

(defun make-gk-cmd-b2-torque (body torque &key (wakep t))
  (c-let ((cmd gk-cmd-b2-torque :calloc t))
    (autocollect (ptr) cmd (free ptr))
    (setf (cmd :parent :type) :b2-torque
          (cmd :body) body
          (cmd :torque) torque
          (cmd :wake) (if wakep 1 0))
    cmd))

(defun make-gk-cmd-b2-linear-impulse (body impulse point &key (wakep t))
  (c-let ((cmd gk-cmd-b2-linear-impulse :calloc t))
    (autocollect (ptr) cmd (free ptr))
    (setf (cmd :parent :type) :b2-linear-impulse
          (cmd :body) body
          (cmd :wake) (if wakep 1 0))
    (memcpy (cmd :impulse) impulse)
    (memcpy (cmd :point) point)
    cmd))

(defun make-gk-cmd-b2-angular-impulse (body impulse &key (wakep t))
  (c-let ((cmd gk-cmd-b2-angular-impulse :calloc t))
    (autocollect (ptr) cmd (free ptr))
    (setf (cmd :parent :type) :b2-angular-impulse
          (cmd :body) body
          (cmd :impulse) impulse
          (cmd :wake) (if wakep 1 0))
    cmd))

(defun make-gk-cmd-b2-set-velocity (body linear angular &key (key 0))
  (c-let ((cmd gk-cmd-b2-set-velocity :calloc t))
    (autocollect (ptr) cmd (free ptr))
    (setf (cmd :parent :type) :b2-set-velocity
          (cmd :parent :key) key
          (cmd :body) body
          (cmd :angular) (float angular))
    (memcpy (cmd :linear) linear)
    cmd))

(defun make-gk-cmd-b2-draw-debug (world resolution &key translate scale (key 0))
  (c-let ((cmd gk-cmd-b2-draw-debug :calloc t))
    (autocollect (ptr) cmd (free ptr))
    (setf (cmd :parent :type) :b2-draw-debug
          (cmd :parent :key) key
          (cmd :world) world)
    (memcpy (cmd :resolution) resolution)
    (when translate (memcpy (cmd :translate) translate))
    (when scale (memcpy (cmd :scale) scale))
    cmd))

(defun make-gk-cmd-b2-step (world &key (key 0))
  (c-let ((cmd gk-cmd-b2-step :calloc t))
    (autocollect (ptr) cmd (free ptr))
    (setf (cmd :parent :type) :b2-step
          (cmd :parent :key) key
          (cmd :world) world)
    cmd))
