; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-
;;------------------------------------------------------------------------------
;; @ migemo
;; ローマ字で日本語をインクリメンタルサーチ

(cond
 (darwin-p
  (when (require 'migemo nil t)
    ;; cmigemoを使う
    (setq migemo-command "/usr/local/bin/cmigemo")
    ;; Migemoのコマンドラインオプション
    (setq migemo-options '("-q" "--emacs" "-i" "\a"))
    ;; Migemo辞書の場所
    (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
    ;; cmigemoで必須の設定
    (setq migemo-user-dictionary nil)
    (setq migemo-regex-dictionary nil)
    ;; キャッシュの設定
    (setq migemo-use-pattern-alist t)
    (setq migemo-use-frequent-pattern-alist t)
    (setq migemo-pattern-alist-length 1000)
    (setq migemo-coding-system 'utf-8-unix)
    ;; Migemoを起動する
    (migemo-init))

))
