group := tester.newGroup("array_findIndex(array, callback)")

array := [10,22,"ca",334,45,"d"]
array2 := [10,22,123,334,45,"d"]


group.newTest("Successful item lookup"
	, Assert.equal(3, array_findIndex(array, func("findIndexCallback"))))

group.newTest("Unsuccessful item lookup"
	, Assert.equal(0, array_findIndex(array2, func("findIndexCallback"))))



findIndexCallback(element, index, array) {
	return (element = "ca")
}