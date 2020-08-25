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
# origin_countries = medium["production_countries"].map.with_index { |country, index| country if index < 1 }


Medium.create(
  title: medium["title"],
  runtime: medium["runtime"],
  genres: medium["genres"].take(3).map { |genre| genre["name"] },
  description: medium["overview"],
  language: medium["original_language"],
  rating: medium["vote_average"],
  # media_type: medium["notthere"],
  imdb_id: medium["imdb_id"],
  # total_seasons: medium["notthere"],
  tmdb_id: medium["id"],
  origin_countries: medium["production_countries"].take(3).map { |country| country["name"] },
  first_air_date: medium["release_date"],
  # last_air_date: medium["release_date"]
  poster: "http://image.tmdb.org/t/p/w500///" + medium["poster_path"],
)

## LOTR 2 TOWERS ##

 medium_raw = RestClient.get "https://api.themoviedb.org/3/movie/121?api_key=8081155eac22e256dfac70b9d7913b13&language=en-US"
 medium = JSON.parse(medium_raw)

 Medium.create(
  title: medium["title"],
  runtime: medium["runtime"],
  genres: medium["genres"].take(3).map { |genre| genre["name"] },
  description: medium["overview"],
  language: medium["original_language"],
  rating: medium["vote_average"],
  # media_type: medium["notthere"],
  imdb_id: medium["imdb_id"],
  total_seasons: medium["number_of_seasons"],
  tmdb_id: medium["id"],
  origin_countries: medium["production_countries"].take(3).map { |country| country["name"] },
  first_air_date: medium["release_date"],
  # last_air_date: medium["release_date"]
  poster: "http://image.tmdb.org/t/p/w500///" + medium["poster_path"],
)




## Breaking Bad ##

medium_raw = RestClient.get "https://api.themoviedb.org/3/tv/1396?api_key=8081155eac22e256dfac70b9d7913b13&language=en-US"
medium = JSON.parse(medium_raw)

title = medium["title"] ? medium["title"] : medium["name"]
first_air_date = medium["first_air_date"] ? medium["first_air_date"] : medium["release_date"]
origin_countries = medium["production_countries"] ? medium["production_countries"] : medium["origin_country"]

if medium["episode_run_time"]
  sum = 0
  medium["episode_run_time"].each { |time| sum += time.to_i }
  sum = sum / medium["episode_run_time"].length
end

runtime = medium["runtime"] ? medium["runtime"] : run

Medium.create(
  title: title,
  runtime: runtime,
  genres: medium["genres"].take(3).map { |genre| genre["name"] },
  description: medium["overview"],
  language: medium["original_language"],
  rating: medium["vote_average"],
  # media_type: medium["notthere"],
  imdb_id: medium["imdb_id"],
  total_seasons: medium["number_of_seasons"],
  tmdb_id: medium["id"],
  origin_countries: origin_countries.take(3).map { |country| country["name"] },
  first_air_date: first_air_date,
  last_air_date: medium["last_air_date"],
  poster: "http://image.tmdb.org/t/p/w500///" + medium["poster_path"],
)
