# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require "rest-client"


medium_raw = RestClient.get "https://api.themoviedb.org/3/movie/30508?api_key=8081155eac22e256dfac70b9d7913b13&language=en-US"
medium = JSON.parse(medium_raw)

## BERLIN CALLING ##

Medium.create(
  title: medium["title"],
  runtime: medium["runtime"],
  genres: medium["genres"][0]["name"], # medium["genres"][1]["name"] medium["genres"][2]["name"]
  description: medium["overview"],
  language: medium["original_language"],
  rating: medium["vote_average"],
  # media_type: medium["notthere"],
  imdb_id: medium["imdb_id"],
  # total_seasons: medium["notthere"],
  tmdb_id: medium["id"],
  origin_country: medium["production_countries"][0]["iso_3166_1"],
  first_air_date: medium["release_date"],
  # last_air_date: medium["release_date"]
  poster: "http://image.tmdb.org/t/p/w500///" + medium["poster_path"],
)


# medium_raw = RestClient.get "https://api.themoviedb.org/3/movie/30508?api_key=8081155eac22e256dfac70b9d7913b13&language=en-US"
# medium = JSON.parse(medium_raw)
