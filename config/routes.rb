Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'feeds#index'
  resources :users
  resources :sessions, only:[:new, :create, :destroy]
  resources :feeds do
      collection do
      post :confirm
    end
  end
  resources :favorites, only:[:create, :destroy]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
