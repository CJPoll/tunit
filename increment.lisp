(load "test.lisp")

(defun increment (x)
  (+ x 1))

(test 
  (assert-true "Test 1" 
               (= 12 (increment 11)))
  (assert-true "Test 2"
               (= 19 (increment 18))))

(test
  (assert-equal "Test 1" 12 (increment 11)))

(test
  (assert-not-equal "Not Equal" 12 (increment 12)))

(test
  (assert-gt "Greater than" 11 (increment 11))
  (assert-false "Less Than" 
                (assert-lt "Less than" 11 (increment 11))))

(test
  (assert-false "Testing false" NIL))
