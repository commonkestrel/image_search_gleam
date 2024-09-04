import gleam/dynamic
import gleam/json
import gleam/result

pub opaque type Image {
  Image(url: String, width: Int, height: Int, thumbnail: String, source: String)
}

pub fn decode(source: String) -> Result(Image, json.DecodeError) {
  todo
}
