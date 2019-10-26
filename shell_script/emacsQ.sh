# 이것은 빠른 실행을 위해서
# (shell-command "ln ~/config_github/shell_script/emacsQ.sh ~/.bin/emacsQ")

# emacs -Q -nw --eval '(set-input-method "korean-hangul")'


# ranger 등 파일 매니져에서 이 명령을 수행하는 것을 고려할 것.


# ;~/.bin/start는 별도임 ~/config_github/start.sh로 통합을 목표
# ;~/.bin/emacsQ의 원래 ~/config_github/shell_script/emacsQ.sh
### ln  링크를 실행 후 원본을 편집하는 것을 정한다. (find-file "~/config_github/shell_script/")

# 이것은 빠른 실행을 위해서 {원본: ~/config_github/shell_script/emacsQ.sh} # 편집은  $ emacsQ $(which emacsQ) 간단함!
# (shell-command "ln ~/config_github/shell_script/emacsQ.sh ~/.bin/emacsQ")

 emacs -Q -nw --load="/home/thinkpad/config_github/app/emacs/shell_emacs/emacsQ_load.el" $@
# 편집할 경우 아래의 명령을 실행하고 참조할 것.
# ;.bin/emacsQ의 원래; (find-file "~/config_github/shell_script/emacsQ.sh")
# ;.bin/emacsQ의 로딩; (find-file "~/config_github/app/emacs/shell_emacs/emacsQ_load.el")


# emacs -Q -nw -l "~/config_github/app/emacs/shell_emacs/shell_command_emacs.org" $@ 파일잘못지정으로 에러남을  몰랐음
# emacs -Q -nw --eval '(set-input-method "korean-hangul")' $@

# emacs -Q -nw --eval '(set-input-method "korean-hangul")' $@
# emacs -q -nw --eval '(progn (set-input-method "korean-hangul")
# (load-file "/home/thinkpad/config_github/app/emacs/shell_emacs/emacsQ_load.el")
# (toggle-input-method))' $@



# ranger 등 파일 매니져에서 이 명령(aka, emacsQ)을 수행하는 것을 고려할 것.


# 여러 내용의 실행파일이 증대할 경우에 정리하는 법은,
## dotfile로 내부에 function 함수명을 정확히 지정한 다음 다시 alias 로  약명으로 실행하는 것을 고려해 봄직함.
### 그러면 여러함수를 상세화해서 만들어 두고 약명으로 그 함수를 링크하므로 일일이 실행법을 수정하지 않아도 된다 Good IDEA.
