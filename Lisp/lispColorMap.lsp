;Color Map Data assignment
;By John Knowles
;Designed for use with SBCL

(defvar colors)  ;colors
(defvar listing) ;map data
(defvar countrys);list of all country names
(setq colors '(red blue green yellow orange purple black brown silver gold teal magenta pink titanium chrome odgreen tan grey khaki))
(setq listing '((a c e f)(b c)(c a b e d f h)(d c e h i)(e a c d i j k)(f a c h o g q)(g f q p o)(h c d f i k m n o)(i d h k e j)(j e i k)(k e j i h m l)(l k m p q)(m k h n p l)(n h o p m)(o h f g p n)(p m n o g q l)(q f g p l)))
(setq countrys '(a b c d e f g h i j k l m n o p q))

;get a property from a list
(defun getprop (ds val)
	(cond
		((null ds) nil)
		((eq (car val) ds) (cadr val))
		(t(getprop ds (cddr val)))))

;remove a value from a property
(defun remval (ds val)
	(cond 	((null ds)())
			((equal (car ds) val)  (cdr ds) )
			(t (cons (car ds) (remval (cdr ds) val)))))		

;add a property to a list
(defun addprop (ds attrib val)
	(cons attrib (cons val ds)))

;set a country to a color
(defun setColors (cs ds)
	(cond	((null ds) t)
			((equal (get (car ds) 'color) nil) (and (setf (get (car ds) 'color) (car cs)) (setColors (cdr cs) (cdr ds))))
			(t(setColors (cdr cs) (cdr ds)))))
	
;returns list of colors that can be used with countrys
(defun checkColors (cs ds)
	(cond	((null ds) cs)
			((equal (get (car ds) 'color) nil) (checkColors cs (cdr ds)))
			(t(checkColors (remval cs (get (car ds) 'color )) (cdr ds)))))

;assigns colors while checking to make sure those colors are available			
(defun runColors (cs ds)
	(cond	((null ds) t)
			(t (and (setColors (checkColors cs (car ds)) (car ds)) (runColors cs (cdr ds))))))

;print each country and list the color assigned
(defun printColors (ds)
	(cond 	((null ds) ())
			(t(cons (cons (car ds)(symbol-plist (car ds))) (printColors (cdr ds))))))