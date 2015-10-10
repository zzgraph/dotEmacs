;;; Package --- messageInit.el
;;; Commentary:
;;; Code:

(setq message-sendmail-f-is-evil t)
(setq message-send-mail-function 'message-send-mail-with-sendmail)
(setq message-sendmail-extra-arguments '("--read-envelope-from"))
(setq sendmail-program "/usr/bin/msmtp")

(setq mail-user-agent 'sendmail-user-agent)
(add-hook 'message-mode-hook 'turn-on-orgstruct)
(add-hook 'message-mode-hook 'turn-on-orgstruct++)
(add-hook 'message-mode-hook 'turn-on-orgtbl)

;; From this guid on EmacsWiki
;; http://www.emacswiki.org/emacs/GnusTutorial#toc39
(setq message-alternative-emails
      (regexp-opt my-email-addresses))
;; Gnus from manipulation
(setq gnus-from-selected-index 0)
(defun gnus-loop-from ()
  (interactive)
  (setq gnus-article-current-point (point))
  (goto-char (point-min))
  (if (eq gnus-from-selected-index (length my-email-addresses))
      (setq gnus-from-selected-index 0) nil)
  (while (re-search-forward "^From:.*$" nil t)
    (replace-match (concat "From: " user-full-name " <" (nth gnus-from-selected-index my-email-addresses) ">")))
  (goto-char gnus-article-current-point)
  (setq gnus-from-selected-index (+ gnus-from-selected-index 1)))

(add-hook 'message-mode-hook '(lambda () (local-set-key (kbd "C-c f") 'gnus-loop-from)))

(provide 'messageInit)
;;; messageInit.el ends here
