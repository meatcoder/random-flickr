class MyAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_home
    get '/', 'HTTP_HOST' => 'localhost'
    assert_match /Meow\!/, last_response.body
  end
  
  def test_random
    get '/random'
  end
end
