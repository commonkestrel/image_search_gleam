import gleam/option
import gleam/hackney
import gleam/http
import gleam/http/request
import gleam/io
import gleam/result.{try}
import gleam/string
import gleam/uri
import simplifile
import image_search/image
import image_search/parse
import image_search/query

const base_url: String = "https://www.google.com/search?udm=2&q="

pub opaque type Error {
  Request
  Response(hackney.Error)
}

pub fn urls(query: query.Query) -> Result(String, Error) {
  let limit = query.limit
  use url <- try(
    build_url(query)
    |> uri.parse()
    |> result.map_error(fn(_) { Request }),
  )

  use req <- try(
    request.from_uri(url)
    |> result.map_error(fn(_) { Request }),
  )

  use response <- try(
    req
    |> request.set_header(
      "user-agent",
      "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36",
    )
    |> hackney.send
    |> result.map_error(fn(err) { Response(err) }),
  )

  io.debug(response.status)
  Ok(response.body)
}

fn build_url(search: query.Query) -> String {
  let url = base_url <> search.keywords
  let params = query.format_parameters(search)

  case string.length(params) {
    0 -> url
    _ -> url <> "&tbs=ic:specific" <> params
  }
}

pub fn main() {
  // let assert Ok(body) =
  //   query.new("cats")
  //   |> query.with_color(option.Some(query.Pink))
  //   |> urls

  // let assert Ok(json) = parse.isolate_json(body)

  // let path = "./source.json"
  // let assert Ok(_) = json |> simplifile.write(to: path)

  io.debug(find("hello world", "wor", Leading))
  case find("hello world", "word", Leading) {
    Error(_) -> io.println("no match")
    Ok(str) -> io.println("matched: " <> str)
  }
}

@external(erlang, "string", "find")
fn find(source: String, substring: String, dir: Direction) -> Result(String, Nomatch)

type Direction {
  Leading
  Trailing
}

type Nomatch {
  Nomatch
}
