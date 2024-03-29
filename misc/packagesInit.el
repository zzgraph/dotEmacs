;;; packagesInit.el --- Packages Configurations
;;; Commentary:
;; List of archives to be used by packages.el
;; List of packages to be checked if installed at startup
;;; Code:

(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/")
	     t)
(add-to-list 'package-archives
	     '("nongnu" . "https://elpa.nongnu.org/nongnu/")
	     t)
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/")
	     t)
(setq package-archive-priorities
      '((gnu           .  4)
	(nongnu        .  3)
	(melpa-stable  .  2)
	(melpa         .  1)
	))

(package-initialize)

(defvar zzgraph/packages)

(setq zzgraph/packages
      '(;; Ivy Group
	ivy
	counsel
	counsel-projectile
	ivy-hydra
	hydra
	ivy-rich
	flyspell-correct-ivy

	;; Projectile
	projectile

	;; interface, windows and buffers
	gruvbox-theme
	nord-theme
	smart-mode-line
	ace-jump-mode
	ace-window
	hlinum
	all-the-icons
	all-the-icons-dired

	;; Version control
	magit
	;gitignore-mode

	;; Major modes
	yaml-mode
	haskell-mode

	;; Clojure Major mode
					; clojure-mode
					; cider
					; clojure-mode-extra-font-locking

	;; ac auto complete (replaced with company)
					; auto-complete

	;; Company and completion backends
	company
	company-jedi
	slime-company
	company-quickhelp
	company-web
	company-shell
	company-auctex
	ac-html
	ac-html-csswatcher
	ac-html-bootstrap
	company-restclient
	bash-completion
	;; company-tern
	pcomplete-extension
	readline-complete

	;; Markdown
	markdown-mode
	;; markdown-edit-indirect

	;; org-mode
	org
	org-contrib
	ox-pandoc
	org2jekyll
	org-translate
	org2blog
	org-bullets
	ox-hugo

	;; eshell
	eshell-prompt-extras
	esh-help
	eshell-git-prompt

	;; Python
	python-django
	jedi
	virtualenvwrapper

	;;Web development
	emmet-mode
	simple-httpd
	web-mode
	impatient-mode
	less-css-mode
	ac-html-csswatcher
	ac-html-bootstrap
	restclient
	sws-mode
	jade-mode
	stylus-mode

	;; Javascript
	js2-mode
	skewer-mode
	tern
	json-mode
	json-reformat
	ng2-mode ;angular 2
	js-comint
	tide ;TypeScript Interactive Development Environment for Emacs

	;;Rust programming language
	rust-mode
	racer
	company-racer

	;; Flycheck
	flycheck
	flycheck-color-mode-line ; colorify modeline according to flycheck state
	flycheck-status-emoji ; Shows Emojis in modeline for flycheck status
	flycheck-rust ; Rust language support
	flycheck-checkbashisms ; Bash scripts support
	flycheck-yamllint

	;; Torrents
	mentor

	;; Elfeed for rss reading
	elfeed
	elfeed-org
	elfeed-goodies
	

	;; Misc
	ag
	xterm-color
	php-mode
	engine-mode
	yasnippet
	diminish
	google-translate
	flx
	paredit
	slime
	undo-tree
        bbdb
        emms
	rainbow-mode
	anzu
	hl-todo
	shell-pop
	exec-path-from-shell
	which-key
	system-packages
	editorconfig
	guru-mode
	neotree
	wc-mode
	keychain-environment))

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package zzgraph/packages)
  (unless (package-installed-p package)
    (package-install package)))

(provide 'packagesInit)
;;; packagesInit.el ends here
