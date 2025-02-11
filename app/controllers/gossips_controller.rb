class GossipsController < ApplicationController
  def new
    @gossip = Gossip.new
  end

  def create
    anonymous_user = User.find_by(first_name: "Anonymous") || User.create(first_name: "Anonymous", last_name: "User", email: "anonymous@example.com")
    @gossip = Gossip.new(gossip_params)
    @gossip.user = anonymous_user  # Associe le gossip à l'utilisateur anonyme
    if @gossip.save
      redirect_to @gossip, notice: "Gossip créé !"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @gossip = Gossip.find_by(id: params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @mgossip.update(gossip_params)
      redirect_to @gossip
    else
      render :edit
    end
  end

private

  def gossip_params
  params.require(:gossip).permit(:user_id, :title, :content)
  end
end
