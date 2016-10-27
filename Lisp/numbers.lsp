(defun mySum (pass)
	(cond ((equal pass nil) 0)
		  (t (+ (car pass) (mySum (cdr pass))))))

(defun mySize (pass)
	(cond ((equal pass nil) 0)
		  (t (+ 1 (mySize (cdr pass))))))
		
(defun myAvg (pass)
	(/ (mySum pass) (mySize pass)))