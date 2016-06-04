;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-
;;; ----------------------------------------------------------------------


;;; Code:
;;;   git-gutter-fringe の設定
(when (require 'git-gutter-fringe nil t)
  (global-git-gutter-mode)
  (set-face-foreground 'git-gutter-fr:modified "dark cyan")
  (set-face-foreground 'git-gutter-fr:added    "forest green")
  (set-face-foreground 'git-gutter-fr:deleted  "dark gray")
  )

(provide 'init-git-gutter-fringe)
;;; init-git-gutter-fringe.el ends here
