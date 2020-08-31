# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

=begin
require "rest-client"


medium_raw = RestClient.get "https://api.themoviedb.org/3/movie/30508?api_key=#{ENV['TMDB_KEY']}&language=en-US"
medium = JSON.parse(medium_raw)

## BERLIN CALLING ##
# origin_countries = medium["production_countries"].map.with_index { |country, index| country if index < 1 }

title = medium["title"] ? medium["title"] : medium["name"]
first_air_date = medium["first_air_date"] ? medium["first_air_date"] : medium["release_date"]
origin_countries = medium["production_countries"] ? medium["production_countries"].take(3).map { |country| country["name"] } : [medium["origin_country"]]

if medium["episode_run_time"]
  sum = 0
  medium["episode_run_time"].each { |time| sum += time.to_i }
  sum = sum / medium["episode_run_time"].length
end

runtime = medium["runtime"] ? medium["runtime"] : sum

Medium.create(
  title: title,
  runtime: runtime,
  genres: medium["genres"].take(3).map { |genre| genre["name"] },
  description: medium["overview"],
  language: medium["original_language"],
  rating: medium["vote_average"],
  media_type: "movie",
  imdb_id: medium["imdb_id"],
  total_seasons: medium["number_of_seasons"],
  tmdb_id: medium["id"],
  origin_countries: origin_countries,
  first_air_date: first_air_date,
  last_air_date: medium["last_air_date"],
  poster: "http://image.tmdb.org/t/p/w500///" + medium["poster_path"],
)


## LOTR 1 ##

medium_raw = RestClient.get "https://api.themoviedb.org/3/movie/120?api_key=#{ENV['TMDB_KEY']}&language=en-US%22"
medium = JSON.parse(medium_raw)

title = medium["title"] ? medium["title"] : medium["name"]
first_air_date = medium["first_air_date"] ? medium["first_air_date"] : medium["release_date"]
origin_countries = medium["production_countries"] ? medium["production_countries"].take(3).map { |country| country["name"] } : [medium["origin_country"]]

if medium["episode_run_time"]
  sum = 0
  medium["episode_run_time"].each { |time| sum += time.to_i }
  sum = sum / medium["episode_run_time"].length
end

runtime = medium["runtime"] ? medium["runtime"] : sum

Medium.create(
  title: title,
  runtime: runtime,
  genres: medium["genres"].take(3).map { |genre| genre["name"] },
  description: medium["overview"],
  language: medium["original_language"],
  rating: medium["vote_average"],
  media_type: "movie",
  imdb_id: medium["imdb_id"],
  total_seasons: medium["number_of_seasons"],
  tmdb_id: medium["id"],
  origin_countries: origin_countries,
  first_air_date: first_air_date,
  last_air_date: medium["last_air_date"],
  poster: "http://image.tmdb.org/t/p/w500///" + medium["poster_path"],
)

## LOTR 2 TOWERS ##

medium_raw = RestClient.get "https://api.themoviedb.org/3/movie/121?api_key=#{ENV['TMDB_KEY']}&language=en-US"
medium = JSON.parse(medium_raw)

title = medium["title"] ? medium["title"] : medium["name"]
first_air_date = medium["first_air_date"] ? medium["first_air_date"] : medium["release_date"]
origin_countries = medium["production_countries"] ? medium["production_countries"].take(3).map { |country| country["name"] } : [medium["origin_country"]]

if medium["episode_run_time"]
  sum = 0
  medium["episode_run_time"].each { |time| sum += time.to_i }
  sum = sum / medium["episode_run_time"].length
end

runtime = medium["runtime"] ? medium["runtime"] : sum

Medium.create(
  title: title,
  runtime: runtime,
  genres: medium["genres"].take(3).map { |genre| genre["name"] },
  description: medium["overview"],
  language: medium["original_language"],
  rating: medium["vote_average"],
  media_type: "movie",
  imdb_id: medium["imdb_id"],
  total_seasons: medium["number_of_seasons"],
  tmdb_id: medium["id"],
  origin_countries: origin_countries,
  first_air_date: first_air_date,
  last_air_date: medium["last_air_date"],
  poster: "http://image.tmdb.org/t/p/w500///" + medium["poster_path"],
)


## LOTR 3 ##

medium_raw = RestClient.get "https://api.themoviedb.org/3/movie/122?api_key=#{ENV['TMDB_KEY']}&language=en-US%22"
medium = JSON.parse(medium_raw)

title = medium["title"] ? medium["title"] : medium["name"]
first_air_date = medium["first_air_date"] ? medium["first_air_date"] : medium["release_date"]
origin_countries = medium["production_countries"] ? medium["production_countries"].take(3).map { |country| country["name"] } : [medium["origin_country"]]

if medium["episode_run_time"]
  sum = 0
  medium["episode_run_time"].each { |time| sum += time.to_i }
  sum = sum / medium["episode_run_time"].length
end

runtime = medium["runtime"] ? medium["runtime"] : sum

Medium.create(
  title: title,
  runtime: runtime,
  genres: medium["genres"].take(3).map { |genre| genre["name"] },
  description: medium["overview"],
  language: medium["original_language"],
  rating: medium["vote_average"],
  media_type: "movie",
  imdb_id: medium["imdb_id"],
  total_seasons: medium["number_of_seasons"],
  tmdb_id: medium["id"],
  origin_countries: origin_countries,
  first_air_date: first_air_date,
  last_air_date: medium["last_air_date"],
  poster: "http://image.tmdb.org/t/p/w500///" + medium["poster_path"],
)


## LOTR quest ##

medium_raw = RestClient.get "https://api.themoviedb.org/3/movie/4133?api_key=#{ENV['TMDB_KEY']}&language=en-US%22"
medium = JSON.parse(medium_raw)

poster_path = medium["poster_path"] ? "http://image.tmdb.org/t/p/w500///" + medium["poster_path"] : "https://image.flaticon.com/icons/svg/16/16980.svg"
title = medium["title"] ? medium["title"] : medium["name"]
first_air_date = medium["first_air_date"] ? medium["first_air_date"] : medium["release_date"]
origin_countries = medium["production_countries"] ? medium["production_countries"].take(3).map { |country| country["name"] } : [medium["origin_country"]]

if medium["episode_run_time"]
  sum = 0
  medium["episode_run_time"].each { |time| sum += time.to_i }
  sum = sum / medium["episode_run_time"].length
end

runtime = medium["runtime"] ? medium["runtime"] : sum

Medium.create(
  title: title,
  runtime: runtime,
  genres: medium["genres"].take(3).map { |genre| genre["name"] },
  description: medium["overview"],
  language: medium["original_language"],
  rating: medium["vote_average"],
  media_type: "movie",
  imdb_id: medium["imdb_id"],
  total_seasons: medium["number_of_seasons"],
  tmdb_id: medium["id"],
  origin_countries: origin_countries,
  first_air_date: first_air_date,
  last_air_date: medium["last_air_date"],
  poster: poster_path,
)



## LOTR making of ##

medium_raw = RestClient.get "https://api.themoviedb.org/3/movie/335612?api_key=#{ENV['TMDB_KEY']}&language=en-US%22"
medium = JSON.parse(medium_raw)

poster_path = medium["poster_path"] ? "http://image.tmdb.org/t/p/w500///" + medium["poster_path"] : "https://image.flaticon.com/icons/svg/16/16980.svg"
title = medium["title"] ? medium["title"] : medium["name"]
first_air_date = medium["first_air_date"] ? medium["first_air_date"] : medium["release_date"]
origin_countries = medium["production_countries"] ? medium["production_countries"].take(3).map { |country| country["name"] } : [medium["origin_country"]]

if medium["episode_run_time"]
  sum = 0
  medium["episode_run_time"].each { |time| sum += time.to_i }
  sum = sum / medium["episode_run_time"].length
end

runtime = medium["runtime"] ? medium["runtime"] : sum

Medium.create(
  title: title,
  runtime: runtime,
  genres: medium["genres"].take(3).map { |genre| genre["name"] },
  description: medium["overview"],
  language: medium["original_language"],
  rating: medium["vote_average"],
  media_type: "movie",
  imdb_id: medium["imdb_id"],
  total_seasons: medium["number_of_seasons"],
  tmdb_id: medium["id"],
  origin_countries: origin_countries,
  first_air_date: first_air_date,
  last_air_date: medium["last_air_date"],
  poster: poster_path,
)



## SPUN ##

medium_raw = RestClient.get "https://api.themoviedb.org/3/movie/12079?api_key=#{ENV['TMDB_KEY']}&language=en-US%22"
medium = JSON.parse(medium_raw)

title = medium["title"] ? medium["title"] : medium["name"]
first_air_date = medium["first_air_date"] ? medium["first_air_date"] : medium["release_date"]
origin_countries = medium["production_countries"] ? medium["production_countries"].take(3).map { |country| country["name"] } : [medium["origin_country"]]

if medium["episode_run_time"]
  sum = 0
  medium["episode_run_time"].each { |time| sum += time.to_i }
  sum = sum / medium["episode_run_time"].length
end

runtime = medium["runtime"] ? medium["runtime"] : sum

Medium.create(
  title: title,
  runtime: runtime,
  genres: medium["genres"].take(3).map { |genre| genre["name"] },
  description: medium["overview"],
  language: medium["original_language"],
  rating: medium["vote_average"],
  media_type: "movie",
  imdb_id: medium["imdb_id"],
  total_seasons: medium["number_of_seasons"],
  tmdb_id: medium["id"],
  origin_countries: origin_countries,
  first_air_date: first_air_date,
  last_air_date: medium["last_air_date"],
  poster: "http://image.tmdb.org/t/p/w500///" + medium["poster_path"],
)



## City of God ##

medium_raw = RestClient.get "https://api.themoviedb.org/3/movie/598?api_key=#{ENV['TMDB_KEY']}&language=en-US%22"
medium = JSON.parse(medium_raw)

title = medium["title"] ? medium["title"] : medium["name"]
first_air_date = medium["first_air_date"] ? medium["first_air_date"] : medium["release_date"]
origin_countries = medium["production_countries"] ? medium["production_countries"].take(3).map { |country| country["name"] } : [medium["origin_country"]]

if medium["episode_run_time"]
  sum = 0
  medium["episode_run_time"].each { |time| sum += time.to_i }
  sum = sum / medium["episode_run_time"].length
end

runtime = medium["runtime"] ? medium["runtime"] : sum

Medium.create(
  title: title,
  runtime: runtime,
  genres: medium["genres"].take(3).map { |genre| genre["name"] },
  description: medium["overview"],
  language: medium["original_language"],
  rating: medium["vote_average"],
  media_type: "movie",
  imdb_id: medium["imdb_id"],
  total_seasons: medium["number_of_seasons"],
  tmdb_id: medium["id"],
  origin_countries: origin_countries,
  first_air_date: first_air_date,
  last_air_date: medium["last_air_date"],
  poster: "http://image.tmdb.org/t/p/w500///" + medium["poster_path"],
)




## Scarface ##

medium_raw = RestClient.get "https://api.themoviedb.org/3/movie/111?api_key=#{ENV['TMDB_KEY']}&language=en-US%22"
medium = JSON.parse(medium_raw)

title = medium["title"] ? medium["title"] : medium["name"]
first_air_date = medium["first_air_date"] ? medium["first_air_date"] : medium["release_date"]
origin_countries = medium["production_countries"] ? medium["production_countries"].take(3).map { |country| country["name"] } : [medium["origin_country"]]

if medium["episode_run_time"]
  sum = 0
  medium["episode_run_time"].each { |time| sum += time.to_i }
  sum = sum / medium["episode_run_time"].length
end

runtime = medium["runtime"] ? medium["runtime"] : sum

Medium.create(
  title: title,
  runtime: runtime,
  genres: medium["genres"].take(3).map { |genre| genre["name"] },
  description: medium["overview"],
  language: medium["original_language"],
  rating: medium["vote_average"],
  media_type: "movie",
  imdb_id: medium["imdb_id"],
  total_seasons: medium["number_of_seasons"],
  tmdb_id: medium["id"],
  origin_countries: origin_countries,
  first_air_date: first_air_date,
  last_air_date: medium["last_air_date"],
  poster: "http://image.tmdb.org/t/p/w500///" + medium["poster_path"],
)







#################################################################################################
#################################################################################################
############################################ SERIES #############################################
#################################################################################################
#################################################################################################








## Breaking Bad ##

medium_raw = RestClient.get "https://api.themoviedb.org/3/tv/1396?api_key=#{ENV['TMDB_KEY']}&language=en-US"
medium = JSON.parse(medium_raw)

title = medium["title"] ? medium["title"] : medium["name"]
first_air_date = medium["first_air_date"] ? medium["first_air_date"] : medium["release_date"]
origin_countries = medium["production_countries"] ? medium["production_countries"].take(3).map { |country| country["name"] } : [medium["origin_country"]]

if medium["episode_run_time"]
  sum = 0
  medium["episode_run_time"].each { |time| sum += time.to_i }
  sum = sum / medium["episode_run_time"].length
end

runtime = medium["runtime"] ? medium["runtime"] : sum

Medium.create(
  title: title,
  runtime: runtime,
  genres: medium["genres"].take(3).map { |genre| genre["name"] },
  description: medium["overview"],
  language: medium["original_language"],
  rating: medium["vote_average"],
  media_type: "tv",
  imdb_id: medium["imdb_id"],
  total_seasons: medium["number_of_seasons"],
  tmdb_id: medium["id"],
  origin_countries: origin_countries,
  first_air_date: first_air_date,
  last_air_date: medium["last_air_date"],
  poster: "http://image.tmdb.org/t/p/w500///" + medium["poster_path"],
)




## Suits ##

medium_raw = RestClient.get "https://api.themoviedb.org/3/tv/37680?api_key=#{ENV['TMDB_KEY']}&language=en-US%22"
medium = JSON.parse(medium_raw)

title = medium["title"] ? medium["title"] : medium["name"]
first_air_date = medium["first_air_date"] ? medium["first_air_date"] : medium["release_date"]
origin_countries = medium["production_countries"] ? medium["production_countries"].take(3).map { |country| country["name"] } : [medium["origin_country"]]

if medium["episode_run_time"]
  sum = 0
  medium["episode_run_time"].each { |time| sum += time.to_i }
  sum = sum / medium["episode_run_time"].length
end

runtime = medium["runtime"] ? medium["runtime"] : sum

Medium.create(
  title: title,
  runtime: runtime,
  genres: medium["genres"].take(3).map { |genre| genre["name"] },
  description: medium["overview"],
  language: medium["original_language"],
  rating: medium["vote_average"],
  media_type: "tv",
  imdb_id: medium["imdb_id"],
  total_seasons: medium["number_of_seasons"],
  tmdb_id: medium["id"],
  origin_countries: origin_countries,
  first_air_date: first_air_date,
  last_air_date: medium["last_air_date"],
  poster: "http://image.tmdb.org/t/p/w500///" + medium["poster_path"],
)



## Mindhunter ##

medium_raw = RestClient.get "https://api.themoviedb.org/3/tv/67744?api_key=#{ENV['TMDB_KEY']}&language=en-US%22"
medium = JSON.parse(medium_raw)

title = medium["title"] ? medium["title"] : medium["name"]
first_air_date = medium["first_air_date"] ? medium["first_air_date"] : medium["release_date"]
origin_countries = medium["production_countries"] ? medium["production_countries"].take(3).map { |country| country["name"] } : [medium["origin_country"]]

if medium["episode_run_time"]
  sum = 0
  medium["episode_run_time"].each { |time| sum += time.to_i }
  sum = sum / medium["episode_run_time"].length
end

runtime = medium["runtime"] ? medium["runtime"] : sum

Medium.create(
  title: title,
  runtime: runtime,
  genres: medium["genres"].take(3).map { |genre| genre["name"] },
  description: medium["overview"],
  language: medium["original_language"],
  rating: medium["vote_average"],
  media_type: "tv",
  imdb_id: medium["imdb_id"],
  total_seasons: medium["number_of_seasons"],
  tmdb_id: medium["id"],
  origin_countries: origin_countries,
  first_air_date: first_air_date,
  last_air_date: medium["last_air_date"],
  poster: "http://image.tmdb.org/t/p/w500///" + medium["poster_path"],
)




## Lie to me ##

medium_raw = RestClient.get "https://api.themoviedb.org/3/tv/8358?api_key=#{ENV['TMDB_KEY']}&language=en-US%22"
medium = JSON.parse(medium_raw)

title = medium["title"] ? medium["title"] : medium["name"]
first_air_date = medium["first_air_date"] ? medium["first_air_date"] : medium["release_date"]
origin_countries = medium["production_countries"] ? medium["production_countries"].take(3).map { |country| country["name"] } : [medium["origin_country"]]

if medium["episode_run_time"]
  sum = 0
  medium["episode_run_time"].each { |time| sum += time.to_i }
  sum = sum / medium["episode_run_time"].length
end

runtime = medium["runtime"] ? medium["runtime"] : sum

Medium.create(
  title: title,
  runtime: runtime,
  genres: medium["genres"].take(3).map { |genre| genre["name"] },
  description: medium["overview"],
  language: medium["original_language"],
  rating: medium["vote_average"],
  media_type: "tv",
  imdb_id: medium["imdb_id"],
  total_seasons: medium["number_of_seasons"],
  tmdb_id: medium["id"],
  origin_countries: origin_countries,
  first_air_date: first_air_date,
  last_air_date: medium["last_air_date"],
  poster: "http://image.tmdb.org/t/p/w500///" + medium["poster_path"],
)



## Devs  ##

medium_raw = RestClient.get "https://api.themoviedb.org/3/tv/81349?api_key=#{ENV['TMDB_KEY']}&language=en-US%22"
medium = JSON.parse(medium_raw)

title = medium["title"] ? medium["title"] : medium["name"]
first_air_date = medium["first_air_date"] ? medium["first_air_date"] : medium["release_date"]
origin_countries = medium["production_countries"] ? medium["production_countries"].take(3).map { |country| country["name"] } : [medium["origin_country"]]

if medium["episode_run_time"]
  sum = 0
  medium["episode_run_time"].each { |time| sum += time.to_i }
  sum = sum / medium["episode_run_time"].length
end

runtime = medium["runtime"] ? medium["runtime"] : sum

Medium.create(
  title: title,
  runtime: runtime,
  genres: medium["genres"].take(3).map { |genre| genre["name"] },
  description: medium["overview"],
  language: medium["original_language"],
  rating: medium["vote_average"],
  media_type: "tv",
  imdb_id: medium["imdb_id"],
  total_seasons: medium["number_of_seasons"],
  tmdb_id: medium["id"],
  origin_countries: origin_countries,
  first_air_date: first_air_date,
  last_air_date: medium["last_air_date"],
  poster: "http://image.tmdb.org/t/p/w500///" + medium["poster_path"],
)



## Vikings  ##

medium_raw = RestClient.get "https://api.themoviedb.org/3/tv/44217?api_key=#{ENV['TMDB_KEY']}&language=en-US%22"
medium = JSON.parse(medium_raw)

title = medium["title"] ? medium["title"] : medium["name"]
first_air_date = medium["first_air_date"] ? medium["first_air_date"] : medium["release_date"]
origin_countries = medium["production_countries"] ? medium["production_countries"].take(3).map { |country| country["name"] } : [medium["origin_country"]]

if medium["episode_run_time"]
  sum = 0
  medium["episode_run_time"].each { |time| sum += time.to_i }
  sum = sum / medium["episode_run_time"].length
end

runtime = medium["runtime"] ? medium["runtime"] : sum

Medium.create(
  title: title,
  runtime: runtime,
  genres: medium["genres"].take(3).map { |genre| genre["name"] },
  description: medium["overview"],
  language: medium["original_language"],
  rating: medium["vote_average"],
  media_type: "tv",
  imdb_id: medium["imdb_id"],
  total_seasons: medium["number_of_seasons"],
  tmdb_id: medium["id"],
  origin_countries: origin_countries,
  first_air_date: first_air_date,
  last_air_date: medium["last_air_date"],
  poster: "http://image.tmdb.org/t/p/w500///" + medium["poster_path"],
)




## Game of Thrones  ##

medium_raw = RestClient.get "https://api.themoviedb.org/3/tv/1399?api_key=#{ENV['TMDB_KEY']}&language=en-US%22"
medium = JSON.parse(medium_raw)

title = medium["title"] ? medium["title"] : medium["name"]
first_air_date = medium["first_air_date"] ? medium["first_air_date"] : medium["release_date"]
origin_countries = medium["production_countries"] ? medium["production_countries"].take(3).map { |country| country["name"] } : [medium["origin_country"]]

if medium["episode_run_time"]
  sum = 0
  medium["episode_run_time"].each { |time| sum += time.to_i }
  sum = sum / medium["episode_run_time"].length
end

runtime = medium["runtime"] ? medium["runtime"] : sum

Medium.create(
  title: title,
  runtime: runtime,
  genres: medium["genres"].take(3).map { |genre| genre["name"] },
  description: medium["overview"],
  language: medium["original_language"],
  rating: medium["vote_average"],
  media_type: "tv",
  imdb_id: medium["imdb_id"],
  total_seasons: medium["number_of_seasons"],
  tmdb_id: medium["id"],
  origin_countries: origin_countries,
  first_air_date: first_air_date,
  last_air_date: medium["last_air_date"],
  poster: "http://image.tmdb.org/t/p/w500///" + medium["poster_path"],
)
=end

User.create!(
  email: "max@mustermann.com",
  password: "666666",
  password_confirmation: "666666",
  first_name: "Max",
  last_name: "Mustermann"
)

User.create!(
  email: "Tom@mustermann.com",
  password: "666666",
  password_confirmation: "666666",
  first_name: "Tom",
  last_name: "Mustermann"
)

User.create!(
  email: "Lisa@mustermann.com",
  password: "666666",
  password_confirmation: "666666",
  first_name: "Lisa",
  last_name: "Mustermann"
)



User.create!(
  email: "bernd@brot.com",
  password: "666666",
  password_confirmation: "666666",
  first_name: "Bernd",
  last_name: "Brot"
)

User.create!(
  email: "Bernd@keinbrot.com",
  password: "666666",
  password_confirmation: "666666",
  first_name: "Bernd",
  last_name: "Keinbrot"
)

User.create!(
  email: "Michelle@nice.com",
  password: "666666",
  password_confirmation: "666666",
  first_name: "Michelle",
  last_name: "Mitch"
)

User.create!(
  email: "Michelle@niice.com",
  password: "666666",
  password_confirmation: "666666",
  first_name: "Michelle",
  last_name: "Mampf"
)

User.create!(
  email: "Gerri@nice.com",
  password: "666666",
  password_confirmation: "666666",
  first_name: "Gerri",
  last_name: "Mampf"
)
