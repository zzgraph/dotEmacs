;;; Package --- interface.el
;;; Commentary:
;;; Code:
(setq frame-title-format '("Emacs: %b    ;;" mode-name";;"))
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq-default cursor-type '(hbar . 3)
	      cursor-in-non-selected-windows 'hollow)
(global-font-lock-mode)
(column-number-mode)
(show-paren-mode)
(global-hl-line-mode)
(global-visual-line-mode t)
(winner-mode t)
;; (custom-set-faces
;;  '(default ((t (:background "black" :foreground "grey"))))
;;  '(fringe ((t (:background "black")))))
;; (setq minibuffer-frame-alist
      ;; '((top . 1) (left . 3) (width . 80) (height . 2)))
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;;; (set-frame-parameter nil 'fullscreen 'fullboth)
;;; (add-to-list 'default-frame-alist
;;; 	     'fullscreen 'fullboth)
(set-frame-parameter (selected-frame)
		     'alpha '(95 80)
		     )
(add-to-list 'default-frame-alist
	     '(alpha 95 80)
	     )
(load-theme 'atom-dark t)
(powerline-center-theme)
(setq powerline-default-separator 'arrow)
(load-theme 'airline-luna t)



(provide 'interface)
;;; interface.el ends here

