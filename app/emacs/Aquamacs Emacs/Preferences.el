;; This is the Aquamacs Preferences file.
;; Add Emacs-Lisp code here that should be executed whenever
;; you start Aquamacs Emacs. If errors occur, Aquamacs will stop
;; evaluating this file and print errors in the *Messages* buffer.
;; Use this file in place of ~/.emacs (which is loaded as well.)
(add-to-list 'auto-mode-alist '("\\.txt\\'" . org-mode))
(add-hook 'dired-mode-hook
      (lambda ()
        (dired-hide-details-mode)
        ;(dired-sort-toggle-or-edit)
	))


(scroll-bar-mode -1)
(set-face-attribute 'default nil
                    :family "Source Code Pro"
                    :height 123
                    ;;:size 20
                    :slant 'italic
                    :weight 'normal
                    :width 'normal)
;; Master 먼저실행!
;;(find-file "/Volumes/macbook_ssd/SYN/,Emacs-Aquamacs Manual/AquaMasterNote.org")


;; add in ThinkPad
(find-file "~/Dropbox/org/dropbox_org_functions_common/_init_dotfile_preference_space_aqua.org")
;; 문장을 추가해 본다.




;;basic setting need
(ido-mode)
(add-to-list 'package-archives
     '("melpa" . "https://melpa.org/packages/") t)



;; Dired-mode to File-management
(global-set-key (kbd "C-x C-j") 'dired-jump) ;;C-x C-j




;; Capture grab-mac
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c l") 'org-store-link) ;; org-store-link (Ctrl-c l) 지정할 것 반드시  Emacs가 탁월한 확실한 이유임!!!!!

(global-set-key (kbd "M-x") 'counsel-M-x)
;;(global-set-key (kbd "C-c s") 'helm-multi-swoop-all)
(global-set-key (kbd "C-c s") 'swiper-all)
(global-set-key (kbd "C-c g") 'grab-mac-link)

(global-set-key (kbd "C-x C-j") 'counsel-dired-jump)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)

;; 노트를 적을 준비를 한다. 한글을 가능하게 한다.
(set-input-method  "korean-hangul")


(ivy-mode)
(nyan-mode)
;; 우선 기본시작점을 지정함
;(org-babel-load-file "/Users/thinkpad/Library/Preferences/Aquamacs Emacs/Preferences_thinkpad/Preferences_common_basic.org")
;(org-babel-load-file "/Users/thinkpad/Library/Preferences/Aquamacs Emacs/Preferences_thinkpad/Preferences_thinkpad_basic.org")


;; 특별히 사용할 부분을 지정함.



;; 실험적인 부분을 별도의 파일로 실행함 목적을 적시할 것.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun sasa/split-windows()
  "Split windows my way."
  (interactive)
  ;; Create new window right of the current one
  ;; Current window is 80 characters (columns) wide
  (split-window-right 80)
  ;; Go to next window
  (other-window 1)
  ;; Create new window below current one
  (split-window-below)
  ;; Start eshell in current window
  (eshell)
  ;; Go to previous window
  (other-window -1)
  ;; never open any buffer in window with shell
  (set-window-dedicated-p (nth 1 (window-list)) t))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
