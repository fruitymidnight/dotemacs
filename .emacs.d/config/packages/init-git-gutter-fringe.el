; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-
;; ----------------------------------------------------------------------

(when (require 'git-gutter-fringe nil t)
  (global-git-gutter-mode)
  (set-face-foreground 'git-gutter-fr:modified "dark cyan")
  (set-face-foreground 'git-gutter-fr:added    "forest green")
  (set-face-foreground 'git-gutter-fr:deleted  "dark gray")
  )

