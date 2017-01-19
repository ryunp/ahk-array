group := tester.newGroup("array_forEach(array, callback)")

global sum := 0


array_forEach([1,2,3,4,5], func("addToSum"))
group.newTest("Act on global variable for result"
	, Assert.equal(1+2+3+4+5, sum))

; object scenario
objs := [{msg: "bye"}, {msg: "nope"}]
array_forEach(objs, func("setMsgToHi"))
array := []
for i,obj in objs
	array.push(obj.msg)
group.newTest("Change property of each object"
	, Assert.arrayEqual(["hi", "hi"], array))



addToSum(int) {
	sum += int
}

setMsgToHi(element, index, array) {
	array[index].msg := "hi"
}