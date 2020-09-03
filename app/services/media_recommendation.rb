require 'rest-client'

class MediaRecommendation
  def self.recommend_media(user)
    text_movie = JSON.parse(RestClient.get("https://api.themoviedb.org/3/movie/popular?api_key=#{ENV['TMDB_KEY']}&language=en-US&page=1"))["results"].sample(5)
    text_tv = JSON.parse(RestClient.get("https://api.themoviedb.org/3/tv/popular?api_key=#{ENV['TMDB_KEY']}&language=en-US&page=1"))["results"].sample(5)
    recs_movie = []
    recs_tv = []
    text_movie.each do |medium|
      new_med = Medium.new(MovieFetch.medium_hash(medium["id"], "movie"))
      found_medium = Medium.find_by(tmdb_id: new_med.tmdb_id, media_type: new_med.media_type)
      if found_medium
        recs_movie << found_medium
      else
        new_med.save
        recs_movie << new_med
      end
    end
    text_tv.each do |medium|
      new_med = Medium.new(MovieFetch.medium_hash(medium["id"], "tv"))
      found_medium = Medium.find_by(tmdb_id: new_med.tmdb_id, media_type: new_med.media_type)
      if found_medium
        recs_tv << found_medium
      else
        new_med.save
        recs_tv << new_med
      end
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
    recs_movie.uniq!
    recs_tv.uniq!
    return [recs_movie.sample(4), recs_tv.sample(4)]
  end

  def self.friends_ratings(user, id)
    friends = MediaRecommendation.find_friends(user)
    ratings = []
    friends.each do |friend|
      friend_rate = Watch.find_by(user: friend, medium: Medium.find(id))
      ratings << friend_rate.rating unless friend_rate.nil?
    end
    ratings.delete(nil)
    sum = 0.0
    ratings.each do |rating|
      sum += rating
    end
    ratings.empty? ? '--' : (sum / ratings.length).round(1)
  end

  def self.friend_views(user)
    friends = MediaRecommendation.find_friends(user)
    views = []
    friends.each do |friend|
      friend_watch = []
      Watch.where(user: friend, seen: true).last(5).each do |watch|
        friend_watch << watch
      end
      friend_watch.map! { |watch| watch.medium }
      views << { user: friend, media: friend_watch } unless friend_watch.empty?
    end
    return views.sample(4)
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
