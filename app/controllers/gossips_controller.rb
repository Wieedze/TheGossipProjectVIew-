class GossipsController < ApplicationController
  def new
    @gossip = Gossip.new
  end
  def index
    @gossip=Gossip.all
  end

  def create
    anonymous_user = User.find_by(first_name: "anonymous") || User.create(first_name: "Anonymous", last_name: "User", email: "anonymous@example.com")
    @gossip = Gossip.new(gossip_params)
    @gossip.user = anonymous_user  # Associe le gossip à l'utilisateur anonyme
    if @gossip.save
      flash[:success] = "Potin enregistré avec succès !"
      redirect_to @gossip
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @gossip = Gossip.find_by(id: params[:id])
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(gossip_params)
      flash[:success] = "Le potin a été mis à jour avec succès."
      redirect_to @gossip
    else
      flash[:error] = "La mise à jour a échoué."
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    if @gossip.destroy
      flash[:success] = "Le gossip a été supprimé avec succès."
      redirect_to accueil_index_path, notice:
    else
      flash[:error] = "echec"
      render :edit
    end
  end

private

  def gossip_params
  params.require(:gossip).permit(:user_id, :title, :content)
  end
end
