Rails.application.routes.draw do
	get 'users/top' => 'users#top'
	post 'users/login' => 'users#login'	
	get 'users/signup' => 'users#signup'
	post 'users/new' => 'users#new'
	get 'users/:id' => 'users#user_info'

	get 'tweets' => 'tweets#index'
	get 'tweets/new' => 'tweets#new'
	post 'tweets/create' => 'tweets#create'

	# get '*not_found' => 'users#redirect'
	# post '*not_found' => 'users#redirect'

	root to: 'users#top'

end
