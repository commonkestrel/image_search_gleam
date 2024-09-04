import gleam/io
import gleam/string
import image_search/image
import image_search/parse
import image_search/query

const base_url: String = "https://www.google.com/search?udm=2&q="

pub fn urls(query: query.Query) -> Result(List(String), Nil) {
  let limit = query.limit
  let url = build_url(query)

  io.println(url)

  todo
}

fn build_url(search: query.Query) -> String {
  let url = base_url <> search.keywords
  let params = query.format_parameters(search)

  case string.length(params) {
    0 -> url
    _ -> url <> "&tbs=ic:specific" <> params
  }
}
