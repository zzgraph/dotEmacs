;;; customeFacesInit.el --- My Custome fonts
;;;
;;; Commentary:
;;; Code:
(add-to-list 'default-frame-alist '(font . "Vazir Code-12"))
(defun zzgraph/fix-fontset ()
  "Adding Symbola font to fontse to show emoji utf-8 symbols."
  (set-fontset-font "fontset-default" '(#x10000 . #x1ffff) "Symbola-13")
;;  (set-fontset-font "fontset-default" 'arabic "DejaVu Sans")
  )
(zzgraph/fix-fontset)
(add-hook 'after-make-frame-functions 'zzgraph/fix-fontset)

(provide 'customFacesInit)
;;; customFacesInit.el ends here

