# speechy [![Stories in Ready](https://badge.waffle.io/NickSeagull/speechy.png?label=ready&title=Ready)](https://waffle.io/NickSeagull/speechy)
A TDD/BDD framework for [Hy](http://hylang.org), based heavily on [speclj](https://github.com/slagyr/speclj) which is based on [RSpec](http://rspec.info/)

## Installation

speechy is a wrapper for Python's `unittest` module, it helps to write tests in a more declarative style.

**It is supposed to be submitted to PyPI as soon as a working version comes out.**

# Usage

This example illustrates the basic usage of **speechy**:

```hy
(import unittest)
(require speechy.core)

(describe "A thing to test"
  (it "has the possibility to pass tests"
    (should= 2 (+ 1 1)))
  (it "also has the possibility to fail them"
    (should-not= 3 (- 7 4))))
```

# Right now there's no runner, so, in case you want to run these tests, the most proper way should be by using `hy2py` and running nosetests on the file generated.
