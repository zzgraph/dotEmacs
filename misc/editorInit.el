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
(exec-path-from-shell-copy-env "GOPATH")



;; newline required at the end of each file
(setq require-final-newline t)

;; use which-key mode to help me find keybindings
(require 'which-key)
(which-key-mode)
(which-key-setup-minibuffer)

;; Show λ instead of lambda in lisp and prettify other symbols in
;; language context
(global-prettify-symbols-mode +1)

;; enable disabled commands like narrowing and widening and
;; upcase-downcase region
(setq disabled-command-function nil)

;; highlight trailng white space
(require 'whitespace)
(setq whitespace-line-column 80) ; limit line length
(setq whitespace-style '(face tabs empty trailing lines-tail))

;; Treat Camelcase words as seprate words in prg-mode
(add-hook 'prog-mode-hook 'subword-mode)

;; Highlighting TODO, FIXME and others
(global-hl-todo-mode t)

;; enable to replace selected text
(delete-selection-mode t)

;; Use UTF-8 for everything
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

;; set locale to farsi
(set-locale-environment "fa")

;; set nitial quail keyboard layout to farsi
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

;; Use windmove to enable navigation between windows using shift-arrow
;; keys
(require 'windmove)
(windmove-default-keybindings)

;; enabaling electric pair mode to automatically insert pairing
;; bracket delimiters, it can be escaped using C-q, for example `C-q
;; "' inserts only one double quotation mark without inserting second
;; closing one
(electric-pair-mode 1)

;; Adding « » to electric pair mode for Persian texts
;; snippet from here https://stackoverflow.com/a/27871987
(defvar zzgraph/giumeh-electric-pairs '((?« . ?»))
  "Electric pairs for inserting closing Persian quotation mark (گیومه).")
(setq electric-pair-pairs
      (append electric-pair-pairs zzgraph/giumeh-electric-pairs))
(setq electric-pair-text-pairs electric-pair-pairs)

(save-place-mode 1)

;; Let's disable all arrow keys and offside keyboard keys
(guru-global-mode 1)

;;; BOOKMARKS

(require 'bookmark)
(setq bookmark-default-file
      (expand-file-name "bookmarks" personal-settings-folder))
(setq bookmark-save-flag 1)


(provide 'editorInit)
;;; editorInit.el ends here
