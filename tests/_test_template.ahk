t := new Tester("func(arg1, arg2)")

; Setup structures here

desc := ""
t.add(desc, Assert.true(1))

msgbox % t.results()