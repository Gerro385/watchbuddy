class MediaRecommendation
  def initialize
  end

  def recommend_media(user)
    # recs = JSON.parse(RestClient.get("https://api.themoviedb.org/3/#{type}/#{id}?api_key=#{ENV['TMDB_KEY']}", { accept: :json }))
    text_movie = JSON.parse(RestClient.get("https://api.themoviedb.org/3/movie/popular?api_key=#{ENV['TMDB_KEY']}&language=en-US&page=1"))["results"].sample(5)
    text_tv = JSON.parse(RestClient.get("https://api.themoviedb.org/3/tv/popular?api_key=#{ENV['TMDB_KEY']}&language=en-US&page=1"))["results"].sample(5)
    recs = []
    fetch = MovieFetch.new
    text_movie.each do |medium|
      recs << Medium.new(fetch.medium_hash(medium["id"], "movie"))
    end
    text_tv.each do |medium|
      recs << Medium.new(fetch.medium_hash(medium["id"], "tv"))
    end
    friends = find_friends(user)
    friends.each do |friend|
      recs << Watch.where(user: friend).sample(5).medium
    end
    return recs
  end

  def find_friends(user)
    sent_req = Request.where(sender_id: user, status: 1)
    sent_req.map { |req| User.find_by(req.receiver_id) } if sent_req.present?
    received_req = Request.where(receiver_id: user, status: 1)
    received_req.map { |req| User.find_by(req.sender_id) } if received_req.present?
    return (sent_req + received_req)
  end
end
