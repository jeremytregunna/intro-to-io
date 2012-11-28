greeter := Object clone do(
  newSlot("coro"); newSlot("waitingCoro")
  run := method(
    coro = coroDo(
      pause
      names := list("Fred", "Wilma", "Betty", "Barney")
      names foreach(i, name,
        if(i == names size - 1,
          "#{name}" interpolate println
          System exit
        ,
          "#{name}, " interpolate print
        )
        waitingCoro resume
      )
    )
  )
  hello := method(
    "Hello, " print
    setWaitingCoro := Coroutine currentCoro
    coro resume
  )
)
greeter run; greeter hello
# Hello, Fred, Wilma, Betty, Barney
