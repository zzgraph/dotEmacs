;;; flycheckInit.el --- Configurations for flycheck
;;; Commentary:
;;
;; configurations for flycheck-mode, support for error checking and
;; linting many languages including rust (with flycheck-rust), YAML
;; (flycheck-yamllint), bash scripts (with flycheck-checkbashisms),
;; also supports for HTML, CSS/Sass/Less, javascript, typescript,
;; markdown and python works out of the box and just needs some
;; external cli tools to be installed on the machine, also support for
;; emacs lisp also works fine.
;;
;;; Code:

;; Initializing flycheck globally at startup
(add-hook 'after-init-hook #'global-flycheck-mode)

(require 'flycheck-color-mode-line)

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-color-mode-line-mode))

;; using emojies instead of text in modeline to show if there is any
;; error or warning

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-status-emoji-mode))



;; Support to check bash scripts, It needs a executable called
;; checkbashisms installed on the system part of the rpmdevtools on
;; fedora machine can be installed by `sudo dnf install rpmdevtools'
(eval-after-load 'flycheck
  (add-hook 'flycheck-mode-hook #'flycheck-checkbashisms-setup))


;; Add rust support it needs flycheck-rust which is being
;; automatically installed
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

;; Check YAML files for Error

(require 'flycheck-yamllint)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-yamllint-setup))

;; For HTML linting flycheck uses tidy cli tool that can be installed
;; with fedora package manager via `sudo dnf install tidy'

;; For CSS/less/SCSS-Sass linting flycheck uses stylelint cli tool
;; that can be installed with npm via `sudo npm install -g stylelint'

;; For Javascript linting flycheck uses eslint cli tool that can be
;; installed with npm via `sudo npm install -g eslint' which needs
;; per-project configuration file, as a fallback it can use standard
;; or semistandard cli utilities which can be installed with
;; `npm install --global semistandard'

;; For Typescript linting flycheck uses tslint cli tool that can be
;; installed with npm via `sudo npm install -g tslint' which needs
;; per-project configuration file

;; Setting executable for javascript semistandard linter
(setq flycheck-javascript-standard-executable "semistandard")

;; For Mrkdown linting flycheck uses markdownlinr (mdl) cli tool that
;; can be installed as ruby gem via
;; `sudo gem install --no-user-install mdl'

;; For Python linting flycheck uses flake8 cli tool that can be
;; installed with python pip via `sudo pip install flake8'


(provide 'flycheckInit)
;;; flycheckInit.el ends here
