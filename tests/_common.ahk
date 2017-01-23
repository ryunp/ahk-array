class Person {

	__New(name, age) {
		this.name := name
		this.age := age
	}

	getName() {
		return this.name
	}
	
	getAge() {
		return this.age
	}
}

addition(a, b) {
	return a + b
}

subtract(a, b) {
	return a - b
}

multiply(a, b) {
	return a * b
}

maximum(a, b) {
	return ((a > b) ? a : b)
}

objProp_addition(prop, total, obj) {
	return total + obj[prop]
}

objProp_arrayPush(prop, array, obj) {
	array.push(obj[prop])
	return array
}

objProp_get(prop, obj) {
	return obj[prop]
}