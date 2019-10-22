; 기능별로 목록을 만들어서 각 폴더별로 파일을 찾아서 실행하는 것으로 구성을 할 것
; (load "/home/thinkpad/config_github/app/emacs/spacemacs/_spacemacs_dotfile_customize_manager.el")

(require 'xclip) ;; 복사와 붙여넣기의 연동을 가능하게 한다.
(turn-on-xclip) ;; 잘됨으로 다시 판명
;; To use, just add (xclip-mode 1) to your ~/.emacs or do `M-x clip-mode' ## 도움말 c-h P xclip로 발견함
;;(xclip-mode 1)

(require 'edit-server) ;; EMACS chromium edit
(edit-server-start)
(linum-relative-global-mode) ;; 
