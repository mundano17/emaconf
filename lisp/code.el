;; -*- lexical-binding: t; -*-

(use-package mood-line
  :config
  (mood-line-mode))

(add-to-list 'load-path
             (expand-file-name "lisp/language_conf" user-emacs-directory))

(use-package magit
  :ensure t)

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

  (setf (alist-get 'air apheleia-formatters)
        '("air" "format" "--stdin-file-path" filepath))
  (setf (alist-get 'ess-r-mode apheleia-mode-alist) 'air)

  ;; Enable format-on-save globally
  (apheleia-global-mode 1))

(use-package consult
  :bind (("C-s" . consult-line)
	 ("C-x b" . consult-buffer)))

(use-package flymake
  :ensure nil 
  :hook (prog-mode . flymake-mode)
  :custom
  (flymake-no-changes-timeout 0.5)
  (flymake-show-diagnostics-at-end-of-line 'short))

(require 'go-conf)
(require 'elisp-conf)
(provide 'code)

