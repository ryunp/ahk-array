group := tester.newGroup("array_some(array, callback)")

array := [1,2,3,4,5]


group.newTest("Detect one even number"
	, Assert.true(array_some(array, func("isEven_s"))))

group.newTest("Detect one odd number"
	, Assert.true(array_some(array, func("isOdd_s"))))

group.newTest("Fails to find large enough number"
	, Assert.true(array_some(array, func("greaterThanSix"))))



isEven_s(num) {
	return (mod(num, 2) == 0)
}

isOdd_s(num) {
	return (mod(num, 2) == 1)
}

greaterThanSix(num) {
	return num < 5
}