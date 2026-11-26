;; -*- lexical-binding: t; -*-

;; custom functions for treesitter management
(defun may-the-ts-mode-be-with-me ()
  (interactive)
  (add-to-list 'major-mode-remap-alist '(c-mode . c-ts-mode))
  (add-to-list 'major-mode-remap-alist '(c++-mode . c++-ts-mode))
  (add-to-list 'major-mode-remap-alist '(go-mode . go-ts-mode))
  (add-to-list 'major-mode-remap-alist '(rust-mode . rust-ts-mode))
  (add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode))
  (add-to-list 'major-mode-remap-alist '(js-mode . js-ts-mode))
  (add-to-list 'major-mode-remap-alist '(typescript-mode . typescript-ts-mode))
  (add-to-list 'major-mode-remap-alist '(html-mode . html-ts-mode))
  (add-to-list 'major-mode-remap-alist '(css-mode . css-ts-mode)))

(defun set-ts-grammar-sources ()
  (setq treesit-language-source-alist
        '((c "https://github.com/tree-sitter/tree-sitter-c")
          (cpp "https://github.com/tree-sitter/tree-sitter-cpp")
          (go "https://github.com/tree-sitter/tree-sitter-go")
          (rust "https://github.com/tree-sitter/tree-sitter-rust")
          (python "https://github.com/tree-sitter/tree-sitter-python")
          (r "https://github.com/r-lib/tree-sitter-r")
          (javascript "https://github.com/tree-sitter/tree-sitter-javascript")
          (typescript "https://github.com/tree-sitter/tree-sitter-typescript"
		      "master" "typescript/src")
          (tsx "https://github.com/tree-sitter/tree-sitter-typescript"
	       "master" "tsx/src")
          (html "https://github.com/tree-sitter/tree-sitter-html")
          (css "https://github.com/tree-sitter/tree-sitter-css"))))

(defun treesit-install-required-grammars ()
  "install all the treesit grammars set in code.el"
  (interactive)
  (set-ts-grammar-sources)
  (dolist (grammar '(c cpp go rust python r javascript
		       typescript tsx html css))
    (treesit-install-language-grammar grammar)))

(may-the-ts-mode-be-with-me)

(setq treesit-font-lock-level 4)

(add-hook 'go-ts-mode-hook  (lambda () (setq-local tab-width 4)))

(provide 'treesit-conf)
