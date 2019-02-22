Rails.application.routes.draw do
  root 'tests#index'

  resources :tests do
    resources :questions, shallow: true
  end

  #post '/tests/:id/questions', to: 'tests#create'

end
