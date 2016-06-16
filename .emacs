;; Make sure all packages are present
; list the packages you want
(setq package-list '(auto-complete popup color-theme-sanityinc-solarized dumb-jump popup dash s f dash s f dash s flymake-php flymake-easy helm helm-core async popup async helm-core async magit magit-popup dash async git-commit with-editor dash async dash with-editor dash async dash async magit-popup dash async mustache-mode nyan-mode php-mode popup projectile pkg-info epl dash s smartparens dash web-mode with-editor dash async))

; list the repositories containing them
(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

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
(require 'smartparens-config)

(require 'auto-complete)
(global-auto-complete-mode t)

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
(global-set-key (kbd "C-x f") 'projectile-find-file)


;; A few mode items
(ido-mode 1)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(setq-default indent-tabs-mode nil)
(add-to-list 'ac-modes 'php-mode)


;; php-mode configuration
(setq php-mode-coding-style "drupal")

(require 'flymake-php)
(add-hook 'php-mode-hook 'flymake-php-load)

;; Some custom file associations
(add-to-list 'auto-mode-alist '("\\.client\\'" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.module\\'" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.tmpl\\'" . web-mode))

;; nyan cat mode line
(nyan-mode 1)

;; super awesome jump to definition
(dumb-jump-mode)

;; Use soliarized dark theme
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-solarized-dark)))
 '(custom-safe-themes
   (quote
    ("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
