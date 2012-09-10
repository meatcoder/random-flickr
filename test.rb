class MyAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_home
    get '/'
    assert_match /Meow\!/, last_response.body
  end
  
  #unfinished test
  def test_random
    #setup request
    photos = mock()
    photos.expects(:search)
    
    #actual request
    get '/random'
  end
end