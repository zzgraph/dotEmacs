;;; init.el --- Main Configuration for Emacs
;;; Commentary:
;;; Code:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(set-locale-environment "fa")
(set-input-method "farsi-isiri-9147")
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
(electric-pair-mode)

(defvar misc-settings-folder)
(setq misc-settings-folder
      (expand-file-name "misc" user-emacs-directory))
(add-to-list 'custom-theme-load-path "~/.emacs.d/elpa/emacs-theme-gruvbox")
;; Set a custom custom-file for Emacs own customize system
(setq custom-file
      (expand-file-name "custom.el" misc-settings-folder))

(load custom-file)

(add-to-list 'load-path misc-settings-folder)
(require 'personal)
(require 'packagesInit)
(require 'customFacesInit)
;; (require 'idoInit)
(require 'functionsInit)
(require 'engineInit)
(require 'linumInit)
(require 'interface)
(require 'orgmodeInit)
(require 'projectileInit)
;; (require 'autocompleteInit)

(require 'pythonInit)
(require 'magitInit)
;; (require 'virtualenvwrapperInit)
(require 'yasInit)
(require 'flycheckInit)
(require 'googleTranslateInit)
;; (require 'keyboardMacros)
(require 'bbdbInit)
(require 'eshellInit)
(require 'messageInit)
(require 'helmInit)
(require 'flyspellInit)
(require 'slimeInit)
(require 'gnusInit)
(require 'companyInit)
(require 'diminishInit)
(require 'pareditInit)
(require 'eldocInit)
(require 'ciderInit)
(require 'clojureInit)
(require 'undoTreeInit)
(require 'keyBindings)


(provide 'init)
;;; init.el ends Here
