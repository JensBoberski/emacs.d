;;; Compiled snippets and support files for `text-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'text-mode
                     '(("de" "def ${1:name}($2):\n    \"\"\"\n    $3\n    ${2:$\n    (let* ((indent\n            (concat \"\\n\" (make-string (current-column) 32)))\n           (args\n            (mapconcat\n             '(lambda (x)\n                (if (not (string= (nth 0 x) \"\"))\n                    (concat \"@param \" (nth 0 x) \": \" indent\n                            \"@type \" (nth 0 x) \": \")))\n             (mapcar\n              '(lambda (x)\n                 (mapcar\n                  '(lambda (x)\n                     (replace-regexp-in-string \"[[:blank:]]*$\" \"\"\n                      (replace-regexp-in-string \"^[[:blank:]]*\" \"\" x)))\n                  x))\n              (mapcar '(lambda (x) (split-string x \"=\"))\n                      (split-string text \",\")))\n             indent)))\n      (if (string= args \"\")\n          (concat indent \"@return: \" indent \"@rtype: \" indent (make-string 3 34))\n        (mapconcat\n         'identity\n         (list \"\" args \"@return: \" \"@rtype: \" (make-string 3 34))\n         indent)))\n    }\n    $0\n" "de" nil nil nil "/home/jboberski/.emacs.d/snippets/text-mode/python-mode/de" nil nil)))


;;; Do not edit! File generated at Tue Feb 13 07:40:43 2018
