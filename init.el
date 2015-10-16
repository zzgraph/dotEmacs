;;; init.el --- Main Configuration for Emacs
;;; Commentary:
;;; Code:
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

;; from Prelude http://github.com/bbatsov/prelude
;; reduce the frequency of garbage collection by making it happen on
;; each 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 50000000)

;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold 100000000)
;;; (require 'tls)

(require 'epa-file)
(epa-file-enable)


(windmove-default-keybindings)
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/")
	     t)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/")
	     t)
(add-to-list 'package-archives
	     '("org" . "http://orgmode.org/elpa/")
	     t)
(package-initialize)


(electric-pair-mode)
(global-undo-tree-mode)

(defvar misc-settings-folder)
(setq misc-settings-folder
      (expand-file-name "misc" user-emacs-directory))
(add-to-list 'load-path misc-settings-folder)
(require 'personal)
(require 'customFacesInit)
(require 'idoInit)
(require 'functionsInit)
(require 'engineInit)
(require 'interface)
(require 'orgmodeInit)
(require 'projectileInit)
;; (require 'autocompleteInit)

(require 'pythonInit)
(require 'magitInit)
(require 'virtualenvwrapperInit)
(require 'yasInit)
(require 'linumInit)
(require 'flycheckInit)
(require 'googleTranslateInit)
(require 'keyboardMacros)
(require 'bbdbInit)
(require 'eshellInit)
(require 'messageInit)
(require 'helmInit)
(require 'flyspellInit)
(require 'keyBindings)
(require 'slimeInit)
(require 'gnusInit)
(require 'companyInit)

(provide 'init)
;;; init.el ends Here
