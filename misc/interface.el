;;; Package --- interface.el
;;; Commentary:
;;; Code:


(setq frame-title-format '("Emacs: %b [" mode-name"]"))
(setq system-time-locale "fa_IR")


;; Remove menubar, toolbar and scrollbar and tooltips
(if (display-graphic-p)
    (progn
      (when (fboundp 'tool-bar-mode)
	(tool-bar-mode -1))
      (when (fboundp 'scroll-bar-mode)
	(scroll-bar-mode -1))
      (when (fboundp 'tooltip-mode)
	(tooltip-mode -1))))

(when (fboundp 'menu-bar-mode)
  (menu-bar-mode -1))

;; Use all-the-icons

(require 'all-the-icons)


;; how to dosplay cursor
(setq-default cursor-type '(bar . 2)
	      cursor-in-non-selected-windows 'hollow
	      blink-cursor-mode nil)
(global-font-lock-mode)

(show-paren-mode)
(global-hl-line-mode)
(global-visual-line-mode t)
(winner-mode t)
;; (require 'fill-column-indicator)
;; (define-globalized-minor-mode
;;  global-fci-mode fci-mode (lambda () (fci-mode 1)))
;; (global-fci-mode t)
;; (custom-set-faces
;;  '(default ((t (:background "black" :foreground "grey"))))
;;  '(fringe ((t (:background "black")))))
;; (setq minibuffer-frame-alist
      ;; '((top . 1) (left . 3) (width . 80) (height . 2)))
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . maximized))


(set-frame-parameter (selected-frame)
		     'alpha '(95 80)
		     )
(add-to-list 'default-frame-alist
	     '(alpha 95 80)
	     )

(defvar zzgraph/theme)
(setq zzgraph/theme 'gruvbox)
(load-theme zzgraph/theme t)




;; Call function to change background to unspecified color if we open
;; up emacs in a terminal emulator
(add-hook 'after-make-frame-functions 'zzgraph/load-bg-only-in-graphical-mode)


(provide 'interface)
;;; interface.el ends here


