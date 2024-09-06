// import image_search/parse
// import gleam/option.{Some}
// import gleeunit
// import image_search
// import image_search/query.{Pink}
// import simplifile

// pub fn main() {
//   gleeunit.main()
// }

// pub fn find_test() {
//   let str = "something"
//   let assert Ok(_) = parse.find(str, "th")
// }

// pub fn url_test() {
//   let assert Ok(body) =
//     query.new("cats")
//     |> query.with_color(Some(Pink))
//     |> image_search.urls()

//   let path = "./search.html"
//   let assert Ok(_) = body |> simplifile.write(to: path)
// }

// pub fn parse_test() {
//   let assert Ok(body) =
//     query.new("cats")
//     |> query.with_color(Some(Pink))
//     |> image_search.urls

//   let assert Ok(json) = parse.isolate_json(body)

//   let path = "./source.json"
//   let assert Ok(_) = json |> simplifile.write(to: path)
// }
