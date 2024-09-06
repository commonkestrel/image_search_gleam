// import gleam/io
// import gleam/result.{try}
// import gleam/string

// pub fn isolate_json(source: String) -> Result(String, Nil) {
//   let source_length = string.length(source)
//   use start <- try(rfind(source, "var m={"))
  
//   use script_start <- try(
//     string.slice(source, start, source_length)
//     |> find("var a=m")
//   )
  
//   use script_end <- try(
//     string.slice(source, script_start + start, source_length)
//     |> rfind(";")
//   )

//   let body = string.slice(source, script_start, script_end - script_start)

//   Ok(body)
// }

// type Direction {
//   Leading
//   Trailing
// }

// @external(erlang, "string", "find")
// fn find(source: String, substring: String, dir: Direction) -> String
