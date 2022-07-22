exception Fail

let hello () = print_endline "hello"

let run () =
  hello ();
  raise Fail
