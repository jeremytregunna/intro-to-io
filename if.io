if := method(c,
  call argAt(1) isNil ifTrue(return (c != nil and c != false)) # if() then() ... form
  (c != nil and c != false) ifTrue(return call evalArgAt(1)) ifFalse(return call evalArgAt(2))
)
Object then := nil
Object else := nil
true then := method(call evalArgAt(0); self)
true else := true
false then := false
false else := method(call evalArgAt(0); self)

if(42 == 23) then(
  "forty two is equal to 23" println
) else(
  "forty two is not equal to 23" println
)
