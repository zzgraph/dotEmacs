;;; editorInit.el --- Basic Configurations for emacs
;;; Commentary:
;; 

;;; Code:

;; use exec-path-from-shell to copy ssh environment

(require 'exec-path-from-shell)
(when (memq window-system '(nac ns x))
  (exec-path-from-shell-initialize))

(exec-path-from-shell-copy-env "SSH_AGENT_PID")
(exec-path-from-shell-copy-env "SSH_AUTH_SOCK")


;; newline required at the end of each file
(setq require-final-newline t)

;; Show λ instead of lambda in lisp and pretify other symbols in language context
(global-prettify-symbols-mode +1)


;; highlight trailng white space
(require 'whitespace)
(setq whitespace-line-column 80) ;; limit line length
(setq whitespace-style '(face tabs empty trailing lines-tail))

;; Treat Camelcase words as seprate words in prg-mode
(add-hook 'prog-mode-hook 'subword-mode)

;; enable to replace selected text
(delete-selection-mode t)

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(set-locale-environment "fa")
(set-input-method "farsi-isiri-9147")
;; from Prelude http://github.com/bbatsov/prelude
;; reduce the frequency of garbage collection by making it happen
;; each 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 50000000)

;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold 100000000)

(setq inhibit-default-init t)
(setq message-log-max 10000)

;; Please don't load outdated byte code
(setq load-prefer-newer t)

(require 'windmove)
(windmove-default-keybindings)
(electric-pair-mode)
(save-place-mode t)

;;; Bookmarks

(require 'bookmark)
(setq bookmark-default-file
      (expand-file-name "bookmarks" personal-settings-folder))
(setq bookmark-save-flag 1)


(provide 'editorInit)
;;; editorInit.el ends here
