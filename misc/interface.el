;;; Package --- interface.el
;;; Commentary:
;;; Code:
(setq frame-title-format '("Emacs: %b [" mode-name"]"))
(setq system-time-locale "fa_IR")
(display-time-mode 1)
(if (boundp (menu-bar-mode))
    (menu-bar-mode -1))
(if (boundp (tool-bar-mode))
    (tool-bar-mode -1))
(set-scroll-bar-mode nil)
(setq-default cursor-type '(bar . 2)
	      cursor-in-non-selected-windows 'hollow)
(global-font-lock-mode)
(column-number-mode)
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

;;; (set-frame-parameter nil 'fullscreen 'fullboth)
;;; (add-to-list 'default-frame-alist
;;; 	     'fullscreen 'fullboth)
(set-frame-parameter (selected-frame)
		     'alpha '(95 80)
		     )
(add-to-list 'default-frame-alist
	     '(alpha 95 80)
	     )

(defvar zzgraph/theme)
(setq zzgraph/theme 'gruvbox)
(load-theme zzgraph/theme t)
(sml/setup)
;; Let's have some mode-line customization fun

;; (set-face-attribute 'mode-line nil
;;                     :box '(:width 1)
;; 		    :box '(:color "white")
;; 		    :box '(:style nil)
;; 		    :height 1.1
;; 		    :foreground "white smoke"
;; 		    :background "steel blue")

;; (set-face-attribute 'mode-line-inactive nil
;;                     :box '(:width 1)
;; 		    :box '(:color "white")
;; 		    :box '(:style nil)
;; 		    :height 1.1
;; 		    :foreground "white smoke"
;; 		    :background "DimGray")


;; (require 'powerline) (powerline-default-theme) (setq
;; powerline-default-separator 'arrow) ;; (load-theme
;; 'airline-solarized-gui t) (load-theme 'airline-hybridline t)



;; Call function to change background to unspecified color if we open
;; up emacs in a terminal emulator
(add-hook 'after-make-frame-functions 'zzgraph/load-bg-only-in-graphical-mode)


(provide 'interface)
;;; interface.el ends here


