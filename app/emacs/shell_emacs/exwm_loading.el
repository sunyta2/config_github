;;; exwm.org에 모인 내용을 아래에 실행함
;;그리고 alt 키를 복구하는 명령을 실행한다. setxkbmap -option ""
    (start-process-shell-command "setxkbmap_alt_recover" nil "setxkbmap -option \"\"")
;; 투명도활성화 명령을 실행하고 compton/ exwm.org
    (start-process-shell-command "compton" nil "compton -bcCGf --active-opacity 0.87 -i 0.6 -e 0.6 -m 0.9")
;;변경이 자유로운 스크립트 대신에 일단 복귀를 사용해 봄     나중에 스크립트로 변경할 것
    (start-process-shell-command "setxkbmap_alt_recover" nil "nitrogen --restore")    



(setq WM "EXWM")
;(setq WM
;   (substring 
;     (shell-command-to-string " wmctrl -m | head -n1 | cut -f 2 -d : | sed -e 's/^[[:space:]]*//' ")
;   0 -1)
;)
  (require 'exwm)
  (require 'exwm-config)
  (require 'exwm-systemtray)
  (exwm-systemtray-enable)
  (exwm-config-default)

(cond ;; 잘 작동 wm조건문으로 기록 /app/emacs/if_cond_while_when_case_in_elisp.org
 ((cl-equalp WM "EXWM")    ;(message "this is Exwm")
  (require 'exwm)
  (require 'exwm-config)
  (require 'exwm-systemtray)
  (exwm-systemtray-enable)
  (exwm-config-default)
  )
     ( (cl-equalp WM "stumpwm") (message "good") (sleep-for 3) (message "this is stumpwm") )
     ( t (message "this is else") )
)



;;(message "원리를 발견하고 충분한 단련과 습관이 없으면 무용지물이다")
(exwm-input-set-key (kbd "s-R")
                   '(lambda ()
		      (interactive)
		      
		      (exwm-mff-mode t) (exwm-mff-warp-to-selected) (seethru 90) (elwm-rotate-window 1)
		      (other-window 1) 
))

(org-babel-load-file "~/config_github/app/emacs/shell_emacs/emacs_load_init.org")
