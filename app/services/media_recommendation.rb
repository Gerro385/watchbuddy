require 'rest-client'

class MediaRecommendation
  def self.recommend_media(user)
    text_movie = JSON.parse(RestClient.get("https://api.themoviedb.org/3/movie/popular?api_key=#{ENV['TMDB_KEY']}&language=en-US&page=1"))["results"].sample(5)
    text_tv = JSON.parse(RestClient.get("https://api.themoviedb.org/3/tv/popular?api_key=#{ENV['TMDB_KEY']}&language=en-US&page=1"))["results"].sample(5)
    recs_movie = []
    recs_tv = []
    text_movie.each do |medium|
      recs_movie << Medium.new(MovieFetch.medium_hash(medium["id"], "movie"))
    end
    text_tv.each do |medium|
      recs_tv << Medium.new(MovieFetch.medium_hash(medium["id"], "tv"))
    end
    friends = find_friends(user)
    friends.each do |friend|
      media = Watch.where(user: friend).sample(5).map { |watch| watch.medium }
      media.each do |medium|
        if medium.media_type == "tv"
          recs_tv << medium
        else
          recs_movie << medium
        end
      end
    end
    recs = [recs_movie.sample(4), recs_tv.sample(4)]
    recs.each do |rec|
      rec.map! do |medium|
        found_medium = Medium.find_by(tmdb_id: medium.tmdb_id, media_type: medium.media_type)
        if found_medium
          found_medium
        else
          medium.save
          medium
        end
      end
    end
    return recs
  end

  def self.friends_ratings(user, id)
    friends = MediaRecommendation.find_friends(user)
    ratings = []
    friends.each do |friend|
      friend_rate = Watch.find_by(user: friend, medium: Medium.find(id))
      val = friend_rate.rating unless friend_rate.nil?
      ratings << val unless val.nil?
    end
    sum = Float(0)
    ratings.each do |rating|
      sum += rating
    end
    return ((sum == 0) ? '--' : (sum / ratings.length))
  end

  def self.friend_views(user)
    friends = MediaRecommendation.find_friends(user)
    views = []
    friends.each do |friend|
      Watch.where(user: friend, seen: true).sample(5).each do |watch|
        views << watch
      end
    end
    views.flatten!
    views.map! { |watch| watch.medium }
    return views[-4..-1]
  end

  private

  def self.find_friends(user)
    sent_req = Request.where(sender_id: user.id, status: 1)
    friends1 = sent_req.present? ? sent_req.map { |req| User.find(req.receiver_id) } : []
    received_req = Request.where(receiver_id: user.id, status: 1)
    friends2 = received_req.present? ? received_req.map { |req| User.find(req.sender_id) } : []
    friends1.to_a + friends2.to_a
  end
end
