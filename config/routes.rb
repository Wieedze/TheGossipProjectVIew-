Rails.application.routes.draw do
  get "author_profil/:first_name", to: "author_profil#profil"

  get "/gossips/:id", to: "show#gossip"

  get "/new_gossip/create", to: "new_gossip#create"
  get "/team_page/home", to: "team_page#home"
  get "/contact/contact", to: "contact#contact"
  get "/accueil/home", to: "accueil#home"
  get "/landing_page/:first_name", to: "landing_page#user"


  get "up" => "rails/health#show", as: :rails_health_check
end
