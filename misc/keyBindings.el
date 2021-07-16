;;; keyBindings.el --- Global Key Bindings
;;; Commentary:
;; All of my global keybindings for various Packages
;;; Code:
;; Browse URL Key Bindings
;; To Browse URLs on the text fles in Firefox
(global-set-key (kbd "C-c C-z .") 'browse-url-at-point)
(global-set-key (kbd "C-c C-z b") 'browse-url-of-buffer)
(global-set-key (kbd "C-c C-z r") 'browse-url-of-region)
(global-set-key (kbd "C-c C-z u") 'browse-url)
(global-set-key (kbd "C-c C-z v") 'browse-url-of-file)
(add-hook 'dired-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c C-z f") 'browse-url-of-dired-file)))

;; Keybinding for unfill paragraph function
(define-key global-map (kbd "M-Q") 'unfill-paragraph)

;; Orgmode Key Bindings
;; From Org Manual
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c b") 'org-iswitchb)
;; smex Keybindings
;; (global-set-key (kbd "M-x") 'smex)
;; (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; magit Keybindings
(global-set-key (kbd "C-x g") 'magit-status)


;; when we have windmove why we need this?
;; (global-set-key (kbd "C-M-z") 'switch-window)


;; shell-pop
(global-set-key (kbd "<f12>") 'shell-pop)

;; neotree
(global-set-key (kbd "<f8>") 'neotree-toggle)

;; Ace-jump Keybinding
(global-set-key (kbd "C-x j") 'ace-jump-mode)


;; Ace-window Keybinding
(require 'ace-window)

(global-set-key (kbd "M-p") 'ace-window)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))

;; Google Translator
(global-set-key (kbd "C-c t") 'google-translate-smooth-translate)

;; Sending Mail: Change default behaviour of "C-x m" to open mail in
;; gnus message-mode instead of emacs mail-mode
(global-unset-key (kbd "C-x m"))
(global-set-key (kbd "C-x m") 'message-mail)

;; keybindings for gitgutter-mode
(global-set-key (kbd "C-x C-g") 'git-gutter)
(global-set-key (kbd "C-x v =") 'git-gutter:popup-hunk)
;; Jump to next/previous hunk
(global-set-key (kbd "C-x v p") 'git-gutter:previous-hunk)
(global-set-key (kbd "C-x v n") 'git-gutter:next-hunk)
;; Stage current hunk
(global-set-key (kbd "C-x v s") 'git-gutter:stage-hunk)
;; Revert current hunk
(global-set-key (kbd "C-x v r") 'git-gutter:revert-hunk)
;; Mark current hunk
(global-set-key (kbd "C-x v SPC") #'git-gutter:mark-hunk)

;; Helm Bindings
;; (global-set-key (kbd "M-x") 'helm-M-x)
;; (global-set-key (kbd "C-x C-f") 'helm-find-files)
;; (global-set-key (kbd "C-x b") 'helm-mini)
;; (global-set-key (kbd "C-x M-y") 'helm-show-kill-ring)

;; Flyspell-helm
;; (global-set-key (kbd "C-;") 'helm-flyspell-correct)
;; (define-key flyspell-mode-map (kbd "C-;") 'helm-flyspell-correct)
(require 'flyspell-correct-ivy)
(define-key flyspell-mode-map (kbd "C-;")
  'flyspell-correct-previous-word-generic)

;; Projectile
(define-key projectile-mode-map (kbd "C-c p")
  'projectile-command-map)

;; Search and replace
(global-set-key (kbd "C-s") 'isearch-forward)
(global-set-key (kbd "C-S-s") 'swiper)
(global-set-key (kbd "M-%") 'anzu-query-replace)
(global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)

;; Ivy key bindings
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-load-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key read-expression-map (kbd "C-r") 'counsel-expression-history)


;; ispelll change dictionary
;; keybinding for function declared in functionsInit.el
;; source:
;; http://unix.stackexchange.com/questions/86554/make-hunspell-work-with-emacs-and-german-language?answertab=active#tab-top
(global-set-key (kbd "C-c d") 'switch-dictionary-fa-en)


;; python-django-mode key-binding
;; (global-set-key (kbd "C-x j") 'python-django-open-project)


;; Enable ibuffer instead of Buffer-list
(global-set-key (kbd "C-x C-b") 'ibuffer-other-window)

;; Force complete file names on "C-c /" key
(global-set-key (kbd "C-c /") 'company-files)

(provide 'keyBindings)
;;; keyBindings.el ends here
