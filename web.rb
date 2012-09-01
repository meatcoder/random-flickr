require 'sinatra'
require 'flickraw'

def random_pic_url
  FlickRaw.api_key = ENV['FLICKR_API_KEY']
  FlickRaw.shared_secret = ENV['FLICKR_SHARED_SECRET']
  
  user_id = ENV['FLICKR_USER_ID']
  list = flickr.photos.search :user_id => user_id, :tags => ENV['FLICKR_TAG']
  ridx = rand(list.count)
  info = flickr.photos.getInfo :photo_id => list[ridx].id, :secret => list[ridx].secret
  
  FlickRaw.url_z(info)
end

configure do
  mime_type :jpg, 'image/jpeg'
end

get '/' do
  "Meow!"
end

get '/random' do
  random_pic_url
end

get '/randompic' do
  "<img src=\"#{random_pic_url}\">"
end