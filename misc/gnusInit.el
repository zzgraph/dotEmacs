;;; gnusInit.el --- Configurations for gnus news and mail reader
;;; Commentary:
;; I only use gnus for mail reading and although I'm using gmail but I
;; prefer not to use gnus nnimap back-end instead I'm using fetchmail
;; and procmail to get mails from gmail IMAP server and distribute
;; them in a Maildir folder and using gnus only to read them. this
;; method is more efficient in term of speed and inbox is always up to
;; date because fetchmail works as a daemon in background. some sample
;; nnimap configurations are still here which I copied from other
;; places and works with gmail imap.
;;
;;; Code:
(require 'nnir)

;; I always quit Emacs without properly exiting Gnus let's take care of this
(add-hook 'before-kill-emacs-hook 'gnus-group-exit)


(setq gnus-select-method '(nnmaildir "ZZGRAPH" (directory "~/Maildir/")
				     (get-new-mail t)
				     (nnir-search-engine notmuch)
				     )
      nnir-notmuch-remove-prefix "/home/shibi/Maildir"
      mail-sources '((maildir :path "~/Maildir/" :subdirs ("cur" "new")))
      mail-source-delete-incoming t
      )
(defun zzgraph/update-notmuch ()
  (start-process "notmuch-poll" nil "notmuch" "new"))

(add-hook 'gnus-after-getting-new-news-hook 'zzgraph/update-notmuch)

(setq gnus-secondary-select-methods '((nntp "news.gmane.org")))
(setq gnus-message-archive-method "nnmaildir+ZZGRAPH:"
      gnus-update-message-archive-method t
      gnus-message-archive-group '((if (message-news-p)
				       "nnmaildir+ZZGRAPH:sent-news"
				     "nnmaildir+ZZGRAPH:Archive")))


(setq gnus-visible-headers "^From:\\|^Newsgroups:\\|^Subject:\\|^Date:\\|\
^Followup-To:\\|^Reply-To:\\|^Summary:\\|^Keywords:\\|\
^To:\\|^[BGF]?Cc:\\|^Posted-To:\\|^Mail-Copies-To:\\|\
^Mail-Followup-To:\\|^Apparently-To:\\|\
^Gnus-Warning:\\|^Resent-From:\\|^X-Sent:\\|\
^User-Agent:\\|^X-Mailer:\\|^X-Newsreader:")

;; threading from this link:
;; https://groups.google.com/d/msg/gnu.emacs.gnus/pnOnQ1bnFB8/Dx2TGnoE4SoJ

(defun gnus-user-format-function-@ (header)
  "Display @ for message with attachment in summary line.

You need to add `Content-Type' to `nnmail-extra-headers' and
`gnus-extra-headers', see Info node `(gnus)To From Newsgroups'."
  (let ((case-fold-search t)
	(ctype (or (cdr (assq 'Content-Type (mail-header-extra header)))
		   "text/plain"))
	indicator)
    (when (string-match "^multipart/mixed" ctype)
      (setq indicator "@"))
    (if indicator
	indicator
      " ")))

(defalias 'gnus-user-format-function-score 'rs-gnus-summary-line-score)

(defun rs-gnus-summary-line-score (head)
  "Return pretty-printed version of article score.

See (info \"(gnus)Group Line Specification\")."
  (let ((c (gnus-summary-article-score (mail-header-number head))))
    ;; (gnus-message 9 "c=%s chars in article %s" c (mail-header-number head))
    (cond ((< c -1000)     "vv")
          ((< c  -100)     " v")
          ((< c   -10)     "--")
          ((< c     0)     " -")
          ((= c     0)     "  ")
          ((< c    10)     " +")
          ((< c   100)     "++")
          ((< c  1000)     " ^")
          (t               "^^"))))

(setq gnus-face-9 'font-lock-warning-face)
(setq gnus-face-10 'shadow)


(defun zzgraph/gnus-summary-line-format-unicode nil
  "Set arrow shapes in gnus summary window."
  (interactive)
  (if (display-graphic-p)
      (progn
	(setq
	 gnus-summary-line-format
	 (concat
         "%0{%U%R%z%}" "%10{│%}" "%4{%~(max-right 15)-15&user-date;%}" "%10{│%}"
         "%9{%u&@;%}" "%(%-15,15f %)" "%10{│%}" "%4k %5Ll" "%10{│%}"
         "%2u&score;" "%10{│%}" "%*" "%10{%B%}" "%~(max-right 80)s\n")

	 gnus-user-date-format-alist
	 '(
	   ((gnus-seconds-today) . "امروز، %H:%M")
	   ((+ 86400 (gnus-seconds-today)) . "دیروز، %H:%M")
	   (604800 . "%A %H:%M") ;;that's one week
	   ((gnus-seconds-month) . "%A %d")
	   ((gnus-seconds-year) . "%B %d")
	   (t . "%B %d '%y")) ;;this one is used when no other does match
	 gnus-sum-thread-tree-single-indent   "◎ "
	 gnus-sum-thread-tree-false-root      "◯ "
	 gnus-sum-thread-tree-root            "┌ "
	 gnus-sum-thread-tree-vertical        "│"
	 gnus-sum-thread-tree-leaf-with-other "├─► "
	 gnus-sum-thread-tree-single-leaf     "╰─► "
	 gnus-sum-thread-tree-indent          "--")
	
	(gnus-message 5 "Using ASCII tree layout with Unicode chars."))

    (setq gnus-summary-line-format
        (concat
         "%0{%U%R%z%}" "%10{|%}" "%1{%D%}" "%10{|%}"
         "%9{%u&@;%}" "%(%-15,15f %)" "%10{|%}" "%4k" "%10{|%}"
         "%2u&score;" "%10{|%}" "%10{%B%}" "%~(max-right 100)s\n"))
  (setq
   gnus-sum-thread-tree-single-indent   "o "
   gnus-sum-thread-tree-false-root      "x "
   gnus-sum-thread-tree-root            "* "
   gnus-sum-thread-tree-vertical        "| "
   gnus-sum-thread-tree-leaf-with-other "|-> "
   gnus-sum-thread-tree-single-leaf     "+-> " ;; "\\" is _one_ char
   gnus-sum-thread-tree-indent          "  ")
  (gnus-message 5 "Using ascii tree layout.")))

(add-hook 'gnus-summary-mode-hook
	  'zzgraph/gnus-summary-line-format-unicode)



;; set a three pane configuration for gnus frame one vertical narrow
;; window for groups, and a horizontally split window for summary
;; and article views
(setq gnus-summary-display-arrow t)
(gnus-add-configuration
 '(article
   (horizontal 1.0
	       (vertical 30
			 (group 1.0))
	       (vertical 1.0
			 (summary 0.25 point)
			 (article 1.0)))))
(gnus-add-configuration
 '(summary
   (horizontal 1.0
	       (vertical 30
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
;;       smtpmail-auth-credentials '(("smtp.gmail.com" 587 "user@gmail.com" nil))
;;       smtpmail-default-smtp-server "smtp.gmail.com"
;;       smtpmail-smtp-server "smtp.gmail.com"
;;       smtpmail-smtp-service 587
;;       smtpmail-local-domain "")

(setq gnus-thread-hide-subtree t)
;; (setq gnus-thread-ignore-subject t)

(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)
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


(provide 'gnusInit)
;;; gnusInit.el ends here
