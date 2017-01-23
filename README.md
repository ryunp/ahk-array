# array_
## Conversion of JavaScript's Array methods to AutoHotkey


AHK supports functors but no built in functions for functional style operations. Funky. JavaScript's Array object has some nice methods; so I stole them.

Since AHK is also prototypical in nature, these could have been added to a base object. But that didn't happen for simplicities sake, they are all prefixed with `array_`.

### Stolen Methods

* concat
* every
* fill
* filter
* find
* findIndex
* forEach
* includes
* indexOf
* join
* lastIndexOf
* map
* reduce
* reduceRight
* reverse
* shift
* slice
* some
* splice
* toString
* unshift

### Sort?
Considered implementing a `array_sort` quicksort; but currently no immediate need.

### Tests
Nothing is truely complete without testing, so each array_<method> has a test case file in the `tests/` directory.

Built a few primitive [test classes](test_suite/tester.ahk) to collect test cases. Management of this test class is located in [testrunner.ahk](testrunner.ahk). Results are output to an edit control in a new window.

Sample of [test runner results](testrunner_results.txt):

    01/22/17 - 19:23:53
    -Conversion of JavaScript's Array methods to AutoHotkey-
    
    array_some(array, callback)
    [PASS] Detect one even number
    [PASS] Detect one odd number
    [PASS] Fails to find large enough number
    
    array_splice(ByRef array, start, deleteCount:=-1, args*)
    [PASS] Starting position only: array
    [PASS] Starting position only: spliced
    [PASS] Starting position with delete: array
    [PASS] Starting position with delete: spliced
    [PASS] Starting position no delete: array
    [PASS] Starting position no delete: spliced
    [PASS] Starting position with delete and args: array
    [PASS] Starting position with delete and args: spliced
    [PASS] Starting position no delete and args: array
    [PASS] Starting position no delete and args: spliced