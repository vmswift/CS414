(defun mySum (pass)
	(cond ((NULL pass) 0)
		  (t (+ (car pass) (mySum (cdr pass))))))

(defun mySize (pass)
	(cond ((NULL pass) 0)
		  (t (+ 1 (mySize (cdr pass))))))
		
(defun myAvg (pass)
	(/ (mySum pass) (mySize pass)))