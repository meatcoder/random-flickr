def random_pic_url(user_id = nil, tag = nil)
  FlickRaw.api_key = ENV['FLICKR_API_KEY']
  FlickRaw.shared_secret = ENV['FLICKR_SHARED_SECRET']
  
  if (user_id == nil)
    user_id = ENV['FLICKR_USER_ID'] 
    tag = ENV['FLICKR_TAG']
  end
  
  begin
    list = flickr.photos.search :user_id => user_id, :tags => tag
  rescue
    list = nil
  end
  
  if (list != nil && list.count != 0)
    ridx = rand(list.count)
    info = flickr.photos.getInfo :photo_id => list[ridx].id, :secret => list[ridx].secret
  
    FlickRaw.url_z(info)
  else
    nil
  end
end

configure do
  mime_type :jpg, 'image/jpeg'
end

get '/' do
  "Meow!"
end

get '/random/?:user_id?/?:tag?' do
  url = random_pic_url(params[:user_id], params[:tag])
  if (url)
    url
  else
    [404,"no pics found"]
  end
end

get '/randompic/?:user_id?/?:tag?' do
  url = random_pic_url(params[:user_id], params[:tag])
  if (url)
    "<img src=\"#{url}\">"
  else
    [404,"no pics found"]
  end
end