(import unittest)

(defn -make-test-class-name [name]
  (-> name
      (.title)
      (.replace " " "")))

(defn -to-snake-case [string]
  (-> string
      (.lower)
      (.replace " " "_")))

(defn -make-test-case-name [name]
  (+ "test_" (-to-snake-case name)))

(defmacro describe [name &rest cases]
  `(defclass ~(-make-test-class-name name) [unittest.TestCase] 
     ~cases))

(defmacro it [should-message &rest cases]
  [(-make-test-case-name should-message)
         `(fn [self]
           (setv msg ~should-message)
           ~@cases)])

(defmacro should [expression-to-check]
  `(.assertTrue self ~expression-to-check msg))

(defmacro should-not [expression-to-check]
  `(.assertFalse self ~expression-to-check msg))

(defmacro should= [a b]
  `(.assertEqual self ~a ~b msg))

(defmacro should-not= [a b]
  `(.assertNotEqual self ~a ~b msg))

(defmacro should-be [a b]
  `(.assertIs self ~a ~b msg))

(defmacro should-not-be [a b]
  `(.assertIsNot self ~a ~b msg))

(defmacro should-be-none [a]
  `(.assertIsNone self ~a ~b msg))

(defmacro should-not-be-none [a]
  `(.assertIsNotNone self ~a ~b msg))

(defmacro should-be-in [a b]
  `(.assertIn self ~a ~b msg))

(defmacro should-not-be-in [a b]
  `(.assertNotIn self ~a ~b msg))

(defmacro should-be-instance [a b]
  `(.assertIsInstance self ~a ~b msg))

(defmacro should-not-be-instance [a b]
  `(.assertNotIsInstance self ~a ~b msg))

