; -l "~/config_github/app/emacs/shell_emacs/shell_command_emacs.org" 
; -l "(lisp-file실행할파일)" man emacs에서 밝힘
;; emacs -Q -nw --eval '(set-input-method "korean-hangul")' $@
;; emacs -Q -nw -l "~/config_github/app/emacs/shell_emacs/shell_command_emacs.org" $@

;;설계도
;1.OS의 출발;~/.bin/start == ~/config_github/start.sh와 동일할 것을 맞춤 (find-file "~/.bin/start")
;2.emacsQ go;~/.bin/emacsQ == 
;3.emacsQ load  <즉, 이파일>


(progn
  (org-mode) ;; 아젠다뷰를 넣을 것을 고려할 것.
  ;;(message "hi")
  ;(progn
  (dired-other-window "~/config_github/shell_script/")(dired-hide-details-mode)
  (bookmark-bmenu-list)
)

;; org-src possible by below

;(require 'ob-sh)
;(org-babel-do-load-languages
; 'org-babel-load-languages '((sh . t)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default-input-method "korean-hangul")
; (set-input-method "korean-hangul") ;; 바로 무력화됨 ;; 영어로 다시 반환함  
; (toggle-input-method)              ;; 바로 무력화됨

 '(org-babel-load-languages
   (quote
    ((emacs-lisp . t)
     (shell . t)
     (org . t)
     (python . t)
     (ruby . t)
     (rust . t)
     (C . t)))))


;(require 'lsp-rust)
(require 'lsp-mode)
;;(use-package lsp-mode
 ; :hook (XXX-mode . lsp-deferred)
 ; :commands (lsp lsp-deferred))



;; addtion of shortcut
;; C-x C-j jump-dired
    ;; (find-file-other-window "~/config_github/app/emacs/org_mode_study/agenda_view_org.org")
(global-set-key (kbd "C-c a") 'org-agenda)
(setq org-agenda-window-setup (quote current-window)) ;;open agenda in current window
;; C-x 4 C-j 가 유용
(define-key global-map (kbd "C-x 4 C-j") 'dired-jump-other-window)
(define-key global-map (kbd "C-x C-j") 'dired-jump-other-window)
;;  (dired-jump-other-window) 0w   이후 q 또는 C-x 4 0 로 사용을 중단함.
                                   ;; C-g  g grep-mac-chrome

(setq org-inhibit-startup-visibility-stuff t) ;; Global #+STARTUP: showeverything

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t))

;; 인스톨할 것. use-package
;;(package-initialize)
;;;; 설치되어 있었음 (package-install "use-package")

;;[[file:~/config_github/app/emacs/melpa_package.org]]
(add-to-list 'load-path "~/.emacs.d/emacsQ_use_package/")
(package-initialize)
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  ;;  (add-to-list 'load-path "<path where use-package is installed>")

  (require 'use-package))

(use-package greader)
;(use-package greek-polytonic)
(use-package grab-x-link
;:config
;; (grab-x-link-chrome-insert-org-link)
;(grab-x-link-chromium-insert-org-link)
)

(use-package command-log-mode
  :config 
  (clm/open-command-log-buffer)
	;(require 'command-log-mode)
	;(add-hook 'LaTeX-mode-hook 'command-log-mode)
	;To see the log buffer, call M-x clm/open-command-log-buffer.
  )
(use-package xclip
            :config
            (xclip-mode t) ; StumpWm에서 파일의 링크복사를 크로뮴에서 가능하게 했으로 C-t C-t로 창을 앞뒤로 변경하면서 쉽게 수집을 진행할 수 있을 것이다.
					; 조건 Copy-md파일 변경했음 리눅스가능함.
					; ~/.config/chromium/Default/Extensions/fkeaekngjflipcockcnpobkpbbfbhmdn/2.4.3_0/background/markdown.js
	    ; ~/.config/BraveSoftware/Brave-Browser/Default/Extensions/fkeaekngjflipcockcnpobkpbbfbhmdn/2.4.3_0/background/markdown.js
;[Copy as Markdown | CRX Inspector](chrome-extension://lmlpbkpknjcnfabomjkecmkigcphgomk/inspect.html?fkeaekngjflipcockcnpobkpbbfbhmdn)



	     )

;; 나중에 use-package의 사용파일 분리를 고려할 것.emacs_package폴더를 고려해서 그곳에 두는 것이 낫다.
(use-package magit
  ;;:init
  ;;(setq foo-variable t)
  ;;:config
)

;; make emacs always use its own browser for opening URL links
;; 일단 중단함 크롬의 북마크를 열기위해서
;; (setq browse-url-browser-function 'eww-browse-url)
;; app/emacs/eww.org M-eww


;; 러스트를 다운로드하였으므로 활용하기 위해 설치함
;; - for EMACS - cargo ob-rust rustic rust-mode install
(require 'cargo)
(require 'rustic)
(require 'rust-mode)



;(use-package google-translate ;; /app/google-translate/readme.org
;(require 'google-translate) ;; $ yay translate-shell # trans -R

(defun google-translate-ljp ()
"일단 간단히 실행하고 나중에 추가할 것을 추가한다.
- 다른 버퍼나 파일로 전송하는 것을 연구할 것
- ;(find-file ~/config_github/app/google-translate/proj_making_el/collect_tesing_defun.el)
"
  (interactive)
  (if mark-active
      (progn (setq
	    selection (buffer-substring-no-properties (region-beginning) (region-end))
	    traned-txt (substring (shell-command-to-string (concat "trans -no-autocorrect -b -d -s en -t ko+la '" selection "'")) 0 -1 )
	)
	     ;(message (concat traned-txt "=" selection))
	     (message (concat selection "=" traned-txt))
	)))
(global-set-key "\C-ct" 'google-translate-ljp)
;;(use-package ' 클립보드 자동완성, 
(use-package neotree 
  :config
  (neotree-dir "~/config_github/shell_script/")
  (neotree-show)
)

(use-package goldendict
  :config
  (global-set-key (kbd "C-x C-d") 'goldendict-dwim)
;;If invoke with [C-u] prefix, then it will raise the main window.
)
;;
(use-package visible-mark
)

(use-package paredit
)

;; Emacs as a C/C++ Editor/IDE (Part I) https://www.youtube.com/watch?v=HTUE03LnaXA
; (package-initialize)
 ; (package-refresh-contents)
(use-package yasnippet
	:ensure t
        :config
	(use-package yasnippet-snippets
		 :ensure t)
	;;(yas-reload-all))
	(yas-global-mode 1))
(use-package company)

(use-package auto-complete)
(use-package auto-complete-config)
(ac-config-default)


(use-package zeal-at-point) ;; 잘 작동하지는 않음

;; (use-package iedit-mode)
(define-key global-map (kbd "C-;") 'iedit-mode)

(use-package simpleclip
:config
(simpleclip-mode 1)
)

;;(global-hl-line-mode)
;;(set-face-background hl-line-face "gray13") ;; https://duckduckgo.com/?q=set+hl-line-mode+color&atb=v92-3_f&ia=qa
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun dired-do-eshell-command (command)
  "Run an Eshell command on the marked files."
  (interactive "sEshell command: ")
  (let ((files (dired-get-marked-files t)))
    (eshell-command
     (format "%s %s" command (mapconcat #'identity files " ")))))
;; use M-x dired-do-eshell-command 리턴키 grep -nH --color {{검색어패턴} 리턴}
;; grep marked files in the dired mode https://emacs.stackexchange.com/questions/30855/how-to-grep-marked-files-in-the-dired-mode-of-emacs/30866
;; 매우 유용하므로 연구가 필요하다. my_fun_함수명으로 변경하여 일괄관리도 고려할 것. 또한 사이트를 자주 보고 패턴을 익힐 것.
