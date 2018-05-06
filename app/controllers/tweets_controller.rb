class TweetsController < ApplicationController
	def index
		@tweets = Tweet.all.order(created_at: :desc)
	end

	def new
		@tweet = Tweet.new
	end
	
	def create
		@tweet = Tweet.new(
			user_id: 1,
			content: params[:content]
			)
		if @tweet.save
			flash[:notice] = "つぶやきました。"
			redirect_to("/tweets")
		else
			render("tweets/new")
		end
	end

end
