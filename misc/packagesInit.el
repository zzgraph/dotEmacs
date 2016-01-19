;;; packagesInit.el --- Packagers Condigurations
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
	helm
	helm-projectile
	helm-descbinds
	projectile
	engine-mode
	flycheck
	yasnippet
	clojure-mode
	cider
	clojure-mode-extra-font-locking
	auto-complete
	company
	company-jedi
	slime-company
	diminish
	engine-mode
	pcomplete-extension
	google-translate
	ido-ubiquitous
	flx
	ido-vertical-mode
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
	company-quickhelp
	eshell-prompt-extras))
(unless package-archive-contents
  (package-refresh-contents))

(dolist (package zzgraph/packages)
  (unless (package-installed-p package)
    (package-install package)))


(provide 'packagesInit)
;;; packagesInit.el ends here
