; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-
;;------------------------------------------------------------------------------
;; @ C mode の設定





;; helm-gtags の設定
(lazyload (helm-gtags-mode) "helm-gtags"

          ;; customize
;;         (setq helm-gtags-path-style 'relative)
         (setq helm-gtags-ignore-case t)
         (setq helm-gtags-read-only t)
         (setq helm-gtags-auto-update t)

          ;; key-binding
          (local-set-key (kbd "M-t") 'helm-gtags-find-tag)
          (local-set-key (kbd "M-r") 'helm-gtags-find-rtag)
          (local-set-key (kbd "M-s") 'helm-gtags-find-symbol)
          (local-set-key (kbd "M-g M-p") 'helm-gtags-parse-file)
          (local-set-key (kbd "M-,") 'helm-gtags-pop-stack)
)

(defun pew-c-mode-hook ()
  "C mode with adjusted defaults for use with the PEW Style."
  (c-set-style "gnu")
  ;; (setq-default indent-tabs-mode t) ; インデントはTABでおこなう
  (setq tab-width 4)
  (setq c-basic-offset tab-width)
  (linum-mode t)
  (setq truncate-lines t)
  ;; (define-key c-mode-base-map [backspace] 'backward-delete-char)
  )

(defun my-c-mode-hook ()
    "C mode with adjusted defaults for use with the PEW Style."
   (c-set-style "stroustrup")
   (setq-default indent-tabs-mode nil) ; インデントはSpaceでおこなう
   (setq tab-width 4)
   (setq c-basic-offset tab-width)
   (linum-mode t)
   (setq truncate-lines t)

   ;; 自動改行（auto-new-line）と
   ;; 連続する空白の一括削除（hungry-delete）を
   ;; 有効にする
   ;;(c-toggle-auto-hungry-state 1)

   ;; CamelCaseの語でも単語単位に分解して編集する
   ;; GtkWindow         => Gtk Window
   ;; EmacsFrameClass   => Emacs Frame Class
   ;; NSGraphicsContext => NS Graphics Context
   (subword-mode 1)
   (define-key c-mode-base-map [backspace] 'backward-delete-char)
   )

(defun my-cpp-mode-hook ()
    "C mode with adjusted defaults for use with the PEW Style."
   (c-set-style "stroustrup")
   (setq-default indent-tabs-mode nil) ; インデントはSpaceでおこなう
   (setq tab-width 4)
   (setq c-basic-offset tab-width)
   (linum-mode t)
   (setq truncate-lines t)

   ;; 自動改行（auto-new-line）と
   ;; 連続する空白の一括削除（hungry-delete）を
   ;; 有効にする
   ;;(c-toggle-auto-hungry-state 1)

   ;; CamelCaseの語でも単語単位に分解して編集する
   ;; GtkWindow         => Gtk Window
   ;; EmacsFrameClass   => Emacs Frame Class
   ;; NSGraphicsContext => NS Graphics Context
   (subword-mode 1)
   (define-key c-mode-base-map [backspace] 'backward-delete-char)
)

;; C style
(add-hook 'c-mode-common-hook 'my-c-mode-hook )

;; C++ style
(add-hook 'c++-mode-common-hook 'my-cpp-mode-hook)

;; helm-gtags を hook
(add-hook 'c-mode-common-hook 'helm-gtags-mode)

(require 'flycheck)
 
(global-flycheck-mode)
 
(define-key global-map (kbd "\C-cn") 'flycheck-next-error)
(define-key global-map (kbd "\C-cp") 'flycheck-previous-error)
(define-key global-map (kbd "\C-cd") 'flycheck-list-errors)


;; (defmacro flycheck-define-clike-checker (name command modes)
;;       `(flycheck-define-checker ,(intern (format "%s" name))
;;          ,(format "A %s checker using %s" name (car command))
;;          :command (,@command source-inplace)
;;          :error-patterns
;;          ((warning line-start (file-name) ":" line ":" column ": 警告:" (message) line-end)
;;           (error line-start (file-name) ":" line ":" column ": エラー:" (message) line-end))
;;          :modes ',modes))

    
;;     (flycheck-define-clike-checker c-gcc-ja
;;                                    ("gcc" "-fsyntax-only" "-Wall" "-Wextra")
;;                                    c-mode)
;;     (add-to-list 'flycheck-checkers 'c-gcc-ja)
    
;;     (flycheck-define-clike-checker c++-g++-ja
;;                                    ("g++" "-fsyntax-only" "-Wall" "-Wextra" "-std=c++11")
;;                                    c++-mode)
;;     (add-to-list 'flycheck-checkers 'c++-g++-ja)
    

;; flymake の設定
;; http://moimoitei.blogspot.com/2010/05/flymake-in-emacs.html
;;-----------------
;;Makefile で以下を追加する
;;PHONY: check-syntax
;;check-syntax:
;;    $(CC) -Wall -Wextra -pedantic -fsyntax-only $(CHK_SOURCES)
;;-----------------
;(require 'flymake)
