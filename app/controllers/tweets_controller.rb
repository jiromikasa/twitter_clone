class TweetsController < ApplicationController
	
	before_action :authenticate_user
	before_action :ensure_correct_user, {only:[:edit, :update, :destroy]}
	
	def ensure_correct_user
		@tweet = Tweet.find_by(id: params[:id])
		if @tweet.user_id != @current_user.id
			flash[:notice] = "権限がありません"
			redirect_to("/tweets")
		end
	end

	def index
		@tweets = Tweet.all.order(created_at: :desc)
	end

	def new
		@tweet = Tweet.new
	end
	
	def create
		@tweet = Tweet.new(
			user_id: session[:user_id],
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
