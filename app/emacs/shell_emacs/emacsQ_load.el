; -l "~/config_github/app/emacs/shell_emacs/shell_command_emacs.org" 
; -l "(lisp-file실행할파일)" man emacs에서 밝힘
;; emacs -Q -nw --eval '(set-input-method "korean-hangul")' $@
;; emacs -Q -nw -l "~/config_github/app/emacs/shell_emacs/shell_command_emacs.org" $@

;;설계도
;1.OS의 출발;~/.bin/start == ~/config_github/start.sh와 동일할 것을 맞춤 (find-file "~/.bin/start")
;2.emacsQ go;~/.bin/emacsQ == 
;3.emacsQ load  <즉, 이파일>


(progn
  ;; addtion of shortcut
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C-x C-j jump-dired
    ;; (find-file-other-window "~/config_github/app/emacs/org_mode_study/agenda_view_org.org")
  (global-set-key (kbd "C-c a") 'org-agenda)
  (global-set-key (kbd "C-c l") 'org-store-link) ;; app/emacs/org_id.org ID 참조할 것.
              ;; [[id:387de902-86b8-495a-8b70-8dd2cffc5edf][Customize Group: Org ID * 여기에서 수정함]]
(setq org-agenda-window-setup (quote current-window)) ;;open agenda in current window
;; C-x 4 C-j 가 유용
(define-key global-map (kbd "C-x 4 C-j") 'dired-jump-other-window)
;(define-key global-map (kbd "C-x C-j") 'dired-jump-other-window)
;;  (dired-jump-other-window) 0w   이후 q 또는 C-x 4 0 로 사용을 중단함.
;; C-g  g grep-mac-chrome
(setq org-startup-folded 'showeverything) ;;./showeverything.org:7:(setq org-startup-folded 'showeverything)
(setq org-confirm-elisp-link-function nil)
(setq org-return-follows-link t) ; [[file:external_link.org]] ; 참조 (start-process program nil program)
(setq org-confirm-shell-link-function nil) ; emacs/start_process_shell_command.org
(setq org-link-search-must-match-exact-headline nil)  ;; 단어검색이 가능해진다. : [\[ file: 파일명::검색어]]


;; (org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))
(fset 'yes-or-no-p 'y-or-n-p) ;; 발견! 간단히 한 글자입력으로 전환하는 명령!!!
(global-set-key (kbd "<f5>") 'revert-buffer)
;; (find-file (expand-file-name "~/config_github/app/emacs/org_babel_load_file.org"))
;; (find-file (expand-file-name "~/config_github/app/emacs/shell_emacs/emacsQ_load.el"))
(setq org-startup-indented t)
(global-set-key (kbd "C-c a") 'org-agenda)
(setq org-agenda-window-setup (quote current-window)) ;;open agenda in current window

(setq org-agenda-files '(
			 "~/Music/mpv_files/mpv_files_list.org"
			 ""
			 "~/config_github/app/emacs/03diary2020.org"
    ))
;;;;;;;;;; esc_esc_num ;;;;;;;;;;;;;;;;
(defun esc_esc_1 ()
(interactive)
(find-file "/home/thinkpad/config_github/app/emacs/03diary2020.org")
)
(global-set-key (kbd "ESC ESC 1")
'esc_esc_1)

(defun esc_esc_2 ()
(interactive)
(find-file "~/Desktop/pdf_list_of_desktop.org")
)
(global-set-key (kbd "ESC ESC 2")
'esc_esc_2)

(defun esc_esc_3 ()
(interactive)
(find-file "/home/thinkpad/config_github/great_books/vitruvius/de_architectura/de_architectura_liber01_03.org")
)
(global-set-key (kbd "ESC ESC 3")
'esc_esc_3)


(defun esc_esc_4 ()
(interactive)
(find-file "~/Music/_1_bbg_playlist.org")
)
(global-set-key (kbd "ESC ESC 4")
'esc_esc_4)

(defun esc_esc_5 ()
(interactive)
(find-file "~/config_github/app/emacs/esc_esc_num.org")
)
(global-set-key (kbd "ESC ESC 5")
'esc_esc_5)
;;;;;;;;;; esc_esc_num ;;;;;;;;;;;;;;;;

(global-unset-key (kbd "C-z")) ;; C-z 3번 연속을 suspend-frame으로 두는 법을 대안으로 살릴 수 있음.
(global-unset-key (kbd "C-x C-z"))
(global-unset-key (kbd "C-S-b"))


(global-set-key (kbd "C-S-h") 'delete-backward-char) ;한글등입력에서 발생하는 오타를 제거하는 연습
(global-set-key (kbd "C-S-d") 'delete-backward-char)
(global-set-key (kbd "C-D") 'delete-backward-char)
(global-set-key (kbd "C-d") 'delete-char)

(global-set-key (kbd "M-S-d") 'backward-kill-word)
(global-set-key (kbd "M-D") 'backward-kill-word)
(global-set-key (kbd "C-S-k") '(delete-region (point) (line-end-position 1)))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq org-inhibit-startup-visibility-stuff t) ;; Global #+STARTUP: showeverything

  (org-mode) ;; 아젠다뷰를 넣을 것을 고려할 것.
  ;;(message "hi")
  ;(progn
;;  (dired-other-window "~/config_github/shell_script/")(dired-hide-details-mode)
  (dired "~/config_github/app/stumpwm/LAYOUT")(dired-hide-details-mode)
  (load "dired-x")
  ;(bookmark-bmenu-list)
  (find-file-other-frame "~/config_github/app/emacs/")(dired-hide-details-mode)
;;  (find-file-other-frame "~/config_github/app/")(dired-hide-details-mode)
;;  (find-file-other-frame "~/config_github/language_computer/")(dired-hide-details-mode)
  (find-file-other-frame "~/config_github/great_books/")(dired-hide-details-mode)
;;  (find-file-other-frame "~/Music/")(dired-hide-details-mode)
;;  (find-file-other-frame "~/config_github/great_books/")(dired-hide-details-mode)
;;  (find-file-other-frame "~/config_github/great_books/_achieve_agenda/")(dired-hide-details-mode)
  ;(dired-other-frame "~
  ;(make-frame)
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
