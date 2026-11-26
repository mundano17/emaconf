;; -*- lexical-binding: t; -*-

(use-package eglot
  :ensure nil
  :hook ((go-ts-mode
          python-ts-mode
          rust-ts-mode
          typescript-ts-mode
          tsx-ts-mode
          js-ts-mode
          html-mode
          css-ts-mode) . eglot-ensure)
  :config
  (setq eglot-autoshutdown t))

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


(use-package corfu
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0.2)
  (corfu-auto-prefix 2)
  (corfu-cycle t)
  :init
  (global-corfu-mode))

(use-package cape
  :init
  (add-hook 'completion-at-point-functions #'cape-dabbrev)
  (add-hook 'completion-at-point-functions #'cape-file)
  (add-hook 'completion-at-point-functions #'cape-elisp-block))

(use-package apheleia
  :config
  ;; Optional: tell Python modes to use ruff instead of black
  (setf (alist-get 'python-mode apheleia-mode-alist) '(ruff-isort ruff))
  (setf (alist-get 'python-ts-mode apheleia-mode-alist) '(ruff-isort ruff))

  ;; Enable format-on-save globally
  (apheleia-global-mode 1))

(use-package flymake-golangci
  :hook (eglot-managed-mode . (lambda ()
                                (when (derived-mode-p 'go-mode 'go-ts-mode)
                                  (flymake-golangci-load)))))

(use-package consult
  :bind (("C-s" . consult-line)
	 ("C-x b" . consult-buffer)))

(use-package flycheck-inline
  :hook (flymake-mode . flymake-inline-mode))

(provide 'code)
