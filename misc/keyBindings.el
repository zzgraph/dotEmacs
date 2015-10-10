;;; Pckage --- keyBindings.el
;;; Commentary: All of my global keybindings for various Packages
;;; Code:
;; Browse URL Key Bindings
;; To Browse URLs on the text fles in Firefox
(global-set-key "\C-c\C-z." 'browse-url-at-point)
(global-set-key "\C-c\C-zb" 'browse-url-of-buffer)
(global-set-key "\C-c\C-zr" 'browse-url-of-region)
(global-set-key "\C-c\C-zu" 'browse-url)
(global-set-key "\C-c\C-zv" 'browse-url-of-file)
(add-hook 'dired-mode-hook
	  (lambda ()
	    (local-set-key "\C-c\C-zf" 'browse-url-of-dired-file)))

;; Keybinding for unfill paragraph function
(define-key global-map "\M-Q" 'unfill-paragraph)

;; Orgmode Key Bindings
;; From Org Manual
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

;; smex Keybindings
;; (global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; magit Keybindings
(global-set-key (kbd "\C-x g") 'magit-status)

;; undotree-mode Keybindings
(global-set-key (kbd "M-/") 'undo-tree-visualize)

;; when we have windmove why we need this?
(global-set-key (kbd "C-M-z") 'switch-window)

;; Ace-jump Keybinding
(global-set-key (kbd "C->") 'ace-jump-mode)

;; Google Translator
(global-set-key (kbd "\C-ct") 'google-translate-smooth-translate)

;; Sending Mail: Change default behaviour of "C-x m" to open mail in
;; gnus message-mode instead of emacs mail-mode
(global-unset-key (kbd "\C-x m"))
(global-set-key (kbd "\C-x m") 'message-mail)

;;; Helm Bindings
(global-set-key (kbd "\M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "\C-x b") 'helm-mini)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)

(provide 'keyBindings)
;;; keyBindings.el ends here