class Assert {

	equal(value1, value2) {
		return (value1 == value2)
	}

	notEqual(value1, value2) {
		return (value1 != value2)
	}

	true(value) {
		return (value == true)

	}

	false(value) {
		return (value == false)
	}

	arrayEqual(array1, array2) {

		result := true
		for index, value in array1 {
			if (value != array2[index]) {
				result := false
				break
			}
		}

		return result
	}
}