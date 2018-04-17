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

	getAllTestResults() {

		FormatTime, CurrentDateTime,, MM/dd/yy - HH:mm:ss
		results := [CurrentDateTime, this.title, ""]

		for i, tests in this.groups
			results.push(tests.getTestResults())

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

	getTestResults() {

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