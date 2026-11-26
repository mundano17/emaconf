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

(provide 'eglot-conf)
