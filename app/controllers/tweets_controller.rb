class TweetsController < ApplicationController
	def index
		@tweets = Tweet.all.order(created_at: :desc)
	end
	
	def create
		@tweet = Tweet.new(user_id: 1, content: params[:content])
		@tweet.save
		redirect_to("/tweets")
	end

end
