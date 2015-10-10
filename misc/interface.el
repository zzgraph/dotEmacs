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
(custom-set-faces
 '(default ((t (:background "black" :foreground "grey"))))
 '(fringe ((t (:background "black")))))
;; (setq minibuffer-frame-alist
      ;; '((top . 1) (left . 3) (width . 80) (height . 2)))
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;;; (set-frame-parameter nil 'fullscreen 'fullboth)
;;; (add-to-list 'default-frame-alist
;;; 	     'fullscreen 'fullboth)
;; (set-frame-parameter (selected-frame)
;; 		     'alpha '(95 80)
;; 		     )
;; (add-to-list 'default-frame-alist
;; 	     '(alpha 95 80)
;; 	     )
;; (load-theme 'atom-dark t)
;; (powerline-center-theme)
;; (setq powerline-default-separator 'arrow)
;; (load-theme 'airline-luna t)


;; ;; from here http://emacs-doctor.com/emacs-strip-tease.html
;; ;; A small minor mode to use a big fringe
;; (defvar bzg-big-fringe-mode nil)
;; (define-minor-mode bzg-big-fringe-mode
;;   "Minor mode to use big fringe in the current buffer."
;;   :init-value nil
;;   :global t
;;   :variable bzg-big-fringe-mode
;;   :group 'editing-basics
;;   (if (not bzg-big-fringe-mode)
;;       (set-fringe-style nil)
;;     (set-fringe-mode
;;      (/ (- (frame-pixel-width)
;;            (* 100 (frame-char-width)))
;;         2))))

;; ;; Now activate this global minor mode
;; (bzg-big-fringe-mode 1)

;; ;; To activate the fringe by default and deactivate it when windows
;; ;; are split vertically, uncomment this:
;; (add-hook 'window-configuration-change-hook
;;           (lambda ()
;;             (if (delq nil
;;                       (let ((fw (frame-width)))
;;                         (mapcar (lambda(w) (< (window-width w) (/ fw 2)))
;;                                 (window-list))))
;;                 (bzg-big-fringe-mode 0)
;;               (bzg-big-fringe-mode 1))))
(provide 'interface)
;;; interface.el ends here

