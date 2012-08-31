require 'sinatra'
require 'flickraw'

configure do
  mime_type :jpg, 'image/jpeg'
end

get '/' do
  "Hello, world"
end

get '/random' do
  FlickRaw.api_key = ENV['FLICKR_API_KEY']
  FlickRaw.shared_secret = ENV['FLICKR_SHARED_SECRET']
  
  user_id = '86301377@N08'
  list = flickr.photos.search :user_id => user_id, :tags => 'maomesvc'
  ridx = rand(list.count)
  info = flickr.photos.getInfo :photo_id => list[ridx].id, :secret => list[ridx].secret
  
  FlickRaw.url_z(info)
end