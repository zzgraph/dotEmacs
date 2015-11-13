;;; Stasting ido-mode and settings options

(require 'ido-springboard)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(ido-ubiquitous)
(flx-ido-mode 1)
(setq ido-create-new-buffer 'always)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)



(provide 'idoInit)
