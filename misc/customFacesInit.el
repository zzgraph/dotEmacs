;;; customeFacesInit.el --- My Custome fonts
;;;
;;; Commentary:
;;; Code:
(add-to-list 'default-frame-alist '(font . "Vazir Code-12"))
(defun zzgraph/fix-fontset (&optional frame)
  (set-fontset-font "fontset-default" '(#x10000 . #x1ffff) "Symbola-18")
;;  (set-fontset-font "fontset-default" 'arabic "DejaVu Sans")
  )
(zzgraph/fix-fontset)
(add-hook 'after-make-frame-functions 'zzgraph/fix-fontset)

(provide 'customFacesInit)
;;; customFacesInit.el ends here

