(setq require-final-newline 't)

;use mouse in terminal mode
(xterm-mouse-mode 1)


(defun comment-eclipse ()
  (interactive)
  (let ((start (line-beginning-position))
	(end (line-end-position)))
    (when (or (not transient-mark-mode) (region-active-p))
      (setq start (save-excursion
		    (goto-char (region-beginning))
		    (beginning-of-line)
		    (point))
	    end (save-excursion
		  (goto-char (region-end))
		  (end-of-line)
		  (point))))
    (comment-or-uncomment-region start end)))

(global-set-key (kbd "C-c c") 'comment-eclipse)

(global-set-key (kbd "<select>") (lambda () (interactive) (end-of-visible-line)))

;; Remove text in active region if inserting text
(delete-selection-mode 1)


(setq standard-indent 2)
(setq tab-always-indent (quote always))
(setq-default indent-tabs-mode nil)
;; Use normal tabs in makefiles
(add-hook 'makefile-mode-hook 'indent-tabs-mode)



(add-hook 'before-save-hook 'delete-trailing-whitespace)

(defun unix-file ()
  (interactive)
  (set-buffer-file-coding-system 'iso-latin-1-unix t))

(require 'smart-tab)
(global-smart-tab-mode 1)

(defun query-replace-in-open-buffers (arg1 arg2)
  "query replace in all open files"
  (interactive "Query replace in open buffers: \nquery with: ")
  (mapcar
   (lambda (x)
     (find-file x)
     (save-excursion
       (beginning-of-buffer)
       (query-replace arg1 arg2)))
   (delq
    nil
    (mapcar
     (lambda (x)
       (buffer-file-name x))
     (buffer-list)))))




;; Easily navigate camelcased words
(global-subword-mode 1)



;; Visual regexp
(require 'visual-regexp)
(define-key global-map (kbd "M-/") 'vr/query-replace)

;; query-replace current word
(defun qrc (replace-str)
   (interactive "Do query-replace current word with: ")
   (forward-word)
   (let ((end (point)))
      (backward-word)
      (kill-ring-save (point) end)
      (query-replace (current-kill 0) replace-str) ))

(global-set-key (kbd "C-/") 'qrc)


;; No electric indent
(setq electric-indent-mode nil)

;; expand active region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;;pair parenthesis
(require 'smartparens-config)
(smartparens-global-mode)
;for latex:
(sp-pair "\left(" "\\right)")
(sp-pair "\left]" "\\right]")
(sp-pair "\left}" "\\right}")
(sp-pair "\\*" "*\\")


;; keyboard shortcuts
(global-set-key  [f7]  'compile)
(global-set-key  [f8]  'next-error)
(global-set-key  [f9]  'shell-command)

(setq-default c-basic-offset 2 c-default-style "linux")


(global-set-key (kbd "<escape>") 'god-local-mode)

(defun my-update-cursor ()
  (setq cursor-type (if (or god-local-mode buffer-read-only)
                        'box
                      'bar)))

(add-hook 'god-mode-enabled-hook 'my-update-cursor)
(add-hook 'god-mode-disabled-hook 'my-update-cursor)

(provide 'edit_settings)
