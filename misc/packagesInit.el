;;; packagesInit.el --- Packagers Configurations
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

(setq zzgraph/packages
      '(magit
	;;; Helm (Replaced with ivy for now)
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

	ag
	engine-mode
	flycheck
	yasnippet
	clojure-mode
	cider
	clojure-mode-extra-font-locking
	;;; ac auto complete (replaced with company)
	;; auto-complete

	;;; Company
	company
	company-jedi
	slime-company
	company-quickhelp
	company-web
	company-shell
	company-auctex
	readline-complete
	
	eshell-prompt-extras
	diminish
	engine-mode
	pcomplete-extension
	google-translate
	flx
	ace-jump-mode
	ace-window
	hlinum
	org
	org-plus-contrib
	paredit
	python-django
	slime
	undo-tree
        bbdb
        esh-help
	virtualenvwrapper
	emms
	rainbow-mode
	smart-mode-line
	anzu
	gruvbox-theme
	haskell-mode
	gitignore-mode
	hl-todo

	;;Web development
	emmet-mode
	simple-httpd
	js2-mode
	skewer-mode
	web-mode

	;;Rust programming language
	rust-mode
	flycheck-rust
	racer
	company-racer
	))
(unless package-archive-contents
  (package-refresh-contents))

(dolist (package zzgraph/packages)
  (unless (package-installed-p package)
    (package-install package)))


(provide 'packagesInit)
;;; packagesInit.el ends here
