;;
;; zone.el for zone.el in /home/anatole.juge
;; 
;; Made by Juge Anatole
;; Login   <anatole.juge@epitech.net>
;; 
;; Started on  Mon May  1 04:09:10 2017 Juge Anatole
;; Last update Tue May  2 02:46:50 2017 Juge Anatole
;;

;; (require 'zone)
;; (zone-when-idle 120)

(defun zone-choose (pgm)
  "Choose a PGM to run for `zone'."
  (interactive
     (list
      (completing-read
       "Program: "
       (mapcar 'symbol-name zone-programs))))
  (let ((zone-programs (list (intern pgm))))
    (zone)))
