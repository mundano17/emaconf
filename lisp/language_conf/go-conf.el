;; -*- lexical-binding: t; -*-
(use-package flymake-golangci
  :hook (eglot-managed-mode . (lambda ()
                                (when (derived-mode-p 'go-mode 'go-ts-mode)
                                  (flymake-golangci-load)))))

(provide 'go-conf)
