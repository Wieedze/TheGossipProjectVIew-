Rails.application.routes.draw do
  resources :cities, only: [ :index, :show ]
  resources :gossips do
    resources :comments
    resources :likes, only: [:create, :index, :destroy]
  end
  resources :session, only: [ :new, :create, :destroy, :index ]
  resources :user, only: [ :create, :new ]

  get "author_profil/:first_name", to: "author_profil#profil"

  get "/gossips/:id", to: "show#gossip"
  get "/team_page/home", to: "team_page#home"
  get "/contact/contact", to: "contact#contact"
  get "/accueil/index", to: "accueil#index"


  get "up" => "rails/health#show", as: :rails_health_check
end
