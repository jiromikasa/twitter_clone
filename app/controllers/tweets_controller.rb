class TweetsController < ApplicationController
	def index
		@tweets = Tweet.all.order(created_at: :desc)
	end
	
	def create
	end

end
