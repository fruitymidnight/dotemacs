; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-
;; ----------------------------------------------------------------------
;; @ yatex
;; http://oku.edu.mie-u.ac.jp/~okumura/texwiki/?YaTeX

(setq auto-mode-alist
      (append '(("\\.tex$" . yatex-mode)
                ("\\.ltx$" . yatex-mode)
                ("\\.cls$" . yatex-mode)
                ("\\.sty$" . yatex-mode)
                ("\\.clo$" . yatex-mode)
                ("\\.bbl$" . yatex-mode)) auto-mode-alist))
;;
;; YaTeX
;;

(lazyload (yatex-mode) "yatex"
          
          ;; key-bind
          (define-key YaTeX-mode-map (kbd "C-c s") 'skim-forward-search)


          (setq YaTeX-inhibit-prefix-letter t)
          (setq YaTeX-kanji-code nil)
          (setq YaTeX-use-LaTeX2e t)
          (setq YaTeX-use-AMS-LaTeX t)
          (setq YaTeX-dvi2-command-ext-alist
                '(("Preview\\|TeXShop\\|TeXworks\\|Skim\\|mupdf\\|xpdf\\|Firefox\\|Adobe" . ".pdf")))
          (setq tex-command "/usr/texbin/ptex2pdf -l -ot '-synctex=1'")
                                        ;(setq tex-command "/usr/texbin/ptex2pdf -l -u -ot '-synctex=1'")
                                        ;(setq tex-command "/usr/texbin/pdflatex -synctex=1")
                                        ;(setq tex-command "/usr/texbin/lualatex -synctex=1")
                                        ;(setq tex-command "/usr/texbin/luajitlatex -synctex=1")
                                        ;(setq tex-command "/usr/texbin/xelatex -synctex=1")
                                        ;(setq tex-command "/usr/texbin/latexmk")
                                        ;(setq tex-command "/usr/texbin/latexmk -e '$latex=q/platex %O -synctex=1 %S/' -e '$bibtex=q/pbibtex %O %B/' -e '$makeindex=q/mendex %O -o %D %S/' -e '$dvipdf=q/dvipdfmx %O -o %D %S/' -norc -gg -pdfdvi")
                                        ;(setq tex-command "/usr/texbin/latexmk -e '$latex=q/platex %O -synctex=1 %S/' -e '$bibtex=q/pbibtex %O %B/' -e '$makeindex=q/mendex %O -o %D %S/' -e '$dvips=q/dvips %O -z -f %S | convbkmk -g > %D/' -e '$ps2pdf=q/ps2pdf %O %S %D/' -norc -gg -pdfps")
                                        ;(setq tex-command "/usr/texbin/latexmk -e '$latex=q/uplatex %O -synctex=1 %S/' -e '$bibtex=q/upbibtex %O %B/' -e '$makeindex=q/mendex %O -o %D %S/' -e '$dvipdf=q/dvipdfmx %O -o %D %S/' -norc -gg -pdfdvi")
                                        ;(setq tex-command "/usr/texbin/latexmk -e '$latex=q/uplatex %O -synctex=1 %S/' -e '$bibtex=q/upbibtex %O %B/' -e '$makeindex=q/mendex %O -o %D %S/' -e '$dvips=q/dvips %O -z -f %S | convbkmk -u > %D/' -e '$ps2pdf=q/ps2pdf %O %S %D/' -norc -gg -pdfps")
                                        ;(setq tex-command "/usr/texbin/latexmk -e '$pdflatex=q/pdflatex %O -synctex=1 %S/' -e '$bibtex=q/bibtex %O %B/' -e '$makeindex=q/makeindex %O -o %D %S/' -norc -gg -pdf")
                                        ;(setq tex-command "/usr/texbin/latexmk -e '$pdflatex=q/lualatex %O -synctex=1 %S/' -e '$bibtex=q/bibtexu %O %B/' -e '$makeindex=q/texindy %O -o %D %S/' -norc -gg -lualatex")
                                        ;(setq tex-command "/usr/texbin/latexmk -e '$pdflatex=q/luajitlatex %O -synctex=1 %S/' -e '$bibtex=q/bibtexu %O %B/' -e '$makeindex=q/texindy %O -o %D %S/' -norc -gg -lualatex")
                                        ;(setq tex-command "/usr/texbin/latexmk -e '$pdflatex=q/xelatex %O -synctex=1 %S/' -e '$bibtex=q/bibtexu %O %B/' -e '$makeindex=q/texindy %O -o %D %S/' -norc -gg -xelatex")
          (setq bibtex-command (cond ((string-match "uplatex\\|-u" tex-command) "/usr/texbin/upbibtex")
                                     ((string-match "platex" tex-command) "/usr/texbin/pbibtex")
                                     ((string-match "lualatex\\|luajitlatex\\|xelatex" tex-command) "/usr/texbin/bibtexu")
                                     ((string-match "pdflatex\\|latex" tex-command) "/usr/texbin/bibtex")
                                     (t "/usr/texbin/pbibtex")))
          (setq makeindex-command (cond ((string-match "uplatex\\|-u" tex-command) "/usr/texbin/mendex")
                                        ((string-match "platex" tex-command) "/usr/texbin/mendex")
                                        ((string-match "lualatex\\|luajitlatex\\|xelatex" tex-command) "/usr/texbin/texindy")
                                        ((string-match "pdflatex\\|latex" tex-command) "/usr/texbin/makeindex")
                                        (t "/usr/texbin/mendex")))
          (setq dvi2-command "/usr/bin/open -a Preview")
                                        ;(setq dvi2-command "/usr/bin/open -a Skim")
                                        ;(setq dvi2-command "/usr/bin/open -a TeXShop")
                                        ;(setq dvi2-command "/usr/bin/open -a TeXworks")
                                        ;(setq dvi2-command "/usr/bin/open -a Firefox")
          (setq dviprint-command-format "/usr/bin/open -a \"Adobe Reader\" `echo %s | gsed -e \"s/\\.[^.]*$/\\.pdf/\"`")

          (defun skim-forward-search ()
            (interactive)
            (progn
              (process-kill-without-query
               (start-process  
                "displayline"
                nil
                "/Applications/Skim.app/Contents/SharedSupport/displayline"
                (number-to-string (save-restriction
                                    (widen)
                                    (count-lines (point-min) (point))))
                (expand-file-name
                 (concat (file-name-sans-extension (or YaTeX-parent-file
                                                       (save-excursion
                                                         (YaTeX-visit-main t)
                                                         buffer-file-name)))
                         ".pdf"))
                buffer-file-name))))



          (auto-fill-mode -1)

          ;;
          ;; RefTeX with YaTeX
          ;;
          (reftex-mode 1)
          (define-key reftex-mode-map (concat YaTeX-prefix ">") 'YaTeX-comment-region)
          (define-key reftex-mode-map (concat YaTeX-prefix "<") 'YaTeX-uncomment-region)


          )


