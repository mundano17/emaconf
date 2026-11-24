;; -*- lexical-binding: t; -*-
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setopt inhibit-startup-screen t
        display-line-numbers-type 'relative)

(add-hook 'prog-mode-hook #'display-line-numbers-mode)


(add-to-list 'load-path
             (expand-file-name "lisp" user-emacs-directory))

(setq custom-file
      (expand-file-name "custom.el" user-emacs-directory))
(load custom-file t)

(require 'package)

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(setq use-package-always-ensure t)

;; Configuration modules
(require 'ui)
(require 'code)
(require 'editing)
(require 'keybindings)
(require 'theme)
(require 'org-conf)
