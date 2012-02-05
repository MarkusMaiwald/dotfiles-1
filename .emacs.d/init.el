;; NEIN NEIN NEIN
;; (menu-bar-mode -1)
(tool-bar-mode -1)
(setq inhibit-startup-message t)
(set-default 'indent-tabs-mode nil)

;; Put backups in temp
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Ignore junk files
(setq completion-ignored-extensions '("~" ".pyc"))

;; Packages
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; Install packages on startup
(when (not package-archive-contents)
  (package-refresh-contents))
(defvar my-packages '(color-theme-solarized yaml-mode coffee-mode magit smex)
  "A list of packages to ensure are installed at launch.")
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Idon't
(ido-mode 2)
(setq ido-ignore-extensions t)

;; Smex
(require 'smex)
(setq smex-save-file (concat user-emacs-directory ".smex-items"))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; Typesetting
(set-face-attribute 'default nil :font "Inconsolata-13")
(require 'color-theme-solarized)
(color-theme-solarized-dark)

;; Don't minimize on C-z
(global-set-key (kbd "C-z") nil)

;; de-FUN!
(defun esk-sudo-edit (&optional arg)
  (interactive "p")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:" (ido-read-file-name "File: ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

(defun esk-local-column-number-mode ()
  (make-local-variable 'column-number-mode)
  (column-number-mode t))

(defun esk-local-comment-auto-fill ()
  (set (make-local-variable 'comment-auto-fill-only-comments) t)
  (auto-fill-mode t))

(defun esk-add-watchwords ()
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\|TODO\\|FIXME\\|HACK\\|REFACTOR\\|NOCOMMIT\\)"
          1 font-lock-warning-face t))))

(add-hook 'prog-mode-hook 'esk-local-column-number-mode)
(add-hook 'prog-mode-hook 'esk-local-comment-auto-fill)
(add-hook 'prog-mode-hook 'esk-add-watchwords)

(defun esk-untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun esk-tabify-buffer ()
  (interactive)
  (tabify (point-min) (point-max)))

(defun esk-indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun esk-cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer."
  (interactive)
  (if indent-tabs-mode
      (esk-tabify-buffer)
    (esk-untabify-buffer))
  (delete-trailing-whitespace))

(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))
;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp/rails-minor-mode"))
;; (require 'rails)

(defface erb-face
  '((t (:background "#073642")))
  "Default inherited face for ERB tag body."
  :group 'rhtml-faces)

(defface erb-delim-face
  '((t (:background "#073642")))
  "Default inherited face for ERB tag delimeters."
  :group 'rhtml-faces)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp/rhtml-minor-mode"))
(require 'rhtml-mode)
;; (require 'ruby-electric)

;; ;; ruby
;;;###autoload
(progn
  (eval-after-load 'ruby-mode
    '(progn
       ;; work around possible elpa bug
       (ignore-errors (require 'ruby-compilation))
       (setq ruby-use-encoding-map nil)
       (add-hook 'ruby-mode-hook 'inf-ruby-keys)
       (define-key ruby-mode-map (kbd "RET") 'reindent-then-newline-and-indent)
       (define-key ruby-mode-map (kbd "C-M-h") 'backward-kill-word)))

  (global-set-key (kbd "C-h S-r") 'ri)

  ;; Rake files are ruby, too, as are gemspecs, rackup files, etc.
  (add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))

  ;; We never want to edit Rubinius bytecode or MacRuby binaries
  (add-to-list 'completion-ignored-extensions ".rbc")
  (add-to-list 'completion-ignored-extensions ".rbo")
)

;;   ;;; Rake

;;   (defun pcomplete/rake ()
;;     "Completion rules for the `ssh' command."
;;     (pcomplete-here (pcmpl-rake-tasks)))

;;   (defun pcmpl-rake-tasks ()
;;     "Return a list of all the rake tasks defined in the current
;; projects.  I know this is a hack to put all the logic in the
;; exec-to-string command, but it works and seems fast"
;;     (delq nil (mapcar '(lambda(line)
;;                          (if (string-match "rake \\([^ ]+\\)" line) (match-string 1 line)))
;;                       (split-string (shell-command-to-string "rake -T") "[\n]"))))

;;   (defun rake (task)
;;     (interactive (list (completing-read "Rake (default: default): "
;;                                         (pcmpl-rake-tasks))))
;;     (shell-command-to-string (concat "rake " (if (= 0 (length task)) "default" task))))


;;   ;; Clear the compilation buffer between test runs.
;;   (eval-after-load 'ruby-compilation
;;     '(progn
;;        (defadvice ruby-do-run-w/compilation (before kill-buffer (name cmdlist))
;;          (let ((comp-buffer-name (format "*%s*" name)))
;;            (when (get-buffer comp-buffer-name)
;;              (with-current-buffer comp-buffer-name
;;                (delete-region (point-min) (point-max))))))
;;        (ad-activate 'ruby-do-run-w/compilation)))

;;   ;; Rinari (Minor Mode for Ruby On Rails)
;;   (setq rinari-major-modes
;;         (list 'mumamo-after-change-major-mode-hook 'dired-mode-hook 'ruby-mode-hook
;;               'css-mode-hook 'yaml-mode-hook 'javascript-mode-hook)))


;; ;; nXhtml
;; ;; fuck me gently with a chainsaw

;; (load "~/.emacs.d/lisp/nxhtml/autostart.el")
;; (add-to-list 'load-path "~/.emacs.d/lisp/nxhtml/util")
;; (require 'mumamo-fun)
;; (setq
;;  nxhtml-global-minor-mode t
;;  mumamo-chunk-coloring 'submode-colored
;;  nxhtml-skip-welcome t
;;  indent-region-mode t
;;  rng-nxml-auto-validate-flag nil
;;  nxml-degraded t)
;; (add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . eruby-html-mumamo))

