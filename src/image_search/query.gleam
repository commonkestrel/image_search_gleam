import gleam/option.{type Option, None, Some}

pub type Query {
  Query(
    keywords: String,
    limit: Option(Int),
    color: Option(Color),
    color_type: Option(ColorType),
    license: Option(License),
    image_type: Option(ImageType),
    time: Option(Time),
    ratio: Option(Ratio),
    format: Option(Format),
  )
}

pub fn new(keywords: String) -> Query {
  Query(
    keywords,
    limit: None,
    color: None,
    color_type: None,
    license: None,
    image_type: None,
    time: None,
    ratio: None,
    format: None,
  )
}

pub fn with_limit(query: Query, limit: Option(Int)) -> Query {
  Query(
    keywords: query.keywords,
    limit: limit,
    color: query.color,
    color_type: query.color_type,
    license: query.license,
    image_type: query.image_type,
    time: query.time,
    ratio: query.ratio,
    format: query.format,
  )
}

pub fn with_color(query: Query, color: Option(Color)) -> Query {
  Query(
    keywords: query.keywords,
    limit: query.limit,
    color: color,
    color_type: query.color_type,
    license: query.license,
    image_type: query.image_type,
    time: query.time,
    ratio: query.ratio,
    format: query.format,
  )
}

pub fn format_parameters(query: Query) -> String {
  fmt_color(query.color)
  <> fmt_color_type(query.color_type)
  <> fmt_license(query.license)
  <> fmt_image_type(query.image_type)
  <> fmt_time(query.time)
  <> fmt_ratio(query.ratio)
  <> fmt_fmt(query.format)
}

pub type Color {
  Red
  Orange
  Yellow
  Green
  Teal
  Blue
  Purple
  Pink
  White
  Gray
  Black
  Brown
}

fn color_to_string(color: Color) -> String {
  case color {
    Red -> "red"
    Orange -> "orange"
    Yellow -> "yellow"
    Green -> "green"
    Teal -> "teal"
    Blue -> "blue"
    Purple -> "purple"
    Pink -> "pink"
    White -> "white"
    Gray -> "gray"
    Black -> "black"
    Brown -> "brown"
  }
}

fn fmt_color(color: Option(Color)) -> String {
  case color {
    Some(c) -> ",isc:" <> color_to_string(c)
    None -> ""
  }
}

pub type ColorType {
  Color
  Grayscale
  Transparent
}

fn color_type_to_string(color_type: ColorType) -> String {
  case color_type {
    Color -> "full"
    Grayscale -> "gray"
    Transparent -> "trans"
  }
}

fn fmt_color_type(color_type: Option(ColorType)) -> String {
  case color_type {
    Some(c) -> ",ic:" <> color_type_to_string(c)
    None -> ""
  }
}

pub type License {
  CreativeCommons
  Other
}

fn license_to_string(license: License) -> String {
  case license {
    CreativeCommons -> "cl"
    Other -> "ol"
  }
}

fn fmt_license(license: Option(License)) -> String {
  case license {
    Some(l) -> ",il:" <> license_to_string(l)
    None -> ""
  }
}

pub type ImageType {
  Face
  Photo
  Clipart
  Lineart
  Animated
}

fn image_type_to_string(image_type: ImageType) -> String {
  case image_type {
    Face -> "face"
    Photo -> "photo"
    Clipart -> "clipart"
    Lineart -> "lineart"
    Animated -> "animated"
  }
}

fn fmt_image_type(image_type: Option(ImageType)) -> String {
  case image_type {
    Some(it) -> ",itp:" <> image_type_to_string(it)
    None -> ""
  }
}

pub type Time {
  Day
  Week
  Month
  Year
}

fn time_to_string(time: Time) -> String {
  case time {
    Day -> "d"
    Week -> "w"
    Month -> "m"
    Year -> "y"
  }
}

fn fmt_time(time: Option(Time)) -> String {
  case time {
    Some(t) -> ",qdr:" <> time_to_string(t)
    None -> ""
  }
}

pub type Ratio {
  Tall
  Square
  Wide
  Panoramic
}

fn ratio_to_string(ratio: Ratio) -> String {
  case ratio {
    Tall -> "t"
    Square -> "s"
    Wide -> "w"
    Panoramic -> "xw"
  }
}

fn fmt_ratio(ratio: Option(Ratio)) -> String {
  case ratio {
    Some(r) -> ratio_to_string(r)
    None -> ""
  }
}

pub type Format {
  Jpg
  Gif
  Png
  Bmp
  Svg
  Webp
  Ico
  Raw
}

fn format_to_string(format: Format) -> String {
  case format {
    Jpg -> "jpg"
    Gif -> "gif"
    Png -> "png"
    Bmp -> "bmp"
    Svg -> "svg"
    Webp -> "webp"
    Ico -> "ico"
    Raw -> "raw"
  }
}

// I know this should be `fmt_format` but the opportunity was too good to pass up
fn fmt_fmt(fmt: Option(Format)) -> String {
  case fmt {
    Some(f) -> ",ift:" <> format_to_string(f)
    None -> ""
  }
}
