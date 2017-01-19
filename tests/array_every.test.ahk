/**
 *   array_every(callback, array)
 *
 *   JavaScript signature is (callback, array, thisArg). 'thisArg' doesn't
 *   directly translate into AHK. There is no way to cleanly capture a method's
 *   reference manually without objBindMethod, which is why the 3rd parameter is
 *   unnecessary.
 */
group := tester.newGroup("array_every(array, callback)")

array_even := [2,4,6]
array_odd := [1,2,4,6]

cheater := new Cheating(false)
boundFn := objBindMethod(cheater, "isKindaEven")


group.newTest("Function object"
	, Assert.true(array_every(array_even, func("isEven"))))

group.newTest("Bound function object"
	, Assert.false(array_every(array_odd, boundFn)))

cheater.setCheating(true)
group.newTest("Bound function object"
	, Assert.true(array_every(array_odd, boundFn)))



isEven(element, index, array) {
	return (mod(element, 2) = 0)
}

class Cheating {

	one_ok := true

	__New(state) {
		this.one_ok := state
	}

	setCheating(state) {
		this.one_ok := state
	}

	isKindaEven(element, index, array) {

		if (element = 1)
			if this.one_ok
				return true

		return (mod(element, 2) = 0)
	}
}