;;; Package --- linumInit.el
;;; Commentary:
;;; Code:
(global-linum-mode t)
;; (setq linum-format (if (not window-system) "%4d " "%4d"))

;; Ensure linum-mode is disabled in certain major modes.
;; From Here https://github.com/bodil/ohai-emacs/blob/master/modules/ohai-appearance.el
;; (setq linum-disabled-modes
;;       '(term-mode magit-status-mode help-mode
;; 		  package-menu-mode apropos-mode
;; 		  special-mode gnus-article-mode gnus-summary-mode))

;; (defun linum-on ()
;;   (unless (or (minibufferp) (member major-mode linum-disabled-modes))
;;     (linum-mode 1)))
;http://stackoverflow.com/questions/3875213/ \
;turning-on-linum-mode-when-in-python-c-mode
(defvar linum-mode-inhibit-modes-list)
(setq linum-mode-inhibit-modes-list '(eshell-mode
                                      shell-mode
                                      dictionary-mode
                                      erc-mode
                                      browse-kill-ring-mode
                                      etags-select-mode
                                      dired-mode
                                      help-mode
                                      text-mode
                                      fundamental-mode
                                      jabber-roster-mode
                                      jabber-chat-mode
                                      inferior-scheme-mode
                                      twittering-mode
                                      compilation-mode
                                      weibo-timeline-mode
                                      woman-mode
                                      Info-mode
                                      calc-mode
                                      calc-trail-mode
                                      comint-mode
                                      gnus-group-mode
                                      inf-ruby-mode
                                      gud-mode
                                      org-mode
                                      vc-git-log-edit-mode
                                      log-edit-mode
                                      term-mode
                                      w3m-mode
                                      speedbar-mode
                                      gnus-summary-mode
                                      gnus-article-mode
                                      calendar-mode
				      inferior-python-mode
				      inferior-emacs-lisp-mode
				      python-django-mode
				      messages-buffer-mode
				      cider-repl-mode
				      Custom-mode))
(defadvice linum-on (around linum-on-inhibit-for-modes)
           "Stop the load of linum-mode for some major modes."
           (unless (member major-mode linum-mode-inhibit-modes-list)
             ad-do-it))
(ad-activate 'linum-on)
(require 'hlinum)
(hlinum-activate)

(provide 'linumInit)
