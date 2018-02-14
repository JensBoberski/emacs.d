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


(setq electric-indent-mode nil)
(define-key global-map (kbd "RET") 'newline-and-indent)
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

(electric-pair-mode t)
;; keyboard shortcuts
(global-set-key  [f7]  'compile)
(global-set-key  [f8]  'next-error)
(global-set-key  [f9]  'shell-command)

(setq-default c-basic-offset 2 c-default-style "k&r")

; style I want to use in c++ mode
(c-add-style "my-style"
	     '("stroustrup"
	       (indent-tabs-mode . nil)        ; use spaces rather than tabs
	       (c-basic-offset . 4)            ; indent by four spaces
	       (c-offsets-alist . ((inline-open . 1)  ; custom indentation rules
				   (brace-list-open . 1)
				   (statement-case-open . +)))))

(defun my-c++-mode-hook ()
  (c-set-style "my-style")        ; use my-style defined above
  (auto-fill-mode)
  (c-toggle-auto-hungry-state 1))

(add-hook 'c++-mode-hook 'my-c++-mode-hook)

(global-set-key (kbd "<escape>") 'god-local-mode)

(defun my-update-cursor ()
  (setq cursor-type (if (or god-local-mode buffer-read-only)
                        'box
                      'bar)))

(add-hook 'god-mode-enabled-hook 'my-update-cursor)
(add-hook 'god-mode-disabled-hook 'my-update-cursor)


(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/snippets")

(define-key yas-minor-mode-map (kbd "<backtab>") 'yas-expand)


(defun python-args-to-google-docstring (text &optional make-fields)
  "Return a reST docstring format for the python arguments in yas-text."
  (let* ((indent (concat "\n" (make-string (current-column) 32)))
         (args (python-split-args text))
     (nr 0)
         (formatted-args
      (mapconcat
       (lambda (x)
         (concat "   " (nth 0 x)
             (if make-fields (format " ${%d:arg%d}" (cl-incf nr) nr))
             (if (nth 1 x) (concat " \(default " (nth 1 x) "\)"))))
       args
       indent)))
    (unless (string= formatted-args "")
      (concat
       (mapconcat 'identity
          (list "" "Args:" formatted-args)
          indent)
       "\n"))))


(add-hook 'after-init-hook #'global-flycheck-mode)

(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)



(provide 'edit_settings)
