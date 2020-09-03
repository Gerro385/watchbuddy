require 'rest-client'

class MovieFetch
  def self.medium_hash(id, type) # fetches medium info from tmdb API and returns a hash of all elements we want to store in our db with the correct keys
    vals = JSON.parse(RestClient.get("https://api.themoviedb.org/3/#{type}/#{id}?api_key=#{ENV['TMDB_KEY']}", { accept: :json }))

    title = vals["title"] ? vals["title"] : vals["name"]
    first_air_date = vals["first_air_date"] ? vals["first_air_date"] : vals["release_date"]
    origin_countries = vals["production_countries"] ? vals["production_countries"].take(3).map { |country| country["name"] } : [vals["origin_country"]]

    if vals["episode_run_time"]
      sum = 0
      vals["episode_run_time"].each { |time| sum += time.to_i }
      sum = sum / vals["episode_run_time"].length
    end

    runtime = vals["runtime"] ? vals["runtime"] : sum

    {
      title: title,
      runtime: runtime,
      genres: vals["genres"].take(3).map { |genre| genre["name"] },
      description: vals["overview"],
      language: vals["original_language"],
      rating: vals["vote_average"],
      media_type: type,
      imdb_id: vals["imdb_id"],
      total_seasons: vals["number_of_seasons"],
      tmdb_id: id,
      origin_countries: origin_countries,
      first_air_date: first_air_date,
      last_air_date: vals["last_air_date"],
      poster: "http://image.tmdb.org/t/p/w500///" + vals["poster_path"],
    }
  end
end
