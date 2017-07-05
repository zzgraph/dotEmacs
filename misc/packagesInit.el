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
	     '("marmalade" . "http://marmalade-repo.org/packages/")
	     t)
(add-to-list 'package-archives
	     '("org" . "http://orgmode.org/elpa/")
	     t)

(package-initialize)

(defvar zzgraph/packages)

(setq zzgraph/packages
      '(;; Helm (Replaced with ivy for now)
	; helm
	; helm-projectile
	; helm-descbinds
	; helm-flyspell
	
	;;; Ivy Group
	ivy
	counsel
	counsel-projectile
	ivy-hydra
	hydra
	ivy-rich
	flyspell-correct-ivy

	;;;Projectile
	projectile

	;; interface, windows and buffers
	; spaceline
	; spaceline-all-the-icons-theme
	gruvbox-theme
	smart-mode-line
	ace-jump-mode
	ace-window
	hlinum
	all-the-icons
	; all-the-icons-dired


	;; Version control
	magit
	git-gutter
	gitignore-mode
	

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
	ac-html-csswatcher
	ac-html-bootstrap
	company-restclient
	bash-completion
	company-tern
	pcomplete-extension
	readline-complete

	;; Markdown
	markdown-mode
	markdown-edit-indirect

	;; org-mode
	org
	org-plus-contrib
	ox-pandoc
	org2jekyll

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
	
	;;Rust programming language
	rust-mode
	racer
	company-racer

	;; Flycheck
	flycheck
	flycheck-color-mode-line ; colorify modeline according to the state of flycheck
	flycheck-status-emoji ; Shows Emojis in modeline for flycheck status
	flycheck-rust ; Rust language support
	flycheck-checkbashisms ; Bash scripts support

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
	system-packages))

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package zzgraph/packages)
  (unless (package-installed-p package)
    (package-install package)))  

(provide 'packagesInit)
;;; packagesInit.el ends here
