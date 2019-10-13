
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aquamacs-additional-fontsets nil t)
 '(aquamacs-customization-version-id 310 t)
 '(aquamacs-tool-bar-user-customization nil t)
 '(custom-enabled-themes (quote (deeper-blue)))
 '(default-input-method "korean-hangul")
 '(ns-tool-bar-display-mode (quote both) t)
 '(ns-tool-bar-size-mode (quote regular) t)
 '(one-buffer-one-frame-mode nil nil (aquamacs-frame-setup))
 '(org-agenda-files
   (quote
    ("~/Music/great_books_of_the_western_world/greek_latin/theme_alias/greek_grammare_theme_alias/illustated_list_pdf_theme_greek_latin_conquer.pdf.org" "~/Music/emacs/org/news_thinkpad_from_macbook_aquamacs.org" "~/Dropbox/org/dropbox_org_functions_common/_init_dotfile_preference_space_aqua.org")))
 '(org-babel-load-languages (quote ((emacs-lisp . t) (shell . t) (latex . t))))
 '(package-selected-packages
   (quote
    (popup-kill-ring avy swiper nyan-mode popup ivy ivy-explorer org)))
 '(set-language-environment-hook (quote (url-set-mime-charset-string)))
 '(tabbar-mode t nil (tabbar))
 '(visual-line-mode nil t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Custom-mode-default ((t (:inherit autoface-default :height 120 :family "Source Code Pro"))) t)
 '(org-mode-default ((t (:inherit outline-mode-default :stipple nil :background "#e1fffd" :strike-through nil :underline nil :slant normal :weight normal :height 120 :width normal :family "NanumGothicCoding"))))
 '(text-mode-default ((t (:inherit autoface-default :stipple nil :strike-through nil :underline nil :slant normal :weight normal :height 120 :width normal :family "Source Code Pro")))))
