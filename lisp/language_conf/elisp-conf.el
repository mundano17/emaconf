;; -*- lexical-binding: t; -*-
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (remove-hook 'flymake-diagnostic-functions #'elisp-flymake-checkdoc t)))

;; NOTE TO SELF: Enable trusted-content for the byte-compile backend, use M-x customize-options and set it from there.

(provide 'elisp-conf)
