class AuthorProfilController < ApplicationController
  def profil
    @user = User.find_by(first_name: params[:first_name])
  end
end
