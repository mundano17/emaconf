;; -*- lexical-binding: t; -*-

;; what is major mode and minor mode ?
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
(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode 1))

(use-package consult
  :bind (("C-s" . consult-line)
	 ("C-x b" . consult-buffer)))

(use-package flycheck-inline
  :hook (flymake-mode . flymake-inline-mode))

(provide 'code)
