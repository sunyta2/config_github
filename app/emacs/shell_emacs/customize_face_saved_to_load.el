(custom-set-faces
   '(mode-line 
((t
  (:weight bold :slant italic :box
           (:line-width 2 :color "red" :style released-button)
           :foreground "medium blue" :background "gold")))

     ((t
  (:height 1.1 :weight bold :slant italic :box
           (:line-width 3 :color "red" :style released-button)
           :foreground "medium blue" :background "gray")))
    )

   '(mode-line-buffer-id
((t
  (:weight bold :slant italic :box
           (:line-width 2 :color "dark blue" :style nil)
           :foreground "dark green")))
    )
   '(mode-line-inactive   
((t
  (:weight light :box
           (:line-width -1 :color "grey75" :style nil)
           :foreground "grey20" :background "grey90")))
       )
  )

(custom-set-faces

'(minibuffer-prompt
((t
  (:weight bold :overline "magenta" :foreground "medium blue" :background "yellow")))
)

)

(custom-set-faces

'(dired-directory
((t
  (:box
   (:line-width 3 :color "DarkGreen" :style released-button)
   :background "DarkOliveGreen1" :inherit
   (font-lock-function-name-face))))
)



'(dired-header
((t
  (:weight bold :box
	   (:line-width -1 :color "black" :style nil)
	   :inherit
	   (font-lock-type-face))))
)

'(dired-symlink
((t
  (:underline
   (:color foreground-color :style wave)
   :foreground "darkgreen" :inherit
   (font-lock-keyword-face))))
)

)

(custom-set-faces


'(org-block
((t
  (:background "#f850f850f850" :inherit
	       (shadow))))
)

'(org-block-begin-line
((t
  (:height 1.2 :box
	   (:line-width 2 :color "darkgreen" :style released-button)
	   :foreground "medium blue" :background "white smoke")))
)

'(org-block-end-line
((t
  (:box
   (:line-width 2 :color "darkgreen" :style released-button)
   :foreground "darkred" :background "white smoke" :inherit
   (org-block-begin-line))))
)

'(org-checkbox
((t
  (:box
   (:line-width 2 :color "deep pink" :style released-button)
   :background "mint cream")))
)

'(org-checkbox-statistics-todo
((t
  (:inherit
   (org-todo))))
)

'(org-code
((t
  (:background "light salmon")))
)

'(org-date
((t
  (:underline
   (:color foreground-color :style line)
   :foreground "medium blue")))
)

'(org-default
((t
  (:height 1.2 :foreground "dark green" :inherit
	   (default))))
)

;org-document-info   ; 재설정을 검토할 것.

'(org-document-info-keyword
((t
  (:height 1.2 :box
	   (:line-width 2 :color "grey75" :style pressed-button)
	   :background "azure1")))
)

'(org-document-title
((t
  (:height 1.5 :weight bold :overline "gold" :box
	   (:line-width 2 :color "grey75" :style released-button)
	   :foreground "midnight blue" :background "OliveDrab1")))
)

'(org-drawer
((t
  (:box
   (:line-width 2 :color "grey75" :style released-button)
   :foreground "Blue1" :background "wheat")))
)


'(org-ellipsis
((t
  (:height 1.2 :underline
	   (:color foreground-color :style wave)
	   :box
	   (:line-width 3 :color "magenta" :style released-button)
	   :foreground "magenta" :background "light yellow")))
)



;org-fontify-quote-and-verse-blocks: t


'(org-hide
((((background light))
  (:foreground "white"))
 (((background dark))
  (:foreground "black")))
)

'(org-indent
((t
  (:underline nil :foreground "white smoke" :background "azure1" :inherit
	      (org-hide))))
)


'(org-level-1
((t
  (:height 1.8 :box
	   (:line-width 2 :color "deep sky blue" :style released-button)
	   :background "light steel blue")))
)

'(org-level-2
((t
  (:height 1.7 :box
	   (:line-width 2 :color "deep sky blue" :style released-button)
	   :foreground "orange red" :background "pale green")))
)

'(org-level-3
((t
  (:height 1.6 :box
	   (:line-width 2 :color "deep sky blue" :style released-button)
	   :background "light steel blue")))
)

'(org-level-4
((t
  (:height 1.5 :box
	   (:line-width 2 :color "deep sky blue" :style released-button)
	   :foreground "magenta" :background "medium spring green")))
)

'(org-level-5
((t
  (:height 1.4 :box
	   (:line-width 2 :color "deep sky blue" :style released-button)
	   :foreground "dark green" :background "wheat")))
)

'(org-level-6
((t
  (:height 1.3 :box
	   (:line-width 2 :color "deep sky blue" :style released-button)
	   :foreground "orange" :background "dark green")))
)

'(org-level-7
((t
  (:height 1.2 :box
	   (:line-width 2 :color "deep sky blue" :style released-button)
	   :background "light steel blue")))
)

'(org-level-8
((t
  (:height 1.1 :box
	   (:line-width 2 :color "deep sky blue" :style released-button)
	   :foreground "orange red" :background "pale green")))
)

'(org-link
((t
  (:inherit
   (link))))
)

'(org-list-dt
((t
  (:height 1.1 :weight bold :background "light cyan")))
)

'(org-meta-line
((t
  (:height 1.15 :box
	   (:line-width 2 :color "grey75" :style released-button)
	   :background "LightGoldenrod" :inherit
	   (font-lock-comment-face))))
)

'(org-mode-line-clock
((t
  (:weight normal :underline
	   (:color "light gray" :style wave)
	   :box
	   (:line-width 2 :color "red" :style released-button)
	   :background "gold" :inherit
	   (mode-line))))
)

'(org-mode-line-clock-overrun
((t
  (:height 1.1 :weight bold :box
	   (:line-width 2 :color "red" :style released-button)
	   :background "green" :inherit
	   (mode-line))))
)

'(org-property-value
((t
  (:foreground "medium blue" :background "AntiqueWhite2")))
)

'(org-quote
((t
  (:background "lawn green" :inherit
	       (org-block))))
)

'(org-special-keyword
((t
  (:box
   (:line-width 1 :color "blue" :style released-button)
   :background "yellow" :inherit
   (font-lock-keyword-face))))
)

'(org-table
((t
  (:box
   (:line-width 2 :color "grey75" :style released-button)
   :foreground "Blue1" :background "DarkOliveGreen1")))
)

'(org-todo
((t
  (:weight bold :box
	   (:line-width 3 :color "medium blue" :style released-button)
	   :foreground "green" :background "cornsilk")))
)

'(org-verse
((t
  (:background "light goldenrod")))
)

'(org-warning
((t
  (:height 1.2 :weight bold :box
	   (:line-width 2 :color "grey75" :style released-button)
	   :foreground "medium blue" :background "tomato1")))
)
'(help-argument-name
((t
  (:weight semi-bold :background "wheat" :inherit
	   (italic))))
)


'(region
((t
  (:underline
   (:color "red" :style wave)
   :distant-foreground "gtk_selection_fg_color" :background "grey75")))
)

'(term-bold-face
((t
  (:weight semi-bold :box
	   (:line-width 1 :color "grey75" :style released-button))))
)

'(term
((t
  (:foreground "medium blue" :inherit
	       (default))))
)

'(dired-subtree-depth-1
((t nil))
)

'(dired-subtree-depth-2
((t nil))
)

'(dired-subtree-depth-3
((t nil))
)

'(dired-subtree-depth-4
((t nil))
)

'(dired-subtree-depth-5
((t nil))
)

'(dired-subtree-depth-6
((t nil))
)

'(show-paren-match 
((t
  (:box
   (:line-width 2 :color "blue" :style released-button))))
)

'(show-paren-match-expression
((t
  (:box
   (:line-width 2 :color "green" :style released-button))))
)



'(show-paren-mismatch
((t
  (:box
   (:line-width 2 :color "purple" :style released-button))))
)


)
