require 'rest-client'

class MediaRecommendation
  def self.recommend_media(user)
    text_movie = JSON.parse(RestClient.get("https://api.themoviedb.org/3/movie/popular?api_key=#{ENV['TMDB_KEY']}&language=en-US&page=1"))["results"].sample(5)
    text_tv = JSON.parse(RestClient.get("https://api.themoviedb.org/3/tv/popular?api_key=#{ENV['TMDB_KEY']}&language=en-US&page=1"))["results"].sample(5)
    recs = []
    text_movie.each do |medium|
      recs << Medium.new(MovieFetch.medium_hash(medium["id"], "movie"))
    end
    text_tv.each do |medium|
      recs << Medium.new(MovieFetch.medium_hash(medium["id"], "tv"))
    end
    friends = find_friends(user)
    friends.each do |friend|
      watch = Watch.where(user: friend).sample(5).map { |watch| watch.medium }
      recs << watch unless watch.empty?
    end
    return recs
  end

  private

  def self.find_friends(user)
    sent_req = Request.where(sender_id: user, status: 1)
    sent_req.map { |req| User.find(req.receiver_id) } if sent_req.present?
    received_req = Request.where(receiver_id: user, status: 1)
    received_req.map { |req| User.find(req.sender_id) } if received_req.present?
    return (sent_req + received_req)
  end
end
