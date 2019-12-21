
* 검색의 핵심은 find-grep과 find-dired
(find-grep "find ~/config_github -type f -exec grep --color -nH --null -e gentoo \{\} +")
(find-dired "~/config_github" "-type f -exec grep -q -e gentoo \{\} +")
[검색의 핵심은 find-grep과 find-dired C-c C-l ](file:./app/emacs/search_find_grep_emacs.org "search find in Emacs")
./app/emacs/search_find_grep_emacs.org


# cd ~/config_github && git pull
================================\
- git pull # first!!! # in Chrome bookmark 'config_github'
- git clone https://github.com/sunyta2/config_github.git # cd ~/

# config_github
===============\
- $ git clean -fd # dry run is git clean -nd ## delete untracked ##
                        - git checkout -f # delete change only file tracked...
- $ git reset --hard # removes staged and working directory

- $ git log --oneline --decorate --all --graph
- $ while true; do clear; tree .git; sleep 6; done

- - $ git config --global alias.log1 '!git log --oneline --decorate --all --graph' # git commit --global --unset alias log1
- $ while true; do clear; tree .git; sleep 6; clear; git log1; sleep 30; done # or add $ cat todo.txt word.txt


- $ git add -A && git commit -am 'purpose'

## purpose: github saved .config folder and files
=================================================\

## git clone https://github.com/sunyta2/config_github.git
=========================================================\



# app Folder(sort by application)
=================================\
- mpv
- 


# os Folder(sort by OS)
=======================\
- brew yay pacman or pkg
- MacOS
- FreeBSD




# purpose Folder(sort by purpose)
=================================\
- WiFi, language, Sound

