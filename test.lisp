(load "assert.lisp")

(defun test-suite (tests)
  (loop for test in tests do 
        (unit-test test)))

(defun test (&rest tests)
  (if (member nil tests)
    "Unit testing failed"
    "All tests passing!"))

(defun assertion (name expression)
  (let ((result (funcall expression)))
    (if (not result)
      (print (concatenate 'string name " failed.")))
    result))

(defmacro assert-true (name expression)
  `(assertion ,name (lambda () ,expression)))

(defmacro assert-false (name expression)
  `(assertion, name (lambda () (not ,expression))))

(defmacro assert-equal (name expected actual)
  `(assertion ,name (lambda () (= ,expected ,actual))))

(defmacro assert-not-equal (name left right)
  `(assertion ,name (lambda () (not (= ,left ,right)))))

(defmacro assert-lt (name expected actual)
  `(assertion ,name (lambda () (< ,actual ,expected))))

(defmacro assert-gt (name expected actual)
  `(assertion ,name (lambda () (> ,actual ,expected))))
