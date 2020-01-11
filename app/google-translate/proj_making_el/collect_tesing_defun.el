

;(use-package google-translate ;; /app/google-translate/readme.org
;(require 'google-translate) ;; $ yay translate-shell # trans -R
+++++++++
(defun google-translate-ljp ()
"일단 간단히 실행하고 나중에 추가할 것을 추가한다.
- 다른 버퍼나 파일로 전송하는 것을 연구할 것
- (find-file "~/config_github/app/google-translate/proj_making_el/collect_tesing_defun.el")
"
  (interactive)
  (if mark-active
      (progn (setq
	    selection (buffer-substring-no-properties (region-beginning) (region-end))
	    traned-txt (substring (shell-command-to-string (concat "trans -no-autocorrect -b -d -s en -t ko+la '" selection "'")) 0 -1 )
	)
	(message (concat traned-txt "=" selection))
	)))
(global-set-key "\C-ct" 'google-translate-ljp)



  ;;:init
  ;;(setq foo-variable t)
 ; :config
;(require 'google-translate-smooth-ui)
;(require 'google-translate-default-ui)
;(global-set-key "\C-ct" 'google-translate-at-point)
;(global-set-key "\C-cT" 'google-translate-query-translate)

;(setq google-translate-default-target-language  "ko"
;      google-translate-default-source-language "en")
;(setq google-translate-default-target-language  nil
; google-translate-default-source-language "en")
;(global-set-key "\C-cT" 'google-translate-query-translate)

;(global-set-key "\C-ct" 'google-translate-smooth-translate)
;(setq google-translate-translation-directions-alist
;      '(("en" . "ko") ("en" . "la") 
;	("ko" . "en") ("ko" . "la") ("ko" . "el")  
;	 ("la" . "ko")  ("la" . "en")
;	("en" . "el") ("en" . "he")))

;)

(defun my_translate_google ()
  ; 영역의 변수를 지정함.
  
(defun get-search-term ()
  (interactive)
  (if mark-active
      (let (
        (selection (buffer-substring-no-properties (region-beginning) (region-end))))
    (if (= (length selection) 0)
        (message "empty string")
      (message selection))
    )
    (error "mark not active")
  )


(defun get-search-term ()
  (interactive)
  (if mark-active
      (setq
	    selection (buffer-substring-no-properties (region-beginning) (region-end))
	    traned-txt (substring (shell-command-to-string (concat "trans -b -d -s en -t ko+la '" selection "'")
   						) 0 -1 )
	    )
    (if (= (length selection) 0)
        (message "empty string")
      ;(message selection)
	(message traned-txt)
	
      )
    )
    (error "mark not active"))
  )




  (get-search-term)

  ;리스프로 함수결과를 받음.
  trans -b -d -s en -t ko+la "hello world is good"
(setq my_shell_output
  (substring 
    (shell-command-to-string "/bin/echo hello") 
   0 -1))

  ;빈버퍼를 열어서 사용함.위치지정하면 더욱 좋을 것임.
  버퍼로 문장을 보내기를 실행함.
  



  )



#+BEGIN_SRC emacs-lisp
(defun get-search-term ()
  (interactive)
;;(setq a (buffer-substring-no-properties (region-beginning) (region-end))) 
(setq a "hello world
This buffer is for text that is not saved, and for Lisp evaluation.
;; To create a file, visit it with C-x C-f and enter text in its buffer.

") 
(setq b (concat "trans -b -d -s en -t ko+la '" a "'" ) )
  (setq selection (substring (shell-command-to-string b ) 0 -1))
	(message selection)


)


	    
    (if (= (length selection) 0)
        (message "empty string")
      ;(message selection)
	
      )
    )
    (error "mark not active"))



(async-shell-command (concat "trans -b -d -s en -t ko+la '" "hello world" "'"))
 0 -1 )

#+END_SRC



++++ backup for let
#+BEGIN_SRC emacs-lisp
(defun get-search-term ()
  (interactive)
  (if mark-active
      (let 
	    (selection (shell-command-to-string (concat "trans -b -d -s en -t ko+la '" (buffer-substring-no-properties (region-beginning) (region-end)) "'"
)
   						0 -1))
	    
    (if (= (length selection) 0)
        (message "empty string")
      ;(message selection)
	(message selection)
	
      ))
    )
    (error "mark not active"))



(async-shell-command (concat "trans -b -d -s en -t ko+la '" "hello world" "'"))
 0 -1 )

#+END_SRC

#+BEGIN_SRC emacs-lisp
(defun get-search-term (beg end)
  "message region or \"empty string\" if none highlighted"
  (interactive (if (use-region-p)
                   (list (region-beginning) (region-end))
                 (list nil nil)))
  (message "%s" (if (and beg end)
                    (buffer-substring-no-properties beg end)
                  "empty string")))
#+END_SRC
