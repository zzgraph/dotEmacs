;;; init.el --- Main Configuration for Emacs
;;; Commentary:
;;; Code:


(require 'secrets)

(defvar misc-settings-folder)
(setq misc-settings-folder
      (expand-file-name "misc" user-emacs-directory))
(defvar personal-settings-folder)
(setq personal-settings-folder
      (expand-file-name "personal" user-emacs-directory))
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/elpa/emacs-theme-gruvbox")
;; Set a custom custom-file for Emacs own customize system
(setq custom-file
      (expand-file-name "custom.el" personal-settings-folder))

(load custom-file)

(add-to-list 'load-path misc-settings-folder)

(setq browse-url-browser-function 'eww-browse-url)

(require 'personal)
(require 'packagesInit)
(require 'customFacesInit)
;; (require 'idoInit)
(require 'functionsInit)
(require 'engineInit)
(require 'linumInit)
(require 'interface)
(require 'modeLineInit)
(require 'orgmodeInit)
(require 'projectileInit)
;; (require 'autocompleteInit)

(require 'pythonInit)
(require 'magitInit)
(require 'virtualenvwrapperInit)
(require 'yasInit)
(require 'flycheckInit)
(require 'googleTranslateInit)
;; (require 'keyboardMacros)
(require 'bbdbInit)
(require 'eshellInit)
(require 'messageInit)
;; (require 'helmInit)
(require 'ivyInit)
(require 'flyspellInit)
(require 'slimeInit)
(require 'gnusInit)
(require 'companyInit)
(require 'diminishInit)
(require 'pareditInit)
(require 'eldocInit)
;; (require 'ciderInit)
;; (require 'clojureInit)
(require 'undoTreeInit)
(require 'anzuInit)
(require 'rustInit)
(require 'skewerInit)
(require 'webInit)
(require 'emmetInit)
(require 'diredInit)
(require 'ng2-mode)
(require 'jsInit)
(require 'editorConfigInit)
(require 'shellPopInit)
(require 'shellInit)
;(require 'gitGutterInit)
(require 'editorInit)
(require 'neoTreeInit)
(require 'markDownInit)
(require 'torrentsInit)
(require 'elfeedInit)
(require 'keyBindings)
(require 'keychain-environment)

(provide 'init)
;;; init.el ends Here
(put 'upcase-region 'disabled nil)
