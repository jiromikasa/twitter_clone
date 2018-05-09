class UsersController < ApplicationController

	before_action :authenticate_user, {only:[:user_info, :logout]}
	before_action :forbid_login_user, {only:[:signup, :create, :login]}
	# before_action :ensure_correct_user, {only:[:edit, :update]}

	def top
		@user = User.new
		if @current_user != nil
			redirect_to("/tweets")
		end
	end

	def user_info
		@user = User.find_by(id: params[:id])
		@tweets = Tweet.where(user_id: @user.id).order(created_at: :desc)
	end

	def likes
		@user = User.find_by(id: params[:id])
		@likes = Like.where(user_id: @user.id).order(created_at: :desc)
	end

	def signup
		@user =User.new
	end

	def edit
		@user = User.find_by(id: params[:id])
	end

	def update
		@user = User.find_by(id: params[:id])
		@user.name = params[:name]
		@user.email = params[:email]
		@user.password = params[:password]

		if params[:icon]
			@user.icon_name = "#{@user.id}.jpg"
			icon = params[:icon]
			File.binwrite("public/user_images/#{@user.icon_name}", icon.read)
		end

		if @user.save
			flash[:notice] = "プロフィールを変更しました。"
			redirect_to("/users/#{@user.id}")
		else
			render("users/edit")
		end
	end

	def create
		@user = User.new(
			name: params[:name],
			email: params[:email],
			password: params[:password],
			icon_name: "default_icon.jpeg" 
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
		@user = User.find_by(email: params[:email])

		if @user &&	@user.authenticate(params[:password])
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

	def ensure_correct_user
		if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/")
		end
	end

	def redirect
		redirect_to("/")
	end

end
