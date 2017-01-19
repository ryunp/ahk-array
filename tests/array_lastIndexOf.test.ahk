group := tester.newGroup("array_lastIndexOf(array, searchElement, fromIndex:=0)")

array := ["a", "b", "c", "d", "d", "d", "e", "e", "f"]
toMatch := "d"


group.newTest("Get matching last index"
	, Assert.equal(6, array_lastIndexOf(array, toMatch)))

group.newTest("Get matching last index with bad starting index"
	, Assert.equal(-1, array_lastIndexOf(array, toMatch, 999)))

group.newTest("Get matching last index with positive starting index "
	, Assert.equal(6, array_lastIndexOf(array, toMatch, 3)))

group.newTest("Get matching last index with negative starting index"
	, Assert.equal(6, array_lastIndexOf(array, toMatch, -5)))