
(add-to-list 'load-path "~/.emacs.d/settings")

;;package manager
(require 'package) ;; You might already have this line
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

(when (< emacs-major-version 24)
;; For important compatibility libraries like cl-lib
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

(setq initial-scratch-message "")

(require 'visual_settings)
(require 'edit_settings)
(require 'hl-tags-mode)

(setq ring-bell-function 'ignore)

(defun ask-before-closing ()
  "Ask whether or not to close, and then close if y was pressed"
  (interactive)
  (if (y-or-n-p (format "Are you sure you want to exit Emacs? "))
      (if (< emacs-major-version 22)
          (save-buffers-kill-terminal)
        (save-buffers-kill-emacs))
    (message "Canceled exit")))

(when window-system
(global-set-key (kbd "C-x C-c") 'ask-before-closing))

(require 'uniquify)
(set uniquify-buffer-name-style 'forward)



(setq compile-command "make")

;use mouse in terminal mode
(xterm-mouse-mode 1)

;completion on loading files etc
(require 'ido)
(ido-mode t)

;save point between session
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file "~/.emacs.d/.places")

;save minibuffer history
(savehist-mode 1)
(setq history-length 1000)

(require 'cc-mode)

;; Show keystrokes faste and no dialog boxes
(setq echo-keystrokes 0.1
      use-dialog-box nil)
;; Scroll one line (not half a page) when moving past the bottom of
;; the window
   (setq scroll-step           1
         scroll-conservatively 10000)

;; Show keystrokes in minibuffer immediately
(setq echo-keystrokes 0.01)

;; go to line commnad
(global-set-key [(control l)] 'goto-line)



;; Run C programs directly from within emacs
(defun execute-cpp-program ()
  (interactive)
  (save-buffer)
  (defvar foo)
  (setq foo (concat "g++ -O3 -std=c++11 " (buffer-name) " && time ./a.out" ))
  (shell-command foo))

(global-set-key [C-f1] 'execute-cpp-program)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a49760e39bd7d7876c94ee4bf483760e064002830a63e24c2842a536c6a52756" default)))
 '(global-highlight-parentheses-mode t)
 '(hl-paren-background-colors (quote ("dim gray")))
 '(hl-paren-colors nil)
 '(my-global-highlight-indentation-mode nil)
 '(package-selected-packages
   (quote
    (virtualenvwrapper pylint virtualenv anaconda-mode jedi yasnippet-snippets flycheck python-environment codesearch hydra company-rtags rtags ggtags emamux web-mode hideshowvis rainbow-mode indent-guide highlight-indent-guides elpy paredit magit solarized-theme nlinum-relative linum-relative smex visual-regexp smartparens smart-tab rainbow-delimiters monokai-theme hlinum highlight-parentheses highlight-indentation god-mode expand-region)))
 '(smart-tab-using-hippie-expand nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-enforce-face ((t (:inherit (highlight) :underline nil))))
 '(flyspell-duplicate ((t (:underline "#E6DB74"))))
 '(flyspell-incorrect ((t (:underline "#F92672"))))
 '(fringe ((t (:inherit (default) :background nil))))
 '(header-line ((t (:inherit mode-line-inactive :box t :underline nil :overline nil))))
 '(hideshowvis-hidable-face ((t (:inherit (shadow)))))
 '(highlight ((t (:underline nil))))
 '(highlight-indentation-face ((t (:background "#383838"))))
 '(hl-paren-face ((t (:underline nil :weight bold))) t)
 '(hs-face ((t (:box 1))))
 '(linum ((t (:inherit (default)))))
 '(linum-highlight-face ((t (:inherit (highlight default)))))
 '(minimap-active-region-background ((t (:inherit highlight))) t)
 '(mode-line ((t (:underline nil :overline nil))))
 '(mode-line-highlight ((t (:inherit (highlight mode-line)))))
 '(mode-line-inactive ((t (:underline nil :overline nil)))))


;;; Smex
(autoload 'smex "smex"
  "Smex is a M-x enhancement for Emacs, it provides a convenient interface to
your recently and most frequently used commands.")

(global-set-key (kbd "M-x") 'smex)


;python

(elpy-enable)
