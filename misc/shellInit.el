;;; shellInit.el --- configurations for shell pop
;;; Commentary:
;; 

;;; Code:

(require 'shell-pop)

(setq shell-pop-default-directory "/home/shibi")
(setq shell-pop-shell-type "shell")
(setq shell-pop-term-shell "/bin/bash")
(setq shell-pop-universal-key "C-s-t")
(setq shell-pop-window-size 20)
(setq shell-pop-full-span t)
(setq shell-pop-window-position "bottom")
(global-set-key [f12] 'shell-pop)


(provide 'shellInit)
;;; shellInit.el ends here
