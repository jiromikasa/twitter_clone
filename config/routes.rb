Rails.application.routes.draw do
	get 'users/top' => 'users#top'
	post 'users/login' => 'users#login'	
	get 'users/signup' => 'users#signup'
	post 'users/create' => 'users#create'
	get 'users/create' => 'users#top'
	post 'users/logout' => 'users#logout'
	get 'users/:id/likes' => 'users#likes'
	get 'users/:id/edit' => 'users#edit'
	post 'users/:id/update' => 'users#update'
	get 'users/:id' => 'users#user_info'
	
	

	get 'tweets' => 'tweets#index'
	get 'tweets/new' => 'tweets#new'
	post 'tweets/create' => 'tweets#create'
	get 'tweets/:id/edit' => 'tweets#edit'
	post 'tweets/:id/update' => 'tweets#update'
	post 'tweets/:id/destroy' => 'tweets#destroy'
	
	post 'likes/:tweet_id/create' => 'likes#create'
	post 'likes/:tweet_id/destroy' => 'likes#destroy'

	# get '*not_found' => 'users#redirect'
	# post '*not_found' => 'users#redirect'

	root to: 'users#top'

end
