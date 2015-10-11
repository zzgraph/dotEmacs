;;; Package --- configGNUS.el
;;; Commentary:
;;; Code:
(require 'nnir)


(setq
	gnus-select-method '(nnmaildir "ZZGRAPH" (directory "~/Maildir/"))
 	mail-sources '((maildir :path "~/Maildir/" :subdirs ("cur" "new")))
	mail-source-delete-incoming t
)
;; (setq gnus-secondary-select-methods nil)
(setq gnus-message-archive-group "nnmaildir+Archive")

(when 'display-graphic-p
  (setq gnus-sum-thread-tree-indent "  ")
  (setq gnus-sum-thread-tree-root "● ")
  (setq gnus-sum-thread-tree-false-root "◯ ")
  (setq gnus-sum-thread-tree-single-indent "◎ ")
  (setq gnus-sum-thread-tree-vertical        "│")
  (setq gnus-sum-thread-tree-leaf-with-other "├─► ")
  (setq gnus-sum-thread-tree-single-leaf     "╰─► "))
(setq gnus-summary-line-format
      (concat
       "%0{%U%R%z%}"
       "%3{│%}" "%1{%d%}" "%3{│%}" ;; date
       "  "
       "%4{%-20,20f%}"               ;; name
       "  "
       "%3{│%}"
       " "
       "%1{%B%}"
       "%s\n"))

;; set a three pane configuration for gnus frame one vertical narrow
;; window for groups, and a horizontally split window for summary
;; and article views
(setq gnus-summary-display-arrow t)
(gnus-add-configuration
 '(article
   (horizontal 1.0
	       (vertical 25
			 (group 1.0))
	       (vertical 1.0
			 (summary 0.25 point)
			 (article 1.0)))))
(gnus-add-configuration
 '(summary
   (horizontal 1.0
	       (vertical 25
			 (group 1.0))
	       (vertical 1.0
			 (summary 1.0 point)))))
;; (setq epa-file-cache-passphrase-for-symmetric-encryption t)

;; (setq smtp-auth-credentials "~/.emacs.d/.authinfo.gpg")


;; (setq gnus-select-method
;;       '(nnimap "imap.gmail.com"
;;       (nnimap-inbox "INBOX")
;;       (nnimap-server-port "imaps")
;;       (nnimap-stream ssl)
;;       (nnimap-split-methods default)
;;       (nnir-search-engine imap)
;;       (nnimap-authinfo-file imap "~/.emacs.d/.authinfo.gpg")
;;       ))


;; (setq mm-text-html-renderer 'w3m)

;; (setq message-send-mail-function 'smtpmail-send-it
;;       smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
;;       smtpmail-auth-credentials '(("smtp.gmail.com" 587 "zzgraph@gmail.com" nil))
;;       smtpmail-default-smtp-server "smtp.gmail.com"
;;       smtpmail-smtp-server "smtp.gmail.com"
;;       smtpmail-smtp-service 587
;;       smtpmail-local-domain "fedora22")

;; (setq gnus-thread-hide-subtree t)
;; (setq gnus-thread-ignore-subject t)

;; (add-hook 'gnus-group-mode-hook 'gnus-topic-mode)
;; (setq-default
;;   gnus-summary-line-format "%U%R%z %(%&user-date;  %-15,15f  %B%s%)\n"
;;   gnus-user-date-format-alist '((t . "%Y-%m-%d %H:%M"))
;;   gnus-summary-thread-gathering-function 'gnus-gather-threads-by-references
;;   gnus-sum-thread-tree-false-root ""
;;   gnus-sum-thread-tree-indent ""
;;   gnus-sum-thread-tree-leaf-with-other "-> "
;;   gnus-sum-thread-tree-root ""
;;   gnus-sum-thread-tree-single-leaf "|_ "
;;   gnus-sum-thread-tree-vertical "|")

;; (setq gnus-thread-sort-functions
;;       '(
;;         (not gnus-thread-sort-by-date)
;;         (not gnus-thread-sort-by-number)
;;         ))

;; ; NO 'passive
;; (setq gnus-use-cache t)
;; (setq gnus-use-adaptive-scoring t)
;; (setq gnus-save-score t)
;; (add-hook 'mail-citation-hook 'sc-cite-original)
;; (add-hook 'message-sent-hook 'gnus-score-followup-article)
;; (add-hook 'message-sent-hook 'gnus-score-followup-thread)
;; ; @see http://stackoverflow.com/questions/945419/how-dont-use-gnus-adaptive-scoring-in-some-newsgroups
;; (setq gnus-parameters
;;       '(("nnimap.*"
;;          (gnus-use-scoring nil))
;;         ))

;; (defvar gnus-default-adaptive-score-alist
;;   '((gnus-kill-file-mark (from -10))
;;     (gnus-unread-mark)
;;     (gnus-read-mark (from 10) (subject 30))
;;     (gnus-catchup-mark (subject -10))
;;     (gnus-killed-mark (from -1) (subject -30))
;;     (gnus-del-mark (from -2) (subject -15))
;;     (gnus-ticked-mark (from 10))
;;     (gnus-dormant-mark (from 5))))

;; (setq  gnus-score-find-score-files-function
;;        '(gnus-score-find-hierarchical gnus-score-find-bnews bbdb/gnus-score)
;;        )

;; ;;;###autoload
;; (defun bbdb-timestamp-hook (record)
;;   "For use as a `bbdb-change-hook'; maintains a notes-field called `timestamp'
;;   for the given record which contains the time when it was last modified.  If
;;   there is such a field there already, it is changed, otherwise it is added."
;;   (bbdb-record-putprop record 'timestamp (format-time-string
;;                                            bbdb-time-internal-format
;;                                            (current-time))))



;; (add-hook 'message-mode-hook
;;           '(lambda ()
;;              (flyspell-mode t)
;;              (local-set-key "<TAB>" 'bbdb-complete-name)))


(provide 'configGNUS)
;;; configGNUS.el ends here
