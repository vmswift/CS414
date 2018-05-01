;HW from CH 9 of CS414 Book
; pg318 #'s 3 and 45
; pg330 9-11 and 9-13
; CS414 Fall 2016
; Due November 9, 2016
; By John H. Knowles

;fac function for problem 3 pg318
(defun fac (n)
	(cond ((null n) 0)
		 ((equal n 1) 1)
		 (t (* n (fac (- n 1))))))



;PG 318 HW items # 3 and 4
;prob 3
;(/ (fac '5) (* (fac '2) (fac (- '5 '2)))) ;desired use

;prob 4
;(/ (* 3.14 (* (* 5 5) 6)) 180) ;desired use


;Pg 330 9-11, 9-13
(defvar list1)
(setq list1 '(name (Don Smith) age 45 salary 30000 hire-date (August 25 1980)))

(defun getprop (ds val)
	(cond
		((null ds) nil)
		((eq (car val) ds) (cadr val))
		(t(getprop ds (cddr val)))))

		
(defun delprop (ds val)
	(cond 	((null ds)())
			((equal (car ds) val)  (cddr ds) )
			(t (cons (car ds) (delprop (cdr ds) val)))))
;(delprop list1 'name) ;desired use

;9-13
(defun addprop (ds attrib val)
	(cons attrib (cons val ds)))
;(addprop list1 'sex 'male) ;desired use






(defvar list3)
(defvar list4)
(setq list3 '(a b c d e))
(setq list4 '(f g h i j))

;returns the number of values in a list
(defun mySize (pass)
	(cond ((NULL pass) 0)
		  (t (+ 1 (mySize (cdr pass))))))
		  
;custom appened function
(defun myAppend (ds1 ds2)
	(cond	((null ds2) ds1)
			((null ds1) ds2)
			(t (cons (car ds1) (myAppend (cdr ds1) ds2)))))

;rotate function hw
(defun rotater (x ds)
	(cond	((null ds) ())
			((equal x 0) ds)
			((equal x 1) (myAppend (cdr ds) (cons (car ds)())))
			((<= x -1) (rotater (+ x (mySize ds)) ds))
			((>= x 1) (rotater (- x 1) (myAppend (cdr ds) (cons (car ds)()))))))