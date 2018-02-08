;;
;; protected.el for q in /home/tovazm/.emacs.d
;; 
;; Made by chalie_a
;; Login   <abel@chalier.me>
;; 
;; Started on  Tue Apr 15 06:12:59 2014 chalie_a
;; Last update Thu May 11 20:50:22 2017 Juge Anatole
;;

(global-set-key [f11] 'insert-make)

(defun insert-make ()
  (interactive)
  (insert (get-make))
  (forward-line -28)
  )

(defun get-make ()
 (setq str (read-from-minibuffer
                    (format "Binary name : ")))
  (concat "\nCC\t=\tgcc\n\n"
	  "RM\t=\trm -f\n\n"
	  "CFLAGS\t=\t-W -Wall #-Wextra -pedantic\n\n"
	  "CPPLAGS\t=\t-I include/\n\n"
	  "SRC\t=\t\n\n"
	  "OBJ\t=\t$(SRC:.c=.o)\n\n"
	  "NAME\t=\t" str "\n\n"
	  "all\t:\t$(NAME)\n\n"
	  "$(NAME)\t:\t$(OBJ)\n"
	  "\t\t$(CC) $(OBJ) -o $(NAME)\n\n"
	  "clean\t:\n"
	  "\t\t$(RM) $(OBJ)\n\n"
	  "fclean\t:\tclean\n"
	  "\t\t$(RM) $(NAME)\n\n"
	  "re\t:\tfclean all\n\n"
	  ".PHONY\t:\tall clean fclean re\n\n"
)
)
