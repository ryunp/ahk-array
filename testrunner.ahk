; Include lib to test
#Include, array_.ahk


; Include test classes
#Include, test_suite\assert.ahk
#Include, test_suite\tester.ahk


; Create test object for tests to use
tester := new TestRunner("-Conversion of JavaScript's Array methods to AutoHotkey-")


; Include test cases
#Include, tests\
#Include, _common.ahk
#Include, array_concat.test.ahk
#Include, array_every.test.ahk
#Include, array_fill.test.ahk
#Include, array_filter.test.ahk ; <
#Include, array_find.test.ahk
#Include, array_findIndex.test.ahk
#Include, array_forEach.test.ahk
#Include, array_includes.test.ahk
#Include, array_join.test.ahk
#Include, array_lastIndexOf.test.ahk
#Include, array_map.test.ahk
#Include, array_reduce.test.ahk
#Include, array_reduceRight.test.ahk
#Include, array_reverse.test.ahk
#Include, array_slice.test.ahk
#Include, array_some.test.ahk
#Include, array_splice.test.ahk
#Include, array_unshift.test.ahk

; Show results
gui, add, edit, r30, % tester.getAllTestResults()
gui, show

return

GuiClose:
	ExitApp
Return