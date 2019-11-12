
this_uname="$(uname -a | awk '{print $2}')"

echo $this_uname
touch ~/.bin/grasp_inbox_IN_${this_uname}.org
echo "grasped in ~/server/grasp_server.py --path ~/.bin/grasp_inbox.org   
is working!!!

RUN emacs -nw -Q in ~/.bin
C-x C-z to backgrounding

"
~/.bin/grasp/server/grasp_server.py --path ~/.bin/grasp_inbox_IN_${this_uname}.org



echo "

~/.bin/grasp/server/grasp_server.py --path ~/.bin/grasp_inbox_IN_${this_uname}.org
######~/.bin/grasp/server/grasp_server.py --path ~/.bin/grasp_inbox.org ####


done

read  ~/.bin/grasp_inbox.org USING [ C-x C-r ]

or C-x C-e
(find-file-read-only "~/.bin/")
"
