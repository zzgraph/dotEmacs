;;; jsInnit.el --- Configurations for JS2 mode
;;; Commentary:
;; Using js2-mode to edit java script files and use nodejs as jave
;; script inferior mode

;;; Code:
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))


(provide 'jsInit)
;;; jsInnit.el ends here
