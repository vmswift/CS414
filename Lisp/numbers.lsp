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
