;;; Compiled snippets and support files for `terraform-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'terraform-mode
                     '(("var" "variable \"${1:name}\" {\n  ${2:default = \"$3\"}\n}" "variable" nil nil nil "/home/jboberski/.emacs.d/elpa/yasnippet-snippets-20180122.521/snippets/terraform-mode/variable" nil nil)
                       ("res" "resource \"${1:type}\" \"${2:name}\" {\n         $0\n}\n" "resource" nil nil nil "/home/jboberski/.emacs.d/elpa/yasnippet-snippets-20180122.521/snippets/terraform-mode/resource" nil nil)))


;;; Do not edit! File generated at Tue Feb 13 07:40:45 2018
