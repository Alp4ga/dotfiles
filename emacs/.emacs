;; ----------------------------------
;;           VALKY CONFIG
;; ----------------------------------
(require 'package)
; add MELPA to repository list
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
; initialize package.el
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp")
(load "std.el")
(load "std_comment.el")

(load "vabam_header.el")
(load "make.el")
(load "protection.el")
(load "struct.el")
(load "zone.el")

;; Set emacs transparency
(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))
(add-hook 'window-setup-hook 'on-after-init)

(set-frame-parameter (selected-frame) 'alpha '(95 95))
(add-to-list 'default-frame-alist '(alpha 95 95))

;;EMACS backup
;;
;;
;; Default and per-save backups go here:
(setq auto-save-file-name-transforms `((".*" ,"~/.emacs.d/backup/auto-save" t)))
(setq backup-directory-alist '(("" . "~/.emacs.d/backup/per-save")))

(defun force-backup-of-buffer ()
  ;; Make a special "per session" backup at the first save of each
  ;; emacs session.
  (when (not buffer-backed-up)
    ;; Override the default parameters for per-session backups.
    (let ((backup-directory-alist '(("" . "~/.emacs.d/backup/per-session")))
	  (kept-new-versions 3))
      (backup-buffer)))
  ;; Make a "per save" backup on each save.  The first save results in
  ;; both a per-session and a per-save backup, to keep the numbering
  ;; of per-save backups consistent.
  (let ((buffer-backed-up nil))
    (backup-buffer)))

(add-hook 'before-save-hook  'force-backup-of-buffer)
(setq version-control t     ;; Use version numbers for backups.
      kept-new-versions 10  ;; Number of newest versions to keep.
      kept-old-versions 0   ;; Number of oldest versions to keep.
      delete-old-versions t ;; Don't ask to delete excess backup versions.
      backup-by-copying t)  ;; Copy all files, don't rename them.

(when window-system
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (tooltip-mode -1)
  )

;; copy-paste test
(setq x-select-enable-clipboard t)

;;kill curent buffer
(global-set-key [(control x) (k)] 'kill-this-buffer)

;;enlever bip
(setq ring-bell-function 'ignore)

;;supprimer menu
(menu-bar-mode -1)

;;afficher colonnes
(column-number-mode 1)

;;afficher espace en trop
(if (equal major-mode 'prog-mode)
    (setq show-trailong-whitespace t)
  (setq-default show-trailing-whitespace t)
  )

;;afficher parenthese corespondante
(show-paren-mode)

;; Suppression des espaces en fin de ligne a l'enregistrement
(add-hook 'prog-mode-hook '(lambda ()
   (add-hook 'write-contents-hooks 'delete-trailing-whitespace nil t)))

;; yes > y | no > n
(fset 'yes-or-no-p 'y-or-n-p)

;; ...et enlever le message d'accueil
(setq inhibit-startup-message t)

;;surbrillance de la region
(setq transient-mark-mode t)

;;Bold line
(global-hl-line-mode t)
(set-face-background hl-line-face "gray13")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "gray4" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 113 :width normal :foundry "ADBO" :family "Source Code Pro"))))
 '(enh-ruby-op-face ((t (:foreground "#d70000" :weight bold))))
 '(enh-ruby-string-delimiter-face ((t (:foreground "#00d700"))))
 '(flycheck-color-mode-line-error-face ((t (:inherit flycheck-fringe-error :weight normal))))
 '(flycheck-color-mode-line-info-face ((t (:inherit flycheck-fringe-info :weight normal))))
 '(flycheck-color-mode-line-warning-face ((t (:inherit flycheck-fringe-warning :weight normal))))
 '(highlight-numbers-number ((t (:foreground "#87AFD7" :weight bold))))
 '(my-tab-face ((((class color)) (:foreground "black" :weight bold :underline t))) t)
 '(region ((t (:background "#4e4e4e")))))

;; afficher tab
(defun cc-mode-add-keywords (mode)
  (font-lock-add-keywords
   mode
   '(
     ("\t+" (0 'my-tab-face append))
     ("^,\\{79\\}\\(.+\\)$" (1 'my-loong-line-face append)))))

(cc-mode-add-keywords 'c-mode)

;;afficher charactères en trop
(defun font-lock-width-keyword (width)
    `((,(format "^%s\\(.+\\)" (make-string 79 ?.))
       (1 font-lock-warning-face t))))
(font-lock-add-keywords 'c-mode (font-lock-width-keyword 79))

;;linum-mode
(global-set-key (kbd "<f6>") 'linum-mode)
(setq linum-format "%4d \u2502")



;; custom fuck-up
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes (quote (custom1)))
 '(custom-safe-themes
   (quote
    ("a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "751a3da1c7294081a34c96cf8fc4542e8b56377a6974c6ebf8629a358246d81a" "" default)))
 '(delete-selection-mode nil)
 '(enh-ruby-indent-tabs-mode nil)
 '(flycheck-error-list-minimum-level nil)
 '(flycheck-gcc-include-path (quote ("Include" "include")))
 '(package-selected-packages
   (quote
    (anaconda-mode flycheck flycheck-checkpatch flycheck-color-mode-line smart-mode-line-powerline-theme shell-pop ac-emoji which-key alchemist drag-stuff highlight-numbers neotree 2048-game rainbow-mode popwin ac-c-headers grandshell-theme paganini-theme iedit auto-complete-c-headers auto-complete)))
 '(sml/theme (quote automatic)))


;;auto-complete
;;auto-complete
;;auto-complete
;;auto-complete

(add-hook 'prog-mode-hook 'auto-complete-mode)

; start auto-complete with emacs
(require 'auto-complete)
; do default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)
; let's define a function which initializes auto-complete-c-headers and gets called for c/c++ hooks
; now let's call this function from c/c++ hooks
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

;; c headers
(require 'ac-c-headers)
(add-hook 'c-mode-hook
          (lambda ()
	    (add-to-list 'ac-sources 'ac-source-c-header-symbols t)))
(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers))

;;end
;;end
;;end

;; Fix iedit bug in Mac
(define-key global-map (kbd "C-c ;") 'iedit-mode)

;;popwin
(require 'popwin)
(popwin-mode 1)

;; Neotree
(require 'neotree)
(global-set-key (kbd "C-c RET") 'neotree)

;;anzu
(require 'anzu)
(define-globalized-minor-mode my-global-anzu-mode anzu-mode
  (lambda () (anzu-mode 1)))
(my-global-anzu-mode 1)

;; toggle-Undo
;; (require 'undo-tree)
;; (global-set-key (kbd "C-c u") 'undo-tree-visualize)

;;Rainbow_mode
(require 'rainbow-mode)
(define-globalized-minor-mode my-global-rainbow-mode rainbow-mode
  (lambda () (rainbow-mode 1)))
(my-global-rainbow-mode 1)

;;WinMove
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

;;Drag-stuff
(global-set-key (kbd "<M-up>")    'drag-stuff-up)
(global-set-key (kbd "<M-down>")  'drag-stuff-down)

;;Dumb-Jump
(require 'dumb-jump)
(global-set-key (kbd "C-c *")  'dumb-jump-go-other-window)

;;Highlight-numbers-mode
(add-hook 'prog-mode-hook 'highlight-numbers-mode)

;;annotate-mode
;; (add-hook 'prog-mode-hook 'annotate-mode)

;;huge files
(defun my-find-file-check-make-large-file-read-only-hook ()
  "If a file is over a given size, make the buffer read only."
  (when (> (buffer-size) (* 512 512))
    (setq buffer-read-only t)
    (buffer-disable-undo)
    (fundamental-mode)))
(add-hook 'find-file-hook 'my-find-file-check-make-large-file-read-only-hook)

;;file finder
(setq fiplr-root-markers '(".git" ".svn" "alpaga" ".root"))
(setq fiplr-ignored-globs '((directories (".git" ".svn" "node_modules" "deps" "_*" "rel" "priv" ".*"))
			    (files ("*.jpg" "*.png" "*.zip" "*~" "*.beam"))))
(global-set-key (kbd "C-x f") 'fiplr-find-file-other-frame)
(global-set-key (kbd "C-x d") 'fiplr-find-directory-other-frame)

;;shell-pop
(global-set-key (kbd "C-t") 'eshell)

;;;; Useless buffers
;;;;
;;;;

;; Makes *scratch* empty.
(setq initial-scratch-message "")

;; Removes *scratch* from buffer after the mode has been set.
(defun remove-scratch-buffer ()
  (if (get-buffer "*scratch*")
      (kill-buffer "*scratch*")))
(add-hook 'after-change-major-mode-hook 'remove-scratch-buffer)

;; Removes *messages* from the buffer.
(setq-default message-log-max nil)
(kill-buffer "*Messages*")

;; Removes *Completions* from buffer after you've opened a file.
(add-hook 'minibuffer-exit-hook
	  '(lambda ()
	     (let ((buffer "*Completions*"))
	       (and (get-buffer buffer)
		    (kill-buffer buffer)))))

;; Don't show *Buffer list* when opening multiple files at the same time.
(setq inhibit-startup-buffer-menu t)

;; Show only one active window when opening multiple files at the same time.
(add-hook 'window-setup-hook 'delete-other-windows)
;;;;
;;;;
;;;;
;;;;Useless buffers

;; New window shortcuts
(global-set-key (kbd "M-é <down>") 'split-window-below)
(global-set-key (kbd "M-é <right>") 'split-window-right)
(global-set-key (kbd "C-x q") 'delete-window)

;;; flycheck
;;;
;;;
;; flycheck-color-mode-line
(require 'flycheck-color-mode-line)

(eval-after-load "flycheck"
    '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

;;;
;; (add-hook 'prog-mode-hook #'global-flycheck-mode)
(add-hook 'c-mode-hook #'global-flycheck-mode)
(add-hook 'c++-mode-hook #'global-flycheck-mode)
(add-hook 'python-mode-hook #'global-flycheck-mode)

;; wHicH key
(require 'which-key)
(which-key-mode)
