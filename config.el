;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; You do not need to run 'doom sync' after modifying this file.

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
;;
;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;;; Themes and appearance
(setq doom-theme 'doom-nord)
(setq centaur-tabs-show-navigation-buttons t
      centaur-tabs-cycle-scope 'default)

;;; Directories and files
(setq org-directory "~/org/")
(unless (file-exists-p org-directory)
  (make-directory org-directory))
(setq org-agenda-files (list org-directory))

;;; Keybinds
; FIXME: doom-leader-alt-key is not working here.
(defhydra hydra-centaur-tabs (global-map "C-c" :color red)
  "Change centaur-tab"
  ("<left>" centaur-tabs-backward "←")
  ("<right>" centaur-tabs-forward "→"))

;;; Programming languages
; Activate TS support
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))

;; Autoformat (must be enabled for each mode individually for more control).
;; See more: https://github.com/hlissner/doom-emacs/tree/develop/modules/editor/format
; Python
(add-hook 'python-mode-hook #'format-all-mode)
(add-hook 'before-save-hook #'py-isort-before-save)

;;; Misc variables
(setq confirm-kill-emacs nil)  ; Remove exit confirmation
(setq display-line-numbers-type 'relative)  ; Display line numbers. Replace 'relative with t if using absolute lines.
(setq kill-whole-line t)  ; Kill the entire line when using C-k at the beginning
(setq projectile-enable-caching nil)  ; Disable caching to ensure all files are shown (do not use for big projects)
(setq projectile-indexing-method 'alien)  ; Use alien indexing for best performance (Does not work on Windows)
