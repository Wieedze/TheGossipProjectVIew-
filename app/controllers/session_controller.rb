class SessionController < ApplicationController
  before_action :authenticate_user, only: [:index]
  def index
    current_user
  end

  def create
    if current_user&.authenticate(params[:password])
      log_in(current_user)
      redirect_to session_index_path, notice: "Connexion réussie"
      # redirige où tu veux, avec un flash ou pas
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

def new
  current_user
  log_in(current_user)
end

  def destroy
    session[:user_id] = nil
    redirect_to accueil_index_path
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end
end
