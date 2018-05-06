class TweetsController < ApplicationController
	
	before_action :authenticate_user
	
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

	def edit
		@tweet = Tweet.find_by(id: params[:id])
	end

	def update
		@tweet = Tweet.find_by(id: params[:id])
		@tweet.content = params[:content]
		if @tweet.save
			flash[:notice] = "つぶやきを変更しました。"
			redirect_to("/tweets")
		else
			render("tweets/#{params[:id]}/edit")
		end
	end

	def destroy
		@tweet = Tweet.find_by(id: params[:id])
		@tweet.destroy
		flash[:notice] = "つぶやきを削除しました。"
		redirect_to("/tweets")
	end

end
