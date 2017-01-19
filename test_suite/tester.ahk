class TestRunner {

	groups := []

	__New(title) {
		this.title := title
	}

	newGroup(title) {

		tests := new TestGroup(title)
		this.groups.push(tests)

		return tests
	}

	getResults() {

		results := [this.title, ""]

		for i, tests in this.groups
			results.push(tests.getResults())

		return array_join(results, "`n")
	}
}


class TestGroup {

	tests := []

	__New(title) {
		this.title := title
	}

	newTest(desc, result) {

		this.tests.push(new Test(desc, result))
	}

	getResults() {

		results := [this.title]

		for i, test in this.tests
			results.push(test.getResult())
		
		return array_join(results, "`n") "`n"
	}
}

class Test {

	__New(desc, result) {
		this.desc := desc
		this.result := result
	}

	getResult() {

		return "[" (this.result ? "PASS" : "----") "] " this.desc
	}
}

/* Depricated
class Tester {
	
	tests := []

	__New(title) {

		this.title := title ? title : "Test Suite"
		this.tests.push(this.title "`n")
	}

	add(desc, result) {

		msgbox adding
		string := "[" (result ? "PASS" : "----") "] " desc
		this.tests.push(string)
	}

	results() {

		return array_join(this.tests, "`n")
	}
}
*/