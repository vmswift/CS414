(defun mySum (pass)
	(cond ((NULL pass) 0)
		  (t (+ (car pass) (mySum (cdr pass))))))

(defun mySize (pass)
	(cond ((NULL pass) 0)
		  (t (+ 1 (mySize (cdr pass))))))
		
(defun myAvg (pass)
	(/ (mySum pass) (mySize pass)))

(defun negList (pass)
	(cond ((NULL pass) ())
		   ((> (car pass) 0) (negList (cdr pass)))
		   (t (cons (car pass) (negList (cdr pass))))))

(defun posList (pass)
	(cond ((NULL pass) ())
		   ((< (car pass) 0) (posList (cdr pass)))
		   (t (cons (car pass) (posList (cdr pass))))))
		   
(defun posSum (pass)
	(mySum (posList pass)))

(defun negSum (pass)
	(mySum (negList pass)))

(defun negAvg (pass)
	(myAvg (negList pass)))

(defun posAvg (pass)
	(myAvg (posList pass)))
	
(defun sumPosNeg (pass)
	(cons (posSum pass)(cons (negSum pass) nil)))