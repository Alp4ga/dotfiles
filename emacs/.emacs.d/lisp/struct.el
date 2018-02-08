;;
;; struct.el for struct.el in /home/anatole.juge/emacs_epitech
;;
;; Made by Juge Anatole
;; Login   <anatole.juge@epitech.net>
;;
;; Started on  Sat Apr 29 23:31:42 2017 Juge Anatole
;; Last update Fri Jan  5 09:11:54 2018 valky
;;

(global-set-key (kbd"C-x C-k") 'insert-struct)


(defun insert-struct ()
  (interactive)
  (insert (get-struct))
  (forward-line -2)
  )

(defun get-struct ()
  (setq str (read-from-minibuffer
                    (format "Struct name : ")))
  (concat "typedef struct " str "_t {"
	  "\n\n"
	  "} " str "_t;\n")
)
