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
