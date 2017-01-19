# array_
## Conversion of JavaScript's Array methods to AutoHotkey


AHK supports functors but no built in functions for functional style operations. Funky. JavaScript's Array object has some nice methods so I stole them.

Now, since AHK is also prototypical in nature, these could have been added to a base object. But that didn't happen for simplicities sake, they are all prefixed with `array_`.

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


### Tests
Nothing is truely complete without testing, so each array_<method> has a test case in `tests/`

Primitive little test_suite system, output is simply put in an edit control.

Sample of array_slice results:

    array_slice(array, start:=0, end:=0)
    [PASS] No args
    [PASS] Positive start
    [PASS] Positive start & end
    [PASS] Negative start
    [PASS] Negative start & end

### Sort?
Considered implementing a `array_sort` quicksort; but currently no immediate need.
