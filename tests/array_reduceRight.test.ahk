group := tester.newGroup("array_reduceRight(array, callback, initialValue:='IAMNULL')")

names := ["bob", "tom", "morty", "rick"]
array := [1,2,3,6,4,5]
array2 := [{"name": names[4], "age": 22}
	, {"name": names[3], "age": 51}
	, {"name": names[2], "age": 15}
	, {"name": names[1], "age": 55}]


group.newTest("Add all values of array"
	, Assert.equal(21, array_reduceRight(array, func("addition_fr"))))

group.newTest("Find maximum value of array"
	, Assert.equal(6, array_reduceRight(array, func("maximum_fr"))))

group.newTest("Add all values of array to initial value"
	, Assert.equal(41, array_reduceRight(array, func("addition_fr"), 20)))

group.newTest("Add a integer property of all objects"
	, Assert.equal(143, array_reduceRight(array2, func("addObjAge_fr"), 0)))

group.newTest("Add a string property of all objects into an array"
	, Assert.arrayEqual(names, array_reduceRight(array2, func("pushObjName_fr"), [])))



addition_fr(a, b) {
	return a + b
}

maximum_fr(max, cur) {
	return ((max > cur) ? max : cur)
}

addObjAge_fr(total, obj) {
	return total + obj.age
}

pushObjName_fr(names, obj) {
	names.push(obj.name)
	return names
}