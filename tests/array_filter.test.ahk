group := tester.newGroup("array_filter(array, callback)")

array := [1,2,3,4,5,6]


group.newTest("Collect even numbers"
	, Assert.arrayEqual([2,4,6], array_filter(array, func("isEvenFilter"))))


group.newTest("Collect odd numbers"
	, Assert.arrayEqual([1,3,5], array_filter(array, func("isOddFilter"))))



isEvenFilter(element, index, array) {
	return (mod(element, 2) = 0)
}

isOddFilter(element, index, array) {
	return (isEvenFilter(element, index, array) = false)
}