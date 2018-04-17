# array_
## Conversion of JavaScript's Array methods to AutoHotkey

Despite AutoHotKey (1.1.28 at the moment) supporting Arrays and Function Objects, there are no handy built-in methods for parsing Array data. This project ports most of JavaScript's Array object methods over to AutoHotKey.

### Ported Methods
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
* sort
* splice
* toString
* unshift


### Installation
There are two options for using importing these functions, either as global functions stored in **array_.ahk** or by extending the built-in Array object stored in **array_base.ahk**. The sorting function in both files depends on the object defined in **array_quicksort.ahk**. This object must be present for sorting to work properly.

Some dislike extending built-in objects. For that reason **array_base.ahk**'s base object does not automatically extend Array. Extending Array, or a custom collections object, is left to the implementer (See _**Extend Array Object**_  below).

### Usage
_**As Global Functions**_  
**array_.ahk** contains each ported function as global function delcarations in the form of *array_<func>*. The input array is always located in the first parameter position.

Usage: `array_<fn>(array[, params*])`
```autohotkey
#include array_.ahk

arrayInt := [1, 5, 10]
arrayObj := [{"name": "bob", "age": 22}, {"name": "tom", "age": 51}]

; Map to doubled value
array_map(arrayInt, func("double")) ; Output: [2, 10, 20]
double_int(int) {
    return int * 2
}

; Map to object property
array_map(arrayObj, func("get_name")) ; Output: ["bob", "tom"]
get_name(obj) {
    return obj.name
}
```

_**Extend Array Object**_  
**array_base.ahk** contains each ported function as a method of a single object.

Usage: `Array.<fn>([params*])`
```autohotkey
#include array_base.ahk

; Extend Array object, see array_base.ahk for more details
Array(prms*) {
    prms.base := _Array
    return prms
}

arrayInt := [1, 5, 10]
arrayObj := [{"name": "bob", "age": 22}, {"name": "tom", "age": 51}]

; Map to doubled value
arrayInt.map(func("double")) ; Output: [2, 10, 20]
double_int(int) {
    return int * 2
}

; Map to object property
arrayObj.map(func("get_name")) ; Output: ["bob", "tom"]
get_name(obj) {
    return obj.name
}
```

_**Sorting**_  
**array_quicksort.ahk** contains the sorting logic. The quicksort behavior is wrapped in a callable function object to avoid cluttering the global namespace.

Indireect Usage: `array_sort(array, [params*])` or `array.sort([params*])`  
Direct Usage: `Array_Quicksort.Call(array, [params*])`
```autohotkey
arrayInt := [11,9,5,10,1,6,3,4,7,8,2]

array_sort(arrayInt) ; Output: [1,2,3,4,5,6,7,8,9,10,11]
arrayInt.sort()      ; Output: [1,2,3,4,5,6,7,8,9,10,11]

; Each library function facades to the same invocation below
Array_Quicksort.Call(arrayInt)
```

JavaScript does not expose start/end or left/right parameters and neither does this sort function. Exposing them in these project files would be fairly easy, but doing so may produce unintuitive use cases when desiring the default comparator behavior.
The QuickSort object is outlined below:

```autohotkey
Class Array_QuickSort {
    ; Core sorting logic
    _compare_alphanum(a, b)
    _sort(array, compare_fn, left, right)
    _partition(array, compare_fn, left, right)
    _swap(array, idx1, idx2)

    ; AHK specific calling behavior for function object
    Call(array, compare_fn:=0)
    __Call(method, args*)
}
```

### Tests
A quick and dirty test suite was crafted to make sure these were functioning properly. Each function/method has a test case in the **/tests/** directory. The test runner UI has two tabs representing each library's test results:

![Tester Results Screenshot](tester/ui_preview.png)
