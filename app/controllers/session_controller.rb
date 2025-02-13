class SessionController < ApplicationController
  before_action :authenticate_user, only: [:index] # rubocop:disable Layout/SpaceInsideArrayLiteralBrackets
  def index
    current_user
  end

def create
  user = User.find_by(email: params[:email])

  if user&.authenticate(params[:password])
    log_in(user)
    redirect_to session_index_path, notice: "Connexion réussie"

  else
    flash.now[:danger] = "Invalid email/password combination"
    render :new
  end
end

  def new
  end

  def destroy
    session.delete(:user_id)
    redirect_to new_session_path
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end
end
