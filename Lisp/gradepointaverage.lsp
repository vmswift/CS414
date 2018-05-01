;CS414 Student Grades and Averages assignment
;By John Knowles
;Due November 30, 2016

;returns size of list. reused code
(defun mySize (pass)
	(cond ((null pass) 0)
		  (t (+ 1 (mySize (cdr pass))))))
		  
		  
;total number of points
(defun addPoint (ds)
	(cond 	((null ds) 0)
			(t(+ (car(cdr(car ds))) (addPoint (cdr ds))))))
			
			
;multiply hours and grade and add with other classes taken
(defun addMultiply (ds)
	(cond 	((null ds) 0)
			(t(+ (*(car (cdr (car ds)) ) (car(cdr(cdr(car ds))))) (addMultiply (cdr ds))))))
			
			
;returns list with name and gpa of a student
(defun gradeAvgStudent (ds)
	(cond	((null ds) ())
			((equal (car (car ds)) 'name) (cons (car ds) (gradeAvgStudent (cdr ds))))
			(t(cons (cons 'gpa (cons (/ (addMultiply ds)(addPoint ds))()))()))))
			
			
;gpa list of all students
(defun avgAllStudents (ds)
	(cond	((null ds) ())
			(t(cons (gradeAvgStudent (car ds)) (avgAllStudents (cdr ds))))))
			
			
;returns a property in the list. reused code
(defun getprop (ds val)
	(cond	((null ds) 0)
			((equal (car ds) val)(car(cdr ds)))
			(t(getprop (cdr ds) val))))

			
;adds up the avg of every student...must pass in avgAllStudents to work right
(defun classAvgTotal (ds)
	(cond	((null ds) 0)
			(t(+ (getprop (car (cdr (car ds))) 'gpa)(classAvgTotal (cdr ds))))))


;returns average for the entire class			
(defun classAvg (ds)
	(cond	((null ds) 0)
			(t(/ (classAvgTotal ds)(mySize ds)))))