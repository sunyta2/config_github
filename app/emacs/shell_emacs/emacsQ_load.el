; -l "~/config_github/app/emacs/shell_emacs/shell_command_emacs.org" 
; -l "(lisp-file실행할파일)" man emacs에서 밝힘
;; emacs -Q -nw --eval '(set-input-method "korean-hangul")' $@
;; emacs -Q -nw -l "~/config_github/app/emacs/shell_emacs/shell_command_emacs.org" $@

;;설계도
;1.OS의 출발;~/.bin/start == ~/config_github/start.sh와 동일할 것을 맞춤 (find-file "~/.bin/start")
;2.emacsQ go;~/.bin/emacsQ == 
;3.emacsQ load  <즉, 이파일>


(add-to-list 'load-path "/home/thinkpad/.emacs.d/elpa/")
(add-to-list 'load-path "~/.emacs.d/emacsQ_use_package/")
(package-initialize) ;; 목록의 순서즉 입력의 순서가 매우 중요함 지소선후 즉근도의인가!

 (setq WM
    (substring 
      (shell-command-to-string " wmctrl -m | head -n1 | cut -f 2 -d : | sed -e 's/^[[:space:]]*//' ")
    0 -1)
 )
;;   (require 'exwm)
;;   (require 'exwm-config)
;;   (require 'exwm-systemtray)
;;   (exwm-systemtray-enable)
;;   (exwm-config-default)


;; (progn
;; ;;; add exwm in below with file:/usr/share/xsessions/emacs.desktop
;; (cond ;; 잘 작동 wm조건문으로 기록 /app/emacs/if_cond_while_when_case_in_elisp.org
;;  ((cl-equalp WM "ExWm")    ;(message "this is Exwm")
;;   (require 'exwm)
;;   (require 'exwm-config)
;;   (require 'exwm-systemtray)
;;   (exwm-systemtray-enable)
;;   (exwm-config-default)
;;   )
;;      ( (cl-equalp WM "stumpwm") (message "good") (sleep-for 3) (message "this is stumpwm") )
;;      ( t (message "this is else") )
;; )

;;   (use-package exwm
;;     :ensure t
;;     :config
;;     (require 'exwm-config)
;;     (exwm-config-default))
;; ;;; added exwm in above
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
(global-set-key (kbd "C-x C-o") 'other-window) ;; stumpwm통일된 실수없는 이동을 위한 선택!
;C-x C-S-o.(delete-blank-lines) 로 변경함
(global-set-key (kbd "C-x C-S-o") 'delete-blank-lines) ;; stumpwm통일된 실수없는 이동을 위한 선택!

(setq org-agenda-window-setup (quote current-window)) ;;open agenda in current window

(setq org-agenda-files '(
			 "~/Music/mpv_files/mpv_files_list.org"
			 ""
			 "~/config_github/app/emacs/03diary2020.org"
                        ))



(global-unset-key (kbd "C-z")) ;; C-z 3번 연속을 suspend-frame으로 두는 법을 대안으로 살릴 수 있음.
(global-unset-key (kbd "C-t")) ;; C-z 3번 연속을 suspend-frame으로 두는 법을 대안으로 살릴 수 있음.
(global-unset-key (kbd "C-x C-z"))
(global-unset-key (kbd "C-S-b"))
(setq org-src-window-setup 'current-window)

(global-set-key (kbd "C-S-h") 'delete-backward-char) ;한글등입력에서 발생하는 오타를 제거하는 연습
(global-set-key (kbd "C-S-d") 'delete-backward-char)
(global-set-key (kbd "C-D") 'delete-backward-char)
(global-set-key (kbd "C-d") 'delete-char)

;;;;; add-hook ;;;;;;
(setq org-timer-display 'both)
(timeclock-mode-line-display t)
(setq org-ellipsis "   ¬")
;(timeclock-mode-line-display t)
;(org-timer-set-mode-line 
;"off"
;)
;"on"
;"paused"


(add-hook 'dired-mode-hook (lambda () (dired-hide-details-mode t))) ;; 간이한 파일표시가 속도를 높일 것이다.dired.org

(add-hook 'org-mode-hook (lambda ()
;(global-set-key (kbd "C-M-x") 'eval-defun) ;; add-hook으로 변경해서 다른 모드에서 쓰는 기본기능충돌을 방지할 것.
                      (seethru 90)             (local-set-key (kbd "C-M-x") 'eval-defun) ;; add-hook으로 변경해서 다른 모드에서 쓰는 기본기능충돌을 방지할 것.
				   ))

;;;;;; add-hook ;;;;;

(global-set-key (kbd "M-S-d") 'backward-kill-word)
(global-set-key (kbd "M-D") 'backward-kill-word)
(global-set-key (kbd "C-S-k") '(delete-region (point) (line-end-position 1)))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(setq show-paren-style "mixed")
(setq show-paren-style 'expression) ;;왜 진작에 등록않았을까?!
(show-paren-mode 1) ;; 일단 잘 코딩된 문장을 읽는 것에 유용하게 읽기에 적용하고 나중에 편집법을 연구하여 연마한다.

(setq indicate-buffer-boundaries 'right)
(fringe-mode '(0))
;(scroll-bar-mode  1)
(scroll-bar-mode 0)
(tool-bar-mode 0)
(menu-bar-mode 0)
(column-number-mode 1)

(setq display-time-day-and-date t) ;; mode line 날짜 표시가능해짐
(display-time-mode 1)
(setq battery-mode-line-format " [%L→%t %b%p%%]")
(display-battery-mode 1)

(setq org-inhibit-startup-visibility-stuff t) ;; Global #+STARTUP: showeverything

  (org-mode) ;; 아젠다뷰를 넣을 것을 고려할 것.
  ;;(message "hi")
  ;(progn
;;  (dired-other-window "~/config_github/shell_script/")(dired-hide-details-mode)
  (dired "~/config_github/app/emacs/")(dired-hide-details-mode)
  (load "dired-x")
  ;(bookmark-bmenu-list)
;;  (find-file-other-frame )(dired-hide-details-mode)
;;  (find-file-other-frame "~/config_github/app/")(dired-hide-details-mode)
;;  (find-file-other-frame "~/config_github/language_computer/")(dired-hide-details-mode)
;;  (find-file-other-frame "~/config_github/great_books/")(dired-hide-details-mode)
;;  (find-file-other-frame "~/Music/")(dired-hide-details-mode)
;;  (find-file-other-frame "~/config_github/great_books/")(dired-hide-details-mode)
;;  (find-file-other-frame "~/config_github/great_books/_achieve_agenda/")(dired-hide-details-mode)
  ;(dired-other-frame "~
  ;(make-frame)


(setq default-input-method "korean-hangul")

(setq shell-command-dont-erase-buffer 'beg-last-out) ;;  *Shell Command Output* 버퍼를 일정하게 유지해야 여러개의 버퍼가 열리는 것을 방지함. file:../../app/emacs/shell_command_output_buffer.org
(setq org-babel-load-languages '((emacs-lisp . t)
                                 (shell . t)
                                 (org . t)
                                 (python . t)
                                 (ruby . t)
                                 (rust . t)
                                 (C . t)
                                )
)

;<문제는 절망감을 주지만,,,> 우회 다른 방식 다른 발견! 메뉴얼 좋은탐구습관, 개념을 명확확장 간략정리, 원문제도 결국 해결함
;    - Evaluate this sh code block on your system? (y or n) y
;    - org-babel-execute-src-block: No org-babel-execute function for sh!
;            → (org-babel-do-load-languages 'org-babel-load-languages)
;              → (info "(org) Languages") emacs/src_block.org
(org-babel-do-load-languages ;; 멋진 해결을 발견함 → (info "(org) Languages")
      'org-babel-load-languages
      '((emacs-lisp . t)
        (shell . t)
        (org . t)
        (python . t)
        (ruby . t)
        (rust . t)
        (C . t)
       ))


 ;;    (require 'color) ;; src_color_background.org
  ;;   (set-face-attribute 'org-block nil :background
    ;;                     (color-darken-name
      ;;                    (face-attribute 'default :background) 3))

;;     (setq org-src-block-faces '(("emacs-lisp" (:background "#EEE2FF"))
  ;;                               ("python" (:background "#E5FFB8"))))


)

;; org-src possible by below

;(require 'ob-sh)
;(org-babel-do-load-languages
; 'org-babel-load-languages '((sh . t)))
;(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
; '(default-input-method "korean-hangul")
; (set-input-method "korean-hangul") ;; 바로 무력화됨 ;; 영어로 다시 반환함  
; (toggle-input-method)              ;; 바로 무력화됨

; '(org-babel-load-languages
;   (quote
;    ((emacs-lisp . t)
;     (shell . t)
;     (org . t)
;     (python . t)
;     (ruby . t)
;     (rust . t)
;     (C . t)))))


;(require 'lsp-rust)
;;(require 'lsp-mode) ;; 없다고 나와서 일단 중단시킴
;;(use-package lsp-mode
 ; :hook (XXX-mode . lsp-deferred)
 ; :commands (lsp lsp-deferred))




;; 인스톨할 것. use-package
;;(package-initialize)
;;;; 설치되어 있었음 (package-install "use-package")

;;[[file:~/config_github/app/emacs/melpa_package.org]]



(use-package greader)
;(use-package greek-polytonic)
(use-package grab-x-link
;:config
;; (grab-x-link-chrome-insert-org-link)
;(grab-x-link-chromium-insert-org-link)
)

(use-package command-log-mode
  :config 
  (clm/open-command-log-buffer) ; 놀라움, app/emacs/command-log.org
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


;;순서의 문제라고 생각해서 아래로 옮김.

     (require 'color) ;; src_color_background.org
     (set-face-attribute 'org-block nil :background
                         (color-darken-name
                          (face-attribute 'default :background) 3))

        ; 문맥을 추론하도록 구분의 color을 두라! emacs_is_great.org에 정리할 것
   ; #+RESULTS: 결과를 줄에 맞도록 띄울 것 ← 보기가 간략해야 생각을 집중하기 좋다.
   (setq org-src-block-faces '(;서열적으로 윗첫문장이 등록되면 아래등록은 무시됨
                               ("emacs-lisp" (:background "#7FE2BB")) ;; 수정1번한 연한 청록배경임-약간 진하게 잘어울림 org
                               ("emacs-lisp" (:background "#AAFFFF")) ;; 연한 하늘색배경임
                               ("emacs-lisp" (:background "gray9"))
                               ("elisp" (:background "#7FE2DA")) ;; 수정2번한 연한 청록배경임
                               ("elisp" (:background "#AAFFFF")) ;; 연한 하늘색배경임
                               ;("elisp" (:background "#FFFF7F")) ;; 연한 노랑으로 좋은배경임
                               ("elisp" (:background "gray18"))
                               ("sh" (:background "#AAFFFF")) ;; 연한 하늘색배경임
                               ("sh" (:background "midnight blue"))
                               ("python" (:background "OliveDrab1"))
                               ("C" (:background "Darkolivegreen1"))
                                           ;("rust" (:background "LightBlue"))
                                           ;("rust" (:background "tan1"))
                               ("rust" (:background "DarkGoldenrod1"))
                                           ;("org" (:background "gray6"))
                                           ;("org" (:background "yellow3"))
                               ("org" (:background "#FFFF7F")) ;; 연한 초록배경임
                               ("org" (:background "#FFFF7F")) ;; 연한 노랑으로 좋은배경임
                               ("org" (:background "#AAFFFF")) ;; 연한 하늘색배경임
                               ("org" (:background "#FFAAFF")) ;; 연한 핑크배경임
                               ("text" (:background "#FFAAFF")) ;; 연한 핑크배경임
                               ("text" (:background "LightGoldenrod1"))
                                           ;("org" (:background "light yellow"))
                                           ;("text" (:background "snow1"))
                                           ;("" (:background "LightBlue"))
                                           ;("python" (:background "#E5FFB8"))
                               ;;("emacs-lisp" (:background "PaleTurquoise1"))
                               ("test" (:background "#EEE2FF"))
                               ))
  (setq global-mode-string
                           '(
                             ""
                             org-timer-mode-line-string
                             "화두확실"
                             display-time-string
                             battery-mode-line-string
                             timeclock-mode-string
                             )
  )

(org-babel-load-file (expand-file-name "~/config_github/app/emacs/shell_emacs/customize_face_saved_to_load.org"))

;; 여러 대상을 나누어서 실험한 다음 붙여서 검토하고 분할하여 처리할 것.(org-babel-load-file (expand-file-name "~/config_github/app/emacs/shell_emacs/customize_face_saved_to_load.org"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;; 모아 두었다가 파일에서 변경하고 시행을 검토할 것
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'seethru)    ; seethru.org


(setq make-pointer-invisible nil) ;app/emacs/mouse.org; 마우스가 입력중에 사라지게하는 기본기능(-마우스찾는 시간허비) 중지함




;;; ivy.org
  (use-package counsel
    :ensure t
    :custom
    (counsel-yank-pop-preselect-last t)
    (counsel-yank-pop-separator "\n                                                                                            \n")
    (counsel-rg-base-command
     "rg -SHn --no-heading --color never --no-follow --hidden %s")
    (counsel-find-file-occur-cmd     ; TODO Simplify this
     "ls -a | grep -i -E '%s' | tr '\\n' '\\0' | xargs -0 ls -d --group-directories-first")
    :config
    (defun prot/counsel-fzf-rg-files (&optional input dir)
      "Run `fzf' in tandem with `ripgrep' to find files in the
  present directory. Both of those programs are external To
  Emacs."
      (interactive)
      (let ((process-environment
             (cons (concat "FZF_DEFAULT_COMMAND=rg -Sn --color never --files --no-follow --hidden")
                   process-environment)))
        (counsel-fzf input dir)))

    (defun prot/counsel-fzf-dir (arg)
      "Specify root directory for `counsel-fzf'."
      (prot/counsel-fzf-rg-files ivy-text
                                 (read-directory-name
                                  (concat (car (split-string counsel-fzf-cmd))
                                          " in directory: "))))

    (defun prot/counsel-rg-dir (arg)
      "Specify root directory for `counsel-rg'."
      (let ((current-prefix-arg '(4)))
        (counsel-rg ivy-text nil "")))

    (ivy-add-actions
     'counsel-fzf
     '(("r" prot/counsel-fzf-dir "change root directory")
       ("g" prot/counsel-rg-dir "use ripgrep in root directory")))

      (ivy-add-actions
     'counsel-rg
     '(("r" prot/counsel-rg-dir "change root directory")
       ("z" prot/counsel-fzf-dir "find files with fzf in root directory")))

      ;; Remove coummands that only work with key bindings
      (put 'counsel-find-symbol 'no-counsel-M-x t)
      :bind (("M-x" . counsel-M-x)
             ("C-x C-f" . counsel-find-file)
             ("s-f" . counsel-find-file)
             ("s-F" . find-file-other-window)
	     ("C-x B" . counsel-wmctrl) ;;(global-set-key (kbd "C-x B") 'counsel-wmctrl)
             ("s-r" . counsel-rg)
             ("s-z" . counsel-fzf)))

;;;;;;
    
  (use-package ivy-rich
    :ensure t
    :config
    (setcdr (assq t ivy-format-functions-alist)
            #'ivy-format-function-line)
    (ivy-rich-mode 1))

  (use-package swiper
    :ensure t
    :after ivy
    :custom
    (swiper-action-recenter t)
    (swiper-goto-start-of-match t)
    (swiper-include-line-number-in-search t)
    :bind (("C-s" . swiper)))




;; emms.org
(require 'emms-player-simple-mpv)
;; This plugin provides control functions (e.g. ab-loop, speed, fullscreen).
(require 'emms-player-simple-mpv-control-functions)

;; An example of setting like emms-player-mplayer.el
;; `emms-player-my-mpv' is defined in this case.
(define-emms-simple-player-mpv my-mpv '(file url streamlist playlist)
    (concat "\\`\\(http[s]?\\|mms\\)://\\|"
            (apply #'emms-player-simple-regexp
                   "aac" "pls" "m3u"
                   emms-player-base-format-list))
    "mpv" "--no-terminal" "--force-window=no" "--audio-display=no")

(emms-player-simple-mpv-add-to-converters
 'emms-player-my-mpv "." '(playlist)
 (lambda (track-name) (format "--playlist=%s" track-name)))

(add-to-list 'emms-player-list 'emms-player-my-mpv)

(dolist (map (list emms-playlist-mode-map
;;                   emms-stream-mode-map
))
  (define-key map (kbd "m") 'emms-player-simple-mpv-mute)
  (define-key map (kbd "[") 'emms-player-simple-mpv-speed-decrease)
  (define-key map (kbd "]") 'emms-player-simple-mpv-speed-increase)
  (define-key map (kbd "{") 'emms-player-simple-mpv-speed-halve)
  (define-key map (kbd "}") 'emms-player-simple-mpv-speed-double)
  (define-key map (kbd ";") 'emms-player-simple-mpv-ab-loop)
  (define-key map (kbd "<backspace>") 'emms-player-simple-mpv-speed-normal)
  (define-key map (kbd "T") 'emms-player-simple-mpv-ontop)
  (define-key map (kbd "F") 'emms-player-simple-mpv-fullscreen)
  (define-key map (kbd "9") 'emms-volume-lower)
  (define-key map (kbd "0") 'emms-volume-raise))

(let ((map emms-playlist-mode-map))
  (define-key map (kbd ",") 'emms-player-simple-mpv-playlist-prev)
  (define-key map (kbd ".") 'emms-player-simple-mpv-playlist-next))
;; Playing YouTube playlist in reverse order.
;; `emms-player-my-mpv-ytpl-reverse' will be defined in this case.
(define-emms-simple-player-mpv my-mpv-ytpl-reverse '(url)
  "\\`http[s]://www\\.youtube\\.com/playlist\\?list="
  "mpv" "--no-terminal" "--force-window=no" "--audio-display=no"
  "--ytdl" "--ytdl-raw-options=playlist-reverse=")

(add-to-list 'emms-player-list 'emms-player-my-mpv-ytpl-reverse)

;; encourage-mode.org
(use-package encourage-mode
  :ensure t
  :config
  ;; Activate encourage-mode
  (encourage-mode t))



; pdf-tools.org
(use-package pdf-tools
:ensure t
:config 
;(pdf-tools-install)
)

(use-package org-pdfview
:ensure t)



;;
(use-package goldendict ;; goldendict.org
  :ensure t
  :bind ("C-x C-d" . goldendict-dwim))



     (require 'dimmer)
     (dimmer-mode t)
     (setq dimmer-fraction 0.2) ;; dimmer.org basic value





  (use-package dired-subtree ;;; dired.org
  :ensure t
  :after dired
  :bind (:map dired-mode-map
              ("<tab>" . dired-subtree-toggle)
              ("<C-tab>" . dired-subtree-cycle)
              ("<S-tab>" . dired-subtree-remove)))



;;; added from diary
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")
(ivy-mode 1)

(global-unset-key (kbd "C-x 1"))
(global-set-key (kbd "C-x 1 1") 'delete-other-windows)
(global-set-key (kbd "C-x 1 S") 'swiper-multi)
(global-set-key (kbd "C-x b") 'counsel-ibuffer)
;;(global-set-key (kbd "C-x b") 'ivy-omni-org)
(global-set-key (kbd "C-x r b") 'ivy-omni-org)
(global-set-key (kbd "C-x 1 M") 'maximize-window)
;(global-set-key (kbd "C-x 1 m") 'minimize-window)
(global-set-key (kbd "C-x 1 +") 'balance-windows)
(global-set-key (kbd "C-c & &") 'org-mark-ring-goto) ;; ;yasnippet으로 인한 변경을 보완하는 것이다.


(require 'golden-ratio-scroll-screen)
(autoload 'golden-ratio-scroll-screen-down "golden-ratio-scroll-screen" "scroll half screen down" t)
      (autoload 'golden-ratio-scroll-screen-up "golden-ratio-scroll-screen" "scroll half screen up" t)


(use-package history
:lighter "history"
:global t 
)
;:config
(global-set-key (kbd "C-x 1 m") 'history-add-history)
(global-set-key (kbd "C-x 1 h") 'history-goto-history)
;)



(setq display-time-format ; file:mode_line.org
" %H:%M [%Y-%m-%d %a]")

(display-time)


(setq locale-coding-system 'utf-8) ; file:coding_system_in_emacs.org
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

