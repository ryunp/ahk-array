group := tester.newGroup("array_find(array, callback)")


group.newTest("Successful item lookup"
	, Assert.equal(5, array_find([1,2,3,4,5,6], func("isFive"))))

group.newTest("Unsuccessful item lookup"
	, Assert.equal(0, array_find([1,2,3], func("isFive"))))



isFive(element, index, array) {
	return (element = 5)
}