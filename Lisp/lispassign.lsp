;Some Lisp Assignments HW Handout
;Due November 9, 2016
;By John Knowles
;CS414 Fall 2016

(defvar list1)
(defvar list2)
(defvar list3)
(defvar listy)
(setq listy '((1 2) (3 4 5 6) (4 5 6 8) (4 6 8 9)))
(setq list1 '(1 2 3 4 5 6 7 8 9))
(setq list2 '(al az ar dc ga in tn))
(setq list3 '(a b c d e f g h i j k l m n o p q r s t u v w x y z))

;part1
(defun inlist (val ds)
	(cond	((null ds) nil)
			((equal (car ds) val) 1)
			(t (inlist val (cdr ds)))))	

(defun position-in-list (val ds)
	(cond ((equal (inlist val ds) nil) nil)
		(t
		(cond	((null ds) nil)
				((equal (car ds) val) 0)
				(t (+ 1 (position-in-list val (cdr ds))))))))
			
	
;part2

(defun n-th (val mylist)
	(cond 	((null myList) nil)
			((equal val 0) (car mylist))
			(t (n-th (- val 1) (cdr myList)))))
			
;part3
(defun merge-lists (ds1 ds2)
	(cond	((and (null ds1) (null ds2)) nil)
			((null ds1) ds2)
			((null ds2) ds1)
			((<= (car ds1)(car ds2)) (cons (car ds1) (merge-lists (cdr ds1) ds2)))
			((> (car ds1) (car ds2)) (cons (car ds2) (merge-lists ds1 (cdr ds2))))))
			
;part4
(defun super-merge-lists (ds)
	(cond	((null ds) nil)
			((equal (cdr ds) nil) (car ds))
			(t (super-merge-lists (cons (merge-lists (car ds) (car(cdr ds))) (cddr ds))))))
			
;part5
;used default append since I already wrote merge. aka append on steroids.
(defun flatten (l)
  (cond ((null l) nil)
        ((atom (car l)) (cons (car l) (flatten (cdr l))))
        (t (append (flatten (car l)) (flatten (cdr l))))))
#|
(defun flatten (tree)
  (let ((result '()))
    (labels ((scan (item)
               (if (listp item)
                   (map nil #'scan item)
                   (push item result))))
      (scan tree))
    (nreverse result)))
|#
			 