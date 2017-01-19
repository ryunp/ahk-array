group := tester.newGroup("array_reduce(array, callback, initialValue:='IAMNULL')")

names := ["bob", "tom", "morty", "rick"]
array := [1,2,3,6,4,5]
array2 := [{"name": names[1], "age": 22}
	, {"name": names[2], "age": 51}
	, {"name": names[3], "age": 15}
	, {"name": names[4], "age": 55}]


group.newTest("Add all values of array"
	, Assert.equal(21, array_reduce(array, func("addition_f"))))

group.newTest("Find maximum value of array"
	, Assert.equal(6, array_reduce(array, func("maximum_f"))))

group.newTest("Add all values of array to initial value"
	, Assert.equal(41, array_reduce(array, func("addition_f"), 20)))

group.newTest("sum a property of all objects"
	, Assert.equal(143, array_reduce(array2, func("addObjAge_f"), 0)))

group.newTest("Copy a string property of all objects into an array"
	, Assert.arrayEqual(names, array_reduce(array2, func("pushObjName_f"), [])))



addition_f(a, b) {
	return a + b
}

maximum_f(max, cur) {
	return ((max > cur) ? max : cur)
}

addObjAge_f(total, obj) {
	return total + obj.age
}

pushObjName_f(names, obj) {
	names.push(obj.name)
	return names
}