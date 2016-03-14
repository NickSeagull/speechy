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

(defmacro before [&rest function-body]
  `[setUp
   (fn [self]
      ~@function-body)])

(defmacro after [&rest function-body]
  `[tearDown
   (fn [self]
      ~@function-body)])

(defmacro before-all [&rest function-body]
    `[setUpClass
      (with-decorator classmethod
        (fn [self]
          ~@function-body))])

(defmacro after-all [&rest function-body]
    `[tearDownClass
     (with-decorator classmethod
     (fn [self]
        ~@function-body))])

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

(defmacro should-raise [exception function-name &rest args &kwargs keywords]
  `(.assertRaises self ~exception ~function-name ~args ~keywords msg))

(defmacro should-raise-and-match-regex [exception regex function-name &rest args &kwargs keywords]
  `(.assertRaisesRegex self ~exception ~regex ~function-name ~args ~keywords msg))

(defmacro should-warn [exception function-name &rest args &kwargs keywords]
  `(.assertWarns self ~exception ~function-name ~args ~keywords msg))

(defmacro should-warn-and-match-regex [exception regex function-name &rest args &kwargs keywords]
  `(.assertWarnsRegex self ~exception ~function-name ~args ~keywords msg))

(defmacro should-log [logger level]
  `(.assertLogs self ~logger ~level msg))

(defmacro should-be-almost-equal [a b]
  `(.assertAlmostEqual self ~a ~b msg))

(defmacro should-not-be-almost-equal [a b]
  `(.assertNotAlmostEqual self ~a ~b msg))

(defmacro should-be-greater [a b]
  `(.assertGreater self ~a ~b msg))

(defmacro should-be-greater-or-equal [a b]
  `(.assertGreaterEqual self ~a ~b msg))

(defmacro should-be-less [a b]
  `(.assertLess self ~a ~b msg))

(defmacro should-be-less-or-equal [a b]
  `(.assertLessEqual self ~a ~b msg))

(defmacro should-match-regex [string regex]
  `(.assertRegex self ~string ~regex msg))

(defmacro should-not-match-regex [string regex]
  `(.assertNotRegex self ~string ~regex msg))

(defmacro should-be-equal-in-count [a b]
  `(.assertCountEqual self ~a ~b msg))

(defmacro fail []
  `(.fail self msg))
