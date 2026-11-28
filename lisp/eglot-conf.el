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
          css-ts-mode
	  r-ts-mode) . eglot-ensure)
  :config
  (setq eglot-autoshutdown t))

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '(ess-r-mode . ("air" "language-server"))))

(provide 'eglot-conf)
