;;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-
;;; init-web.el --- 

;;; Commentary:

;; 

;;; Code:


;;; -------------------------------------------------------------------
;;;; web-mode
;;; -------------------------------------------------------------------
(use-package web-mode
  :ensure t
  :mode  (("\\.html?\\'" . web-mode)
          ("\\.phtml\\'" . web-mode)
          ("\\.tpl\\.php\\'" . web-mode)
          ("\\.[agj]sp\\'" . web-mode)
          ("\\.as[cp]x\\'" . web-mode)
          ("\\.erb\\'" . web-mode)
          ("\\.mustache\\'" . web-mode)
          ("\\.djhtml\\'" . web-mode)
          )
  :config
  (progn
    (setq web-mode-markup-indent-offset 2)  ; HTML offset indentation
    (setq web-mode-css-indent-offset 2)     ; CSS offset indentation
    (setq web-mode-code-indent-offset 4)    ; Script offset indentation (for JavaScript, Java, PHP, etc.)
    
    )
  )

;;; -------------------------------------------------------------------
;;;; js2-mode
;;; -------------------------------------------------------------------

(use-package js2-mode
  :ensure t
  :defer t
  :mode (("\\.js$" . js2-mode)
         )
  :config
  (progn
    ;; js2-mode の設定値は setq ではなく custom-set-variables を使うこと
    ;; setq では設定した値が反映されなかった
    (custom-set-variables '(js2-basic-offset 2))  ; indent

    (add-hook 'js2-mode-hook 'tern-mode)
    (add-hook 'js2-mode-hook 'flycheck-mode)

    (add-hook 'before-save-hook 'delete-trailing-whitespace)
    )
  )

;;; -------------------------------------------------------------------
;;;; tern-mode
;;; -------------------------------------------------------------------

;; npm install tern -g でインストールしておくこと
(use-package tern
  :ensure t
  :defer t
  :if (executable-find "tern")
  :config
  (progn
    (use-package tern-auto-complete
      :ensure t
      :config
      (tern-ac-setup)
      )
    )
  )

;;; -------------------------------------------------------------------
;;;; flycheck
;;; -------------------------------------------------------------------
(use-package flycheck
  :ensure t
  :defer t
  :commands global-flycheck-mode
  :config
  (progn
    ;; Flycheck JSCS
    (flycheck-def-config-file-var flycheck-jscs javascript-jscs ".jscs.json"
      :safe #'stringp)
    (flycheck-define-checker javascript-jscs
      "A JavaScript code style checker. See URL `https://github.com/mdevils/node-jscs'."
      :command ("jscs" "--reporter" "checkstyle"
                (config-file "--config" flycheck-jscs)
                source)
      :error-parser flycheck-parse-checkstyle
      :modes (js-mode js2-mode js3-mode)
      :next-checkers (javascript-jshint))
    
    (add-to-list 'flycheck-checkers 'javascript-jscs)
    
    (defun jscs-enable () (interactive)
      (add-to-list 'flycheck-checkers 'javascript-jscs))
    
    (defun jscs-disable () (interactive)
      (setq flycheck-checkers (remove 'javascript-jscs flycheck-checkers)))
      )
  )


