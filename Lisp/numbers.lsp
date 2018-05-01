#| 	CLisp Assignment avg, sum, size, negative, positive, of a list
	Due November 2, 2016
	By John Knowles
	CS414 Programming Languages
	Dr. Brady Rimes
	Tested to work in GNU CLISP and SBCL
|#
;variables defined
(defvar list1)
(defvar list2)
(defvar list3)

;values assigned to defined variables.
(setq list1 '(9 8 7 6 5 4 3 2 1 0 -1 -2 -3 -4 -5 -6 -7 -8 -9))
(setq list2 '(884 929 49590 234 -234 425 0235 25234 5 25 63 2 45456 2 62 45636 6 25 9 29 5 3 5))
(setq list3 '(0 5 10 15 20 25 30 35 40 45 50 55 60 65 70 75 80 85 90 95 100))

;sum of all values in a list. returns sum value
(defun mySum (pass)
	(cond ((NULL pass) 0)
		  (t (+ (car pass) (mySum (cdr pass))))))

;returns the number of values in a list
(defun mySize (pass)
	(cond ((NULL pass) 0)
		  (t (+ 1 (mySize (cdr pass))))))

;average of all values in a list. returns average value
(defun myAvg (pass)
	(/ (mySum pass) (mySize pass)))

;returns a list of all negative values in a list 
(defun negList (pass)
	(cond ((NULL pass) ())
		   ((> (car pass) 0) (negList (cdr pass)))
		   (t (cons (car pass) (negList (cdr pass))))))

;returns a list of all positive values in a list
(defun posList (pass)
	(cond ((NULL pass) ())
		   ((< (car pass) 0) (posList (cdr pass)))
		   (t (cons (car pass) (posList (cdr pass))))))

;sum of positive values in a list. returns sum value
(defun posSum (pass)
	(mySum (posList pass)))

;sum of negative values in a list. returns sum value
(defun negSum (pass)
	(mySum (negList pass)))

;average of negative values in a list. returns avg value
(defun negAvg (pass)
	(myAvg (negList pass)))

;average of positive values in a list. returns avg value
(defun posAvg (pass)
	(myAvg (posList pass)))

;sum positive and negative then returns both in same list	
(defun sumPosNeg (pass)
	(cons (posSum pass)(cons (negSum pass) nil)))

(negList '(1 2 3 -1 -2 -3))


