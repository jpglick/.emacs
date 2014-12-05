;; Hack to fix php-mode by loading cl first
(require 'cl)

;; Setup packages
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line


;; Visual Setup
(blink-cursor-mode -1)
(set-background-color "black")
(set-foreground-color "green")
(set-cursor-color "red")
(setq visible-bell 1)
(scroll-bar-mode -1)
(tool-bar-mode 0)
(show-paren-mode 1)
(global-hl-line-mode 0)
(set-face-attribute 'region nil :background "#666")

;; Key binding enhancements
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x p") 'previous-multiframe-window)


;; A few mode items
(ido-mode 1)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)


;; php-mode configuration
(setq php-mode-coding-style "drupal")
