group := tester.newGroup("array_map(array, callback)")

arrayInt := [1, 5, 10]
arrayObj := [{"name": "bob", "age": 22}, {"name": "tom", "age": 51}]


group.newTest("Double integer values"
	, Assert.arrayEqual([2, 10, 20], array_map(arrayInt, func("doubleInt"))))

group.newTest("Strip object down to single property"
	, Assert.arrayEqual(["bob", "tom"], array_map(arrayObj, func("getName"))))



doubleInt(int) {
	return int * 2
}

getName(obj) {
	return obj.name
}