class CitiesController < ApplicationController
  def index
  @cities = City.all
  end
  def show
    @city = City.find_by(id: params[:id])  # Utilisez l'ID de la ville pour la récupération
    if @city.nil?
      redirect_to cities_path, alert: "Ville non trouvée"  # Si la ville n'existe pas
    end
    @users = User.where(city: @city)
    @gossips = Gossip.where(user: @users).order(created_at: :desc)
  end
end
