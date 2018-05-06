class UsersController < ApplicationController
  def login
	end

	def user_info
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
			flash[:notice] = "ユーザー登録が完了しました。"
			redirect_to("/tweets")
		else
			render("users/signup")
		end
	end

	def redirect
		redirect_to("/")
	end

end
