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
     (C . t)))))


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



(use-package command-log-mode
  :config 
  (clm/open-command-log-buffer)
	;(require 'command-log-mode)
	;(add-hook 'LaTeX-mode-hook 'command-log-mode)
	;To see the log buffer, call M-x clm/open-command-log-buffer.
  )

;; 나중에 use-package의 사용파일 분리를 고려할 것.emacs_package폴더를 고려해서 그곳에 두는 것이 낫다.
(use-package magit
  ;;:init
  ;;(setq foo-variable t)
  ;;:config
)


(use-package google-translate ;; /app/google-translate/readme.org
;(require 'google-translate) ;; $ yay translate-shell # trans -R
  ;;:init
  ;;(setq foo-variable t)
    :config
;(require 'google-translate-default-ui)
;(global-set-key "\C-ct" 'google-translate-at-point)
;(global-set-key "\C-cT" 'google-translate-query-translate)

;(setq google-translate-default-target-language  "latin+ko"
; google-translate-default-source-language "en")
;(setq google-translate-default-target-language  nil
; google-translate-default-source-language "en")

(require 'google-translate-smooth-ui)
(global-set-key "\C-ct" 'google-translate-smooth-translate)
(setq google-translate-translation-directions-alist
      '(("en" . "ko") ("en" . "la") 
	("ko" . "en") ("ko" . "la") ("ko" . "el")  
	 ("la" . "ko")  ("la" . "en")
	("en" . "el") ("en" . "he")))

)


;;(use-package ' 클립보드 자동완성, 
(use-package neotree 
  :config
  (neotree-dir "~/config_github/shell_script/")
  (neotree-show)
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

(global-hl-line-mode)
(set-face-background hl-line-face "gray13") ;; https://duckduckgo.com/?q=set+hl-line-mode+color&atb=v92-3_f&ia=qa
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
