(import unittest)

(defn make-test-class-name [name]
  (-> name
      (.title)
      (.replace " " "")))

(defmacro describe [name &rest cases]
  `(defclass ~(make-test-class-name name) [unittest.TestCase] 
     ~cases))
