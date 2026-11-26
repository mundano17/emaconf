;; -*- lexical-binding: t; -*-
(use-package which-key
  :config
  (setq which-key-idle-delay 0.3)
  (which-key-mode 1))

(defun open-config ()
  (interactive)
  (dired user-emacs-directory))

(use-package general
  :after evil
  :config
  (general-evil-setup t)

  (general-create-definer my/leader-keys
    :states '(normal visual motion)
    :keymaps 'override
    :prefix "SPC"
    :global-prefix "M-SPC")

  (my/leader-keys
    ;; access
    "SPC" '(project-find-file :which-key "Find file in project")
    "."   '(find-file :which-key "Find file")
    "/"   '(consult-ripgrep :which-key "Search project (ripgrep)")
    ","   '(consult-buffer :which-key "Switch buffer")
    "?"   '(consult-imenu :which-key "Jump to symbol/function")

    ;; code 
    "c"   '(:ignore t :which-key "code")
    "ca"  '(eglot-code-actions :which-key "Code actions")
    "cr"  '(eglot-rename :which-key "Rename symbol")
    "cf"  '(apheleia-format-buffer :which-key "Format buffer")
    "cd"  '(xref-find-definitions :which-key "Go to definition")
    "cD"  '(xref-find-references :which-key "Find references")
    "ce"  '(consult-flymake :which-key "List errors/diagnostics")

    ;;magit
    "g" '(:ignore t :which-key "magit")
    "gg" '(magit :which-key "open magit")
    "gc" '(magit-commit :which-key "magit commit")

    
    ;; files
    "f"   '(:ignore t :which-key "files")
    "fs"  '(save-buffer :which-key "Save file")
    "fr"  '(consult-recent-file :which-key "Recent files")
    "op"  '(treemacs :which-key "Toggle Treemacs")

    ;; buffers
    "b"   '(:ignore t :which-key "buffers")
    "bb"  '(consult-buffer :which-key "Switch buffer")
    "bk"  '(kill-current-buffer :which-key "Kill buffer")

    ;; windows
    "w"   '(:ignore t :which-key "windows")
    "wv"  '(split-window-right :which-key "Vertical split")
    "ws"  '(split-window-below :which-key "Horizontal split")
    "wd"  '(delete-window :which-key "Close window")
    "wh"  '(evil-window-left :which-key "Window left")
    "wj"  '(evil-window-down :which-key "Window down")
    "wk"  '(evil-window-up :which-key "Window up")
    "wl"  '(evil-window-right :which-key "Window right")

    ;; org mode
    "o" '(:ignore t :which-key "org")
    "odd" '(org-deadline :which-key "insert deadline")

    ;; miscelleneous
    "m" '(:ignore t :which-key "miscelleneous")
    "mk" '(open-config :which-key "open config")

    ;; workspaces
    "TAB" '(perspective-map :which-key "Workspaces")))

(evil-define-key 'normal 'global
  (kbd "]d") #'flymake-goto-next-error
  (kbd "[d") #'flymake-goto-prev-error)



(provide 'keybindings)
