Rails.application.routes.draw do
  resources :cities, only: [ :index, :show ]
  resources :gossips do
    resources :comments
  end

  get "author_profil/:first_name", to: "author_profil#profil"

  get "/gossips/:id", to: "show#gossip"
  get "/team_page/home", to: "team_page#home"
  get "/contact/contact", to: "contact#contact"
  get "/accueil/index", to: "accueil#index"
  get "/landing_page/:first_name", to: "landing_page#user"


  get "up" => "rails/health#show", as: :rails_health_check
end




