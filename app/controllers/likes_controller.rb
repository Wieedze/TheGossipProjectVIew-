class LikesController < ApplicationController
  before_action :authenticate_user

  def index
    @likes=Like.all
  end

  def create
    @gossip = Gossip.find(params[:gossip_id])
    @like = Like.new(user_id: current_user.id, gossip_id: @gossip.id)
    if @like.save
      flash[:success] = "Like enregistré avec succès !"
      redirect_to accueil_index_path
    else
      redirect_to new_session_path, status: :unprocessable_entity
    end
  end

  def destroy
    @gossip = Gossip.find(params[:gossip_id])
    @like = @gossip.likes.find_by(user: current_user)
    if @like
    @like.destroy
    redirect_to accueil_index_path
    flash[:alert] = "Like suprrimé"
    else
    end
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end
end
