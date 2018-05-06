class UsersController < ApplicationController

	before_action :authenticate_user, {only:[:user_info, :logout]}
	before_action :forbid_login_user, {only:[:signup, :create, :login]}

	def top
		@user = User.new
		if @current_user != nil
			redirect_to("/tweets")
		end
	end

	def user_info
		@user = User.find_by(id: params[:id])
	end

	def signup
		@user =User.new
	end

	def create
		@user = User.new(
			name: params[:name],
			email: params[:email],
			password: params[:password]
		)

		if @user.save
			session[:user_id] = @user.id
			flash[:notice] = "ユーザー登録が完了しました。"
			redirect_to("/tweets")
		else
			render("users/signup")
		end
	end

	def login
		@user = User.find_by(
			email: params[:email],
			password: params[:password]
		)

		if @user
			session[:user_id] = @user.id
			flash[:notice] = "ログインしました。"
			redirect_to("/tweets")
		else
			@email = params[:email]
			@password = params[:password]
			@error_message = "メールアドレスまたはパスワードが間違っています。"
			render("users/top")
		end
	end

	def logout
		session[:user_id] = nil
		redirect_to("/")
	end

	def redirect
		redirect_to("/")
	end

end
