# random-flickr [<img src="https://secure.travis-ci.org/meatcoder/random-flickr.png" />](http://travis-ci.org/meatcoder/random-flickr)

A simple [sinatra](http://www.sinatrarb.com) web app that returns random flickr pics with a certain tag and from a particular user. I wrote it for my own amusement, as I wanted a url that when repeatedly refreshed will show different random pictures of my cat. Just something to cheer me up when I'm feeling down. You can see it deployed and in action here:

[http://maome.herokuapp.com/randompic](http://maome.herokuapp.com/randompic)

It also has a url that returns a random image url instead of an html page:

[http://maome.herokuapp.com/random](http://maome.herokuapp.com/random)

This is mainly for consumption by other web apps, services or a mobile or desktop app. I currently use it to implement a [hubot](http://hubot.github.com) script that returns random picture of my cat in response to a phrase. That script was inspired by the default pug me hubot script.

It is also possible to add optional parameters to the above urls to specify a specific flickr user or tag. They take the form:

	http://maome.herokuapp.com/randompic/$FLICKR_USER_ID/$TAG
	
Just replace $FLICKR_USER_ID and $TAG with their actual values.

## Install

The repository is easily deployed to any server that will run sinatra. The dependencies are listed in the Gemfile and thus can be automatically installed if you use [bundler](http://gembundler.com). Just do a:

	$ bundle install

You will also need to set some configuration variables for the flickr api. In bash, you can do that like so:

	$ export FLICKR_API_KEY=flick_api_key_here
	$ export FLICKR_SHARED_SECRET=flick_shared_secret_here
	$ export FLICKR_USER_ID=flickr_user_id
	$ export FLICKR_TAG=flickr_tag

Just replace the values on the right hand side with the actual values. Then to launch the app, simply do this:

	$ bundle exec ruby web.rb -p 8080
	
The above will allow you to access the app on port 8080. 




