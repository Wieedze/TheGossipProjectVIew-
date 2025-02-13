class UserController < ApplicationController
  def create
      @new_user = User.create!(user_params)
      if @new_user.save
        flash[:success] = "Profile créer avec succes !"
        redirect_to @gossip, notice: "Bienvenue sur TheGossipProject !"
      else
        flash[:error] = "Echec"
        puts params.inspect
      end
  end

  private

  def user_params
    params.require.(:new_user).permit(:email, :password)
  end
end
