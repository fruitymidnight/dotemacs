;;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-
;;; init-junk.el --- 

;;; Commentary:

;; 

;;; Code:


;;; -------------------------------------------------------------------
;;;; open-junk-file
;;; -------------------------------------------------------------------
(use-package open-junk-file
  :ensure t
  :bind ("C-x j" . open-junk-file)
  :config
  (progn
    (setq open-junk-file-format (expand-file-name (concat my:user-junk-directory "%Y-%m%d-%H%M%S.")))
    )
  )
