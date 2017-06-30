;;; editorConfigInit.el --- configuration for editorconfig http://editorconfig.org/
;;; Commentary:
;;
;; To use functionality of editorconfig first we should install the
;; core package on system, on fedora machine there are a python
;; distribution of core package available can be installed by
;; following command:
;;
;; sudo dnf install python3-editorConfig
;;
;; the Emacs package can be found in this link:
;;
;; https://github.com/editorconfig/editorconfig-emacs
;;
;; an it should be installed with the command:
;;
;; `M-x package-install RET editorconfig'
;;
;; the purpose of using editorconfig is that to use same code style
;; throughout a project whereas a .editorconfig file has been
;; presented in the root folder.  Some pre-built skeletons for
;; projects, for example angular skeletons built with angular-cli is
;; prividing .editorconfig file by default.

;;; code:

(require 'editorconfig)
(editorconfig-mode 1)

(provide 'editorConfigInit)
;;; editorConfigInit.el ends here
