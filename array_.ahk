; https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/concat
array_concat(arrays*) {

	new_array := []

	for _, array in arrays
		for _, element in array
			new_array.push(element)

	return new_array
}


; https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/every
array_every(array, callback) {

	for index, element in array
		if not callback.Call(element, index, array)
			return false

	return true
}


; https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/fill
array_fill(array, value, start:=0, end:=0) {

	len := array.Length()

	; START: Adjust 1 based index, check signage, set defaults
	if (start > 0)
		beg := start - 1    ; Include starting index going forward
	else if (start < 0)
		beg := len + start  ; Count backwards from end
	else
		beg := start


	; END: Check signage and set defaults
	if (end > 0)
	    last := end
	else if (end < 0)
		last := len + end   ; Count backwards from end
	else
		last := len


	loop, % (last - beg)
		array[beg + A_Index] := value
}


; https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter
array_filter(array, callback) {
	
	new_array := []

	for index, element in array
		if (callback.Call(element, index, array))
			new_array.push(element)

	return new_array
}


; https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/fill
; Modified to return 0 instead of 'undefined'
array_find(array, callback) {
	
	for index, element in array
		if (callback.Call(element, index, array) = true)
			return element

	return 0
}


; https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/findIndex
array_findIndex(array, callback) {

	for index, value in array
		if (callback.Call(value, index, array))
			return index

	return 0
}



; https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach
array_forEach(array, callback) {

	for index, element in array
		callback.Call(element, index, array)
}


; https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/includes
array_includes(array, searchElement, fromIndex:=0) {

	return array_indexOf(array, searchElement, fromIndex) > 0 ? true : false
}


; https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/indexOf
array_indexOf(array, searchElement, fromIndex:=0) {
	
	len := array.Length()

	if (fromIndex > 0)
		start := fromIndex - 1    ; Include starting index going forward
	else if (fromIndex < 0)
		start := len + fromIndex  ; Count backwards from end
	else
		start := fromIndex


	loop, % len - start
		if (array[start + A_Index] = searchElement)
			return start + A_Index

	return 0
}


; https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/join
array_join(array, delim) {
	
	str := ""
	
	for index, element in array
		str .= element (index < array.Length() ? delim : "")

	return str
}

; https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/lastIndexOf
; "if the provided index is negative, the array is still searched from front to back"
;   - Are we not able to return the first found starting from the back?
array_lastIndexOf(array, searchElement, fromIndex:=0) {
	
	len := array.Length()
	foundIdx := -1

	if (fromIndex > len)
		return foundIdx

	if (fromIndex > 0)
		start := fromIndex - 1    ; Include starting index going forward
	else if (fromIndex < 0)
		start := len + fromIndex  ; Count backwards from end
	else
		start := fromIndex

	loop, % len - start
		if (array[start + A_Index] = searchElement)
			foundIdx := start + A_Index

	return foundIdx
}


; https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map
array_map(array, callback) {

	new_array := []

	for index, element in array
		new_array.push(callback.Call(element, index, array))

	return new_array
}


; https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/reduce
array_reduce(array, callback, initialValue:="IAMNULL") {

	indexOffset := 0
	arrLen := array.Length()

	; No initialValue passed
	if (initialValue == "IAMNULL") {


		if (arrLen < 1) {
			throw "Empty array with no intial value, derp"
		}
		else if (arrLen == 1) {
			return array[1]
		}
		else {
			indexOffset := 1
			initialValue := array[1]
		}

	} else {
	; Have initialValue

		if (arrLen == 0) {
			return initialValue
		}
	}

	; if no initialValue is passed, reduce passed array starting at second
	; index. Otherwise use initialValue as reduction target and start at array's
	; first index.
	Loop, % (arrLen - indexOffset)
	{
		adjIndex := A_Index + indexOffset
		initialValue := callback.Call(initialValue, array[adjIndex], adjIndex, array)
	}
	
	return initialValue
}


; https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/reduceRight
array_reduceRight(array, callback, initialValue:="IAMNULL") {

	arrLen := array.Length()

	; No initialValue passed
	if (initialValue == "IAMNULL") {


		if (arrLen < 1)
			throw "Empty array with no intial value, derp"
		else if (arrLen == 1)
			return array[1]

		initialValue := array[arrLen]

		; Loop n-1 times (skip last element)
		Loop, % (arrLen - 1)
		{
			; 1 based index notation skips last element
			adjIndex := arrLen - A_Index
			initialValue := callback.Call(initialValue, array[adjIndex], adjIndex, array)
		}

	} else {
	; Have initialValue

		if (arrLen == 0)
			return initialValue

		Loop, % (arrLen)
		{
			; Equalize 1 based index notation to start at last element
			adjIndex := arrLen - (A_Index - 1)
			initialValue := callback.Call(initialValue, array[adjIndex], adjIndex, array)
		}
	}	
	
	return initialValue
}


; https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/reverse
array_reverse(array) {

	arrLen := array.Length()

	Loop, % (arrLen // 2)
	{
		idxFront := A_Index
		idxBack := arrLen - (A_Index - 1)

		tmp := array[idxFront]
		array[idxFront] := array[idxBack]
		array[idxBack] := tmp
	}

	return array
}


; https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/shift
array_shift(array) {

	return array.RemoveAt(1)
}


; https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/slice
array_slice(array, start:=0, end:=0) {

	len := array.Length()

	; start: Adjust 1 based index, check signage, set defaults
	if (start > 0)
		begin := start - 1    ; Include starting index going forward
	else if (start < 0)
		begin := len + start  ; Count backwards from end
	else
		begin := start


	; END: Check signage and set defaults
	; MDN States: "to end (end not included)" so subtract one from end
	if (end > 0)
	    last := end - 1
	else if (end < 0)
		last := len + end + 1 ; Count backwards from end
	else
		last := len


	new_array := []

	loop, % len - begin
		new_array.push(array[begin + A_Index])

	return new_array
}


; https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/some
array_some(array, callback) {

	for index, value in array
		if callback.Call(value, index, array)
			return true

	return false
}


; https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/sort
array_sort(array, callback) {

	;Quicksort

}


; https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/splice
array_splice(ByRef array, start, deleteCount:=-1, args*) {

	arrLen := array.Length()
	exiting := []

	; Determine starting index
	if (start > arrLen)
		start := arrLen

	if (start < 0)
		start := arrLen + start

	; deleteCount unspecified or out of bounds, set count to start through end
	if ((deleteCount < 0) || (arrLen <= (start + deleteCount))) {
		deleteCount := arrLen - start + 1
	}

	; Remove elements
	Loop, % deleteCount
	{
		exiting.push(array[start])
		array.RemoveAt(start)
	}

	; Inject elements
	Loop, % args.Length()
	{
		curIndex := start + (A_Index - 1)

		array.InsertAt(curIndex, args[1])
		args.removeAt(1)
	}

	return exiting
}


; https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/toString
array_toString(array) {

	str := "["

	for i,v in array
		str .= v (i < array.Length() ? ", " : "")
	
	return str "]"
}


; https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/unshift
array_unshift(array, args*) {

	for index, value in args
		array.InsertAt(A_Index, value)

	return array.Length()
}