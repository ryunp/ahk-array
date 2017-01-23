# array_
## Conversion of JavaScript's Array methods to AutoHotkey


AHK supports [objects](https://autohotkey.com/docs/objects/Object.htm), [arrays](https://autohotkey.com/docs/Objects.htm#Table_of_Contents), and [function objects](https://autohotkey.com/docs/objects/Functor.htm). But it lacks built in methods for functional operation on arrays, like `Array.map()`. JavaScript's Array object has some handy methods; so I ported them over.

Since AHK is also prototypical in nature, these could have been added to a base object. For simplicity's sake these are global functions. All methods are prefixed with `array_`.

### Usage

Just include the `array_.ahk` file and pass functors as arguments when needed. For instance, to double all values in an array:

    array := [1,2,3,4]
    result := array_map(array, func("double"))
    double(item) {
    	return item * 2
    }
    msgbox % array_toString(result) ;outputs "[2,4,6,8]"

or getting fancy with a partial:

    array := [12,3,44,9]
    result := array_map(array, func("multiply").bind(2))
    multiply(a, b) {
    	return a * b
    }
    msgbox % array_toString(result) ;outputs "[24,6,88,18]"
    

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
Nothing is truely complete without testing, so each `array_<method>` has a test case file in the `tests/` directory.

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