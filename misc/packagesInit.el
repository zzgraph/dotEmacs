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
      '(;;; Helm (Replaced with ivy for now)
	;; helm
	;; helm-projectile
	;; helm-descbinds
	;; helm-flyspell
	
	;;; Ivy Group
	flyspell-correct-ivy
	ivy
	counsel
	counsel-projectile
	ivy-hydra
	hydra
	ivy-rich

	;;;Projectile
	projectile

	
	;clojure-mode
	;cider
	;clojure-mode-extra-font-locking
	;;; ac auto complete (replaced with company)
	; auto-complete

	;;; Company
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
	js2-mode
	skewer-mode
	web-mode
	impatient-mode
	ng2-mode ;angular 2
	json-mode
	less-css-mode
	ac-html-csswatcher
	ac-html-bootstrap
	restclient
	sws-mode
	jade-mode
	stylus-mode

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
	magit
	ag
	php-mode
	engine-mode
	yasnippet
	readline-complete
	diminish
	engine-mode
	pcomplete-extension
	google-translate
	flx
	ace-jump-mode
	ace-window
	hlinum
	paredit
	slime
	undo-tree
        bbdb
        emms
	rainbow-mode
	smart-mode-line
	anzu
	gruvbox-theme
	haskell-mode
	gitignore-mode
	hl-todo
	yaml-mode
	markdown-mode
	shell-pop))
(unless package-archive-contents
  (package-refresh-contents))

(dolist (package zzgraph/packages)
  (unless (package-installed-p package)
    (package-install package)))


(provide 'packagesInit)
;;; packagesInit.el ends here
